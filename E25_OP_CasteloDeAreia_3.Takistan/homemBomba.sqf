_timeSleep = [1200, 1500, 1800, 2100];
//_timeSleepTeste = [30, 40, 50, 60];

if(isServer) then {
	_timeSleepRandom = _timeSleep call BIS_fnc_selectRandom;
	sleep _timeSleepRandom;

	_hb = CreateGroup civilian;
	_hb createUnit ["TK_CIV_Takistani01_EP1", (getMarkerPos "hb_spawn"), [], 0, "CANCOLLIDE"];

	{
		_x disableAI "FSM"; 
		_x setBehaviour "CARELESS";
		_x allowFleeing 0;
		_x setSkill ["courage", 1];
		_x move getMarkerPos "carMarker";
		hb = _x;
	} forEach units group (leader _hb);

	while {(alive hb && !unitReady hb)} do 
	{
		sleep 1;
	};

	if(!alive hb) exitWith{civilTropasInimigas setDamage 1;};

	hb move getMarkerPos "pipeMarker";

	while {(alive hb && !unitReady hb)} do 
	{
		sleep 1;
	};

	if(!alive hb) exitWith{civilTropasInimigas setDamage 1;};

	stopAnim = true;
	publicVariable "stopAnim";

	nul = [(hb), "allahuakbar"] call fn_netSay3D;

	sleep 4;
	
	if(alive hb) then{
		_boom = "Sh_105_HE" createVehicle (position hb);
	};

	civilTropasInimigas setDamage 1;
};