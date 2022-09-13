/*  
=========================================================
  Simple Vehicle Respawn Script v1.7
  by Tophe of Östgöta Ops [OOPS]
  
  Put this in the vehicles init line:
  veh = [this] execVM "vehicle.sqf"


  Options:
  There are some optional settings. The format for these are:
  veh = [this, Delay, Deserted timer, Respawns, Effect, Static] execVM "vehicle.sqf"

  
> Respawn in 30 Sekunden 
	veh = [this, 15] execVM "vehicle.sqf"


> Respawn-Zeit, wenn Fahrzeug verlassen wird, aber nicht zerstört ist: 
	Zuerst die Respawn-Verzögerung, dann der verlassene Fahrzeugzeitmesser. (0 = deaktiviert)  
		veh = [this, 15, 10] execVM "vehicle.sqf"


> Standardmäßig ist die Zahl von Respwans unendlich. 
	Um eine Grenze festzulegen, setze zuerst die anderen Werte dann die Anzahl der begrenztern Respawns (0 = unendlich).
		veh = [this, 15, 10, 5] execVM "vehicle.sqf"


> Veranlasse den Wert TRUE, um eine spezielle Explosionswirkung zum Wrack hinzuzufügen, wenn es respawnt. 
	Der wert FALSE wird das Wrack einfach verschwinden lassen.
		veh = [this, 15, 10, 5, TRUE] execVM "vehicle.sqf"
  

> Standardmäßig wird das Fahrzeug zum Punkt respawnen, wo es zuerst stand als die Mission anfing (statisch).
  Das kann dynamisch geändert werden. Dann wird das Fahrzeug an der Position respawnen, wo es zerstört wurde. 
  	Setze zuerst alle anderen Werte und dann TRUE für Respawnort am Todesort oder FALSE für statischen Respawn.
		veh = [this, 15, 10, 5, TRUE, TRUE] execVM "vehicle.sqf"
  



> Wenn du willst, dass das gerespawnte Fahrzeugs halben Schaden beibehält, 
	Zuerst alle anderen Werte setzen, dann Initzeile mit setDammage vervollständigen.
		veh = [this, 15, 10, 5, TRUE, FALSE, "this setDammage 0.5"] execVM "vehicle.sqf"
  
  Default values of all settings are:
  veh = [this, 30, 120, 0, FALSE, FALSE] execVM "vehicle.sqf"
  


	
Contact & Bugreport: harlechin@hotmail.com

=========================================================
*/
  
if (!isServer) exitWith {};

// Define variables
_unit = _this select 0;
_delay = if (count _this > 1) then {_this select 1} else {30};
_deserted = if (count _this > 2) then {_this select 2} else {120};
_respawns = if (count _this > 3) then {_this select 3} else {0};
_explode = if (count _this > 4) then {_this select 4} else {false};
_dynamic = if (count _this > 5) then {_this select 5} else {false};
_unitinit = if (count _this > 6) then {_this select 6} else {};
_haveinit = if (count _this > 6) then {true} else {false};

_hasname = false;
_unitname = vehicleVarName _unit;
if (isNil _unitname) then {_hasname = false;} else {_hasname = true;};
_noend = true;
_run = true;
_rounds = 0;

if (_delay < 0) then {_delay = 0};
if (_deserted < 0) then {_deserted = 0};
if (_respawns <= 0) then {_respawns= 0; _noend = true;};
if (_respawns > 0) then {_noend = false};

_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;


// Start monitoring the vehicle
while {_run} do 
{	
	sleep (2 + random 10);
      if ((getDammage _unit > 0.8) and ({alive _x} count crew _unit == 0)) then {_dead = true};

	// Check if the vehicle is deserted.
	if (_deserted > 0) then
	{
		if ((getPosASL _unit distance _position > 10) and ({alive _x} count crew _unit == 0) and (getDammage _unit < 0.8)) then 
		{
			_timeout = time + _deserted;
			sleep 0.1;
		 	waitUntil {_timeout < time or !alive _unit or {alive _x} count crew _unit > 0};
			if ({alive _x} count crew _unit > 0) then {_dead = false}; 
			if ({alive _x} count crew _unit == 0) then {_dead = true; _nodelay =true}; 
			if !(alive _unit) then {_dead = true; _nodelay = false}; 
		};
	};

	// Respawn vehicle
      if (_dead) then 
	{	
		if (_nodelay) then {sleep 0.1; _nodelay = false;} else {sleep _delay;};
		if (_dynamic) then {_position = getPosASL _unit; _dir = getDir _unit;};
		if (_explode) then {_effect = "M_TOW_AT" createVehicle getPosASL _unit; _effect setPosASL getPosASL _unit;};
		sleep 0.1;

		deleteVehicle _unit;
		sleep 2;
		_unit = _type createVehicle _position;
		_unit setPosASL _position;
		_unit setDir _dir;

		if (_haveinit) then 
					{_unit setVehicleInit format ["%1;", _unitinit];
					processInitCommands;};
		if (_hasname) then 
					{_unit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_unitname];
					processInitCommands;};
		_dead = false;

		// Check respawn amount
		if !(_noend) then {_rounds = _rounds + 1};
		if ((_rounds == _respawns) and !(_noend)) then {_run = false;};
	};
};