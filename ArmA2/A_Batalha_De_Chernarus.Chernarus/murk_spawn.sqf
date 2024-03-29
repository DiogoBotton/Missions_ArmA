//    File: murk_spawn.sqf
//	Function: to allow for simple trigger based spawning using editor placed units and waypoints.
//		    The script deletes all units when the mission start and the recreate them on command.
//			The script also captures mission, so it can be loaded with murk_spawn_loaded.sqf.
//    Parameters: 
//			_this select 0: OBJECT - unit name (this) 
//			_this select 1: STRING - trigger name
//			_this select 2: STRING - spawn type ("once","repeated","wave" and "reset")
//			_this select 3 (optional): NUMBER - spawn lives (the amount of time the unit respawns, or wave number)
//			_this select 4 (optional): NUMBER - spawn delay
//			_this select 5 (optional): STRING - init string called for the leader of the group
//			_this select 6 (optional): NUMBER-  will start removal sequence of all dead group members after X seconds (default 120)


//	=== Usage: === 
//		Example trigger: Anybody Once (or whatever you want), onActivation: catch_trigger = "triggername"; publicVariable "catch_trigger"; 
//		Unit (leader of group):	nul = [this,"triggername","SPAWNTYPE",LIVES,DELAY] execVM "murk_spawn.sqf"; 
//		
//      Example: nul = [this,"triggername","once"] execVM "murk_spawn.sqf"; ---- Will spawn the editor unit once based on the trigger
//      Example: nul = [this,"triggername","repeated",4,30] execVM "murk_spawn.sqf"; ---- Will spawn the editor unit based on the trigger, then respawn it 4 times with a 30 second delay upon death
//      Example: nul = [this,"triggername","wave",5,60] execVM "murk_spawn.sqf"; ---- Will spawn the editor unit once based on the trigger, then respawn the entire group (regardless of deaths) 5 times with 60 seconds between
//      Example: nul = [this,"triggername","reset",5] execVM "murk_spawn.sqf"; ---- Will spawn the editor unit once based on the trigger, then reset the trigger after a preset time (15 seconds default). The unit will be created when trigger is true again, maximum number of lives.
// -----------------------------------------------------------------------------------------------------
//
// V8 (ArmAIIholic)
// - Waypoints are also remembered -- no dummy groups at all!!!
// - You get the output on Clipboard you can paste and execute. Added loader for Clipboard missions.
// V7 (ArmAIIholic)
// - Added GameLogic center to reduce number of dummy groups at the beginning, and in modes repeated and reset
// - Changed beginning scope to isServer, rather than using exitWith
// - Shortened initializing trigger part in init.sqf
// - Added original instructions and examples, adapted for v7
// - SQM is from v5 with some groups added
// V6 - Dedicated to Xeno, for his advice
// - Fix: Performance/effiency optimizations across the board
//	- Shortened parameters
// 	- Improved group cleanup, units in groups are now always deleted so that the group can be deleted
//	- New type of unit cleanup, no longer spawns eventhandlers for each unit
//	- Better array usage, no more additions over multiple arrays
//	- Moved the internal turret crew function out
//	- Further attempt to make vehicle/infantry storage and recreation more similar in order to cut code
// - Fix: Now supports mixed infantry and vehicle groups
// V5
// - Change: Removed group and function scripts, everything done in a single file
// - Change: Spawn trigger variable is now a setVariable of the trigger instead of a global variable
// - Add: Option to enable removal of dead units, eventhandler attached to everyone spawning
// - Fix: Should now work in multiplayer on a dedicated server (only tested on a local dedicated/join setup however)
// - Fix: Performance issues with helos from V4 resolved
// - Fix: Some minor bugs with the optional parameters
// - Fix: Now properly support crews in turrets-on-turrets (had to bring in some BIS made functions)
// V4
// - See older versions

// This script is serverside

// ---------------------------------------------------------
// Editado para funcionar com Headless Client (by WolFros_Fay4)
// Necessário declarar variável no init.sqf "HCPresente" a partir de parametros (description.ext)
// ---------------------------------------------------------
// V9 2022
// Edições de código:
// Foi acrescentado uma function para não duplicar o código desnecessáriamente
// Acrescentados linhas de código "fuel _vcl" e "_spawnUnit setFuel _unitFuel" nas linhas 99 e 266 para resgatar e definir valor de combustível caso for um carro

if(isNil "HCPresente") then {HCPresente = 0;};

fnc_murk_spawn = {
	// -------------------  Init  ----------------------- //
	_countThis = count _this;

	// ----------------  Parameters  -------------------- //
	_unit = _this select 0;
	_trigger = _this select 1;
	_spawntype = _this select 2;
	_spawnlives = if (_countThis >= 4) then { _this select 3; } else { 1 }; // Optional
	_spawndelay = if (_countThis >= 5) then { _this select 4; } else { 1 }; // Optional
	_initString = if (_countThis >= 6) then { _this select 5; } else { "" }; // Optional
	_bodyRemove = if (_countThis >= 7) then { _this select 6; } else { 900 }; // Optional

	// --  Delete the unit (this is always done ASAP)  -- //
	_unitArray = [];
	_unitGroup = group _unit;
	_unitsInGroup = units _unitGroup;
	_unitCount = count _unitsInGroup;
	_unitsInGroupAdd = [];
	_side = side _unitGroup;

	while { _unitCount > 0 } do { 
		// The currently worked on unit
		_unitsInGroup = units _unitGroup;
		_unit = _unitsInGroup select 0;
		_unitCount = count _unitsInGroup;
		// Check if its a vehicle
		if ( (vehicle _unit) isKindOf "LandVehicle" OR (vehicle _unit) isKindOf "Air") then { 
			_vcl = vehicle _unit;
			if (!(_vcl in _unitsInGroupAdd) AND (typeOf _vcl != "")) then {
				_unitsIngroupAdd set [count _unitsInGroupAdd, _vcl];
				_unitCrewArray = [];
				_crew = crew _vcl;
				{ _unitCrewArray set [count _unitCrewArray, typeOf _x]; } forEach _crew;
				_unitInfoArray = [typeOf _vcl,getPos _vcl,getDir _vcl,vehicleVarName _vcl,skill _vcl,rank _vcl,weapons _vcl,magazines _vcl,_unitCrewArray, fuel _vcl]; //Edited (GET fuel value)
				_unitArray set [count _unitArray, _unitInfoArray];
				deleteVehicle _vcl;
				{ deleteVehicle _x; } forEach _crew;
			};
		}
		// Otherwise its infantry
		else {
			_unitInfoArray = [typeOf _unit,getPos _unit,getDir _unit,vehicleVarName _unit,skill _unit,rank _unit,weapons _unit,magazines _unit,[]]; 
			_unitArray set [count _unitArray, _unitInfoArray];
			deleteVehicle _unit;
		};
		sleep 0.01;
	};

	// Gathering waypoints
	_countWaypoints = 0;
	_waypointsArray = [];
	_waypointsEntry = [];

	_countWaypoints = count(waypoints _unitGroup);

	for [{_i=0}, {_i < _countWaypoints}, {_i=_i+1}] do
	{
		_waypointsEntry = [];

		_wPos = waypointPosition [_unitGroup, _i];
		_wHPos = waypointHousePosition [_unitGroup, _i];
		_wBih = waypointBehaviour [_unitGroup, _i];
		_wCM = waypointCombatMode [_unitGroup, _i];
		_wCR = waypointCompletionRadius [_unitGroup, _i];
		_wDes = waypointDescription [_unitGroup, _i];
		_wForm = waypointFormation [_unitGroup, _i];
		_wScr = waypointScript [_unitGroup, _i];
		_wShw = waypointShow [_unitGroup, _i];
		_wSp = waypointSpeed [_unitGroup, _i];
		_wSt = waypointStatements [_unitGroup, _i]; //diag_log _wSt;
		_wTo = waypointTimeout [_unitGroup, _i];
		_wTy = waypointType [_unitGroup, _i];

		_waypointsEntry = _waypointsEntry + [_wPos] + [_wHPos] + [_wBih] + [_wCM] + [_wCR] + [_wDes] + [_wForm] + [_wScr] + [_wShw] + [_wSp] + [_wSt] + [_wTo] + [_wTy];

		_waypointsArray = _waypointsArray + [_waypointsEntry];
	};

	//diag_log format ["Waypoints' array : %1",_waypointsArray];

	deleteGroup _unitGroup;

	// --------------  Record mission  ------------------ //

	_gatherData = [];

	_gatherData = _gatherData + [_unitArray] + [_side] + [_waypointsArray] + [_trigger] + [_spawntype] + [_spawnlives] + [_spawndelay] + [_initString] + [_bodyRemove];

	Mission_capture = Mission_capture + [_gatherData];


	// -----------------  Functions  -------------------- //

	// *WARNING* BIS FUNCTION RIPOFF - Taken from fn_returnConfigEntry as its needed for turrets and shortened a bit
	_fnc_returnConfigEntry = {
		private ["_config", "_entryName","_entry", "_value"];
		_config = _this select 0;
		_entryName = _this select 1;
		_entry = _config >> _entryName;
		//If the entry is not found and we are not yet at the config root, explore the class' parent.
		if (((configName (_config >> _entryName)) == "") && (!((configName _config) in ["CfgVehicles", "CfgWeapons", ""]))) then {
			[inheritsFrom _config, _entryName] call _fnc_returnConfigEntry;
		}
		else { if (isNumber _entry) then { _value = getNumber _entry; } else { if (isText _entry) then { _value = getText _entry; }; }; };
		//Make sure returning 'nil' works.
		if (isNil "_value") exitWith {nil};
		_value;
	};

	// *WARNING* BIS FUNCTION RIPOFF - Taken from fn_fnc_returnVehicleTurrets and shortened a bit
	_fnc_returnVehicleTurrets = {
		private ["_entry","_turrets", "_turretIndex"];
		_entry = _this select 0;
		_turrets = [];
		_turretIndex = 0;
		//Explore all turrets and sub-turrets recursively.
		for "_i" from 0 to ((count _entry) - 1) do {
			private ["_subEntry"];
			_subEntry = _entry select _i;
			if (isClass _subEntry) then {
				private ["_hasGunner"];
				_hasGunner = [_subEntry, "hasGunner"] call _fnc_returnConfigEntry;
				//Make sure the entry was found.
				if (!(isNil "_hasGunner")) then {
					if (_hasGunner == 1) then {
						_turrets = _turrets + [_turretIndex];		
						//Include sub-turrets, if present.
						if (isClass (_subEntry >> "Turrets")) then { _turrets = _turrets + [[_subEntry >> "Turrets"] call _fnc_returnVehicleTurrets]; } 
						else { _turrets = _turrets + [[]]; };
					};
				};
				_turretIndex = _turretIndex + 1;
			};
		};
		_turrets;
	};

	_fnc_moveInTurrets = {	
		private ["_turrets","_path","_i"];
		_turrets = _this select 0;
		_path = _this select 1;
		_currentCrewMember = _this select 2;
		_crew = _this select 3;
		_spawnUnit = _this select 4;
		_i = 0;     
		while {_i < (count _turrets)} do { 
			 _turretIndex = _turrets select _i;
			_thisTurret = _path + [_turretIndex];
			(_crew select _currentCrewMember) moveInTurret [_spawnUnit, _thisTurret]; _currentCrewMember = _currentCrewMember + 1;
			//Spawn units into subturrets.
			[_turrets select (_i + 1), _thisTurret, _currentCrewmember, _crew, _spawnUnit] call _fnc_moveInTurrets;
			_i = _i + 2;
		};
	};

	// This is the general cleanup function running in the background for the group, replaces the removebody eventhandler and delete group in V5
	_fnc_cleanGroup = {
		_group = _this select 0;
		_unitsGroup = units _group;
		_sleep = _this select 1;
		// Hold until the entire group is dead
		while { ({alive _x} count _unitsGroup) > 0 } do { sleep 5; };
		sleep _sleep;
		{
			_origPos = getPos _x;
			_z = _origPos select 2;
			_desiredPosZ = if ( (vehicle _x) iskindOf "Man") then { (_origPos select 2) - 0.5 } else { (_origPos select 2) - 3 };
			if ( vehicle _x == _x ) then {
				_x enableSimulation false;
				while { _z > _desiredPosZ } do { 
					_z = _z - 0.01;
					_x setPos [_origPos select 0, _origPos select 1, _z];
					sleep 0.1;
				};
			};
			deleteVehicle _x; 
			sleep 5;
		} forEach _unitsGroup;		
		// Now we know that all units are deleted
		deleteGroup _group;
	};

	_fnc_spawnUnit = {
		// We need to pass the old group so we can copy waypoints from it, the rest we already know
		_oldGroup = _this select 0;
		_newGroup = createGroup (_this select 1);
		_waypointsArray = _this select 2;
		// If the old group doesnt have any units in it its a spawned group rather than respawned
		if ( count (units _oldGroup) == 0) then { deleteGroup _oldGroup; };
		{
			_spawnUnit = Object;
			_unitType = _x select 0; _unitPos  = _x select 1; _unitDir  = _x select 2;
			_unitName = _x select 3; _unitSkill = _x select 4; _unitRank = _x select 5;
			_unitWeapons = _x select 6; _unitMagazines = _x select 7; _unitCrew = _x select 8; _unitFuel = _x select 9;
			// Check if the unit has a crew, if so we know its a vehicle
			if (count _unitCrew > 0) then { 
				if (_unitPos select 2 >= 10) then { 
					_spawnUnit = createVehicle [_unitType,_unitPos, [], 0, "FLY"]; 
					_spawnUnit setVelocity [50 * (sin _unitDir), 50 * (cos _unitDir), 0];
				}
				else { _spawnUnit = _unitType createVehicle _unitPos; _spawnUnit setFuel _unitFuel;}; //Edited (SET fuel value)
				// Create the entire crew
				_crew = [];
	     			{ _unit = _newGroup createUnit [_x, getPos _spawnUnit, [], 0, "NONE"]; _crew set [count _crew, _unit]; } forEach _unitCrew;
		      	// We assume that all vehicles have a driver, the first one of the crew
				(_crew select 0) moveInDriver _spawnUnit;
				// Count the turrets and move the men inside	      	
		      	_turrets = [configFile >> "CfgVehicles" >> _unitType >> "turrets"] call _fnc_returnVehicleTurrets;
		      	[_turrets, [], 1, _crew, _spawnUnit] call _fnc_moveInTurrets; 	      	
			}
			// Otherwise its infantry
			else { 
				_spawnUnit = _newGroup createUnit [_unitType,_unitPos, [], 0, "NONE"]; 
				removeAllWeapons _spawnUnit;
				{_spawnUnit removeMagazine _x} forEach magazines _spawnUnit;
				removeAllItems _spawnUnit;
				{_spawnUnit addMagazine _x} forEach _unitMagazines;
				{_spawnUnit addWeapon _x} forEach _unitWeapons;
				_spawnUnit selectWeapon (primaryWeapon _spawnUnit);
			};
			// Set all the things common to the spawned unit
			_spawnUnit setDir _unitDir;
			_spawnUnit setSkill _unitSkill;
			_spawnUnit setUnitRank _unitRank;
			if (_spawntype == "once" OR _spawntype == "repeated") then { 
				_spawnUnit setVehicleVarName _unitName;
				if (vehiclevarname _spawnUnit != "") then { _spawnUnit setVehicleInit format["%1=this;",_unitName]; processInitCommands; };
			};
		} forEach _unitArray;

		private ["_i"]; _i = 0;

		//Let's return them their waypoints
		{
			//diag_log format ["All data : %1",_x];
			_wp = _newGroup addWaypoint [(_x select 0),0,_i];
			[_newGroup, _i] setWaypointHousePosition (_x select 1);	
			[_newGroup, _i] setWaypointBehaviour (_x select 2);
			[_newGroup, _i] setWaypointCombatMode (_x select 3);
			[_newGroup, _i] setWaypointCompletionRadius (_x select 4);
			[_newGroup, _i] setWaypointDescription (_x select 5);
			[_newGroup, _i] setWaypointFormation (_x select 6);
			[_newGroup, _i] setWaypointScript (_x select 7);
			[_newGroup, _i] showWaypoint (_x select 8);
			[_newGroup, _i] setWaypointSpeed (_x select 9);
			[_newGroup, _i] setWaypointStatements (_x select 10);
			[_newGroup, _i] setWaypointTimeout (_x select 11);
			[_newGroup, _i] setWaypointType (_x select 12);

			_i = _i + 1;

		} forEach _waypointsArray;

		// Setting the leaders init and the groups body removal time
		(vehicle (leader _newGroup)) setVehicleInit _initString; processInitCommands;
		// Run the cleanup function for this group
		[_newGroup, _bodyRemove] spawn _fnc_cleanGroup;

		// Have to return the new group
		_newGroup;
	};

	//diag_log format ["Number of groups : %1",(count allGroups)];

	// --------------  Waiting period  ------------------ //
	while {isNil "catch_trigger"} do {
		sleep 1;
	};
	waitUntil { _trigger == catch_trigger };

	// ---------------  Spawn Modes  ------------------- //
	// REPEAT MODE, i.e. basic respawn based on lives
	if (_spawntype == "repeated") then {
		while { _spawnlives > 0 } do {
			_unitGroup = [_unitGroup,_side,_waypointsArray] call _fnc_spawnUnit;
			_spawnLives = _spawnLives - 1;
			_unitsGroup = units _unitGroup;	
			while { ({alive _x} count _unitsGroup) > 0 } do { sleep 2; };
			sleep _spawndelay;
		};
	};

	// WAVE MODE, this is fairly simple, just sleep a while then respawn. Spawnlives in this case is number of waves
	if (_spawntype == "wave") then {
		while { _spawnlives > 0 } do {
			_unitGroup = [_unitGroup,_side,_waypointsArray] call _fnc_spawnUnit;
			_spawnLives = _spawnLives - 1;
			sleep _spawndelay;
		};
	};

	// RESET MODE, sleep a while then set the variable to false (even if you set it like 50 times over). Spawn lives is used to tick how many times its possible to reset.
	if (_spawntype == "reset") then {
		while { _spawnlives > 0 } do {
			_unitGroup = [_unitGroup,_side,_waypointsArray] call _fnc_spawnUnit;
			_spawnLives = _spawnLives - 1;
			sleep 15;
			catch_trigger = "none";
			waitUntil {_trigger == catch_trigger};
		};
	};

	// ONCE MODE
	if (_spawntype == "once") then { _unitGroup = [_unitGroup,_side,_waypointsArray] call _fnc_spawnUnit; };
};

////////////////////////////////////////////////////////////////////
// Caso HC estiver presente
////////////////////////////////////////////////////////////////////
if(HCPresente == 1) then {
	if(!hasInterface && !isDedicated) then 
	{
		call fnc_murk_spawn;
	};
} else {
	////////////////////////////////////////////////////////////////////
	// Caso HC NÃO estiver presente
	////////////////////////////////////////////////////////////////////
	if(isServer) then 
	{
		call fnc_murk_spawn;
	};
}