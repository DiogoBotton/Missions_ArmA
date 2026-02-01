execVM "briefing.sqf";

// SALVA OS PARÂMETROS DO LOBBY COMO VARIÁVEIS GLOBAIS
if (isNil "paramsArray") then
	{
    	if (isClass (missionConfigFile/"Params")) then
		{
        	for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do
			{
			_paramName = configName ((missionConfigFile >> "Params") select _i);
			missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
            		};
	        };
	} else

	{
	for "_i" from 0 to (count paramsArray - 1) do
		{
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
	        };
};

// ADQUIRE PARAMETROS Description.ext
debugar = (ParamDEBUGAR);
tempo = (ParamTempo);

wasKilled = false;
isPapacu = false;

if (playerSide == west) then {
	newPos = getMarkerPos(selectRandom ["respawn_west_1", "respawn_west_2", "respawn_west_3", "respawn_west_4", "respawn_west_5", "respawn_west_6"]);
	player setPos newPos;

	_pos = getMarkerPos "center_marker";
	triggerLeaveArea = createTrigger ["EmptyDetector", _pos];
	triggerLeaveArea triggerAttachVehicle [ player ];
	triggerLeaveArea setTriggerActivation ["VEHICLE", "NOT PRESENT", true];
	triggerLeaveArea setTriggerArea [400, 400, 0, false];
	triggerLeaveArea setTriggerStatements [ "this", "execVM ""warn.sqf"";", ""];
} else {
	isPapacu = true;
	newPos = getMarkerPos(selectRandom ["respawn_civilian_1", "respawn_civilian_2", "respawn_civilian_3", "respawn_civilian_4"]);
	player setPos newPos;
	player addAction ["Farejar presa", "farejar.sqf"];
};

sleep 5;

["Caçada ao Papacu", "Ruinas de Thronos"] spawn BIS_fnc_infoText;

if (isServer) then {
	execVM "time.sqf";
};