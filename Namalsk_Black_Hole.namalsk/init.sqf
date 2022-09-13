// The following code is join in progress compatiable init.sqf scripting.
// Client side scripts should be run in the first two sections
// The first two sections are identical and may appear redundent, but are required for Join in progress compatability in multiplayer.
// The final section is for server side scripts.


//non-JIP player, someone who's went through role selection and briefing
if (!(isNull player)) then 
	{
	// =============================================================
	// GeneralCarver Vehicle Flip Script v2 Init Scripting

	gc_veh_flip_script_script_action_manager = execVM "scripts\gc_veh_flip\action_manager.sqf";

	//
	// =============================================================
	};

//JIP player, role selection then right into mission.
if (!isServer && isNull player) then 
	{
	waitUntil {!isNull player};

	// =============================================================
	// GeneralCarver Vehicle Flip Script v2 Init Scripting

	gc_veh_flip_script_script_action_manager = execVM "scripts\gc_veh_flip\action_manager.sqf";

	//
	// =============================================================
	};	
	
//server
if (isServer) then 
	{
	};

//Init UPSMON scritp (must be run on all clients)
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";	
//Process statements stored using setVehicleInit
processInitCommands;
//Finish world initialization before mission is launched. 
finishMissionInit;	
	
switch (paramsArray select 0) do {
  case 0: { 0 setOvercast 0; 0 setRain 0; };
  case 1: { 0 setOvercast 0.8; 0 setRain 0.3; };
  case 2: { 0 setOvercast 0.9; 0 setRain 0.6; };
  case 3: { 0 setOvercast 1; 0 setRain 1; };
};

switch (paramsArray select 1) do {
  case 0: { 0 setFog 0; };
  case 1: { 0 setFog 0.3; };
  case 2: { 0 setFog 0.6; };
  case 3: { 0 setFog 1; };
}; 

// --- Info text
waitUntil{!(isNil "BIS_fnc_init")};
sleep 15;
	["January 13, 2013", "22:00"] call BIS_fnc_infoText;
sleep 3;
	["Dark", "Hole"] call BIS_fnc_infoText;
sleep 3;
	["Created by", "Phantom Six"] call BIS_fnc_infoText;