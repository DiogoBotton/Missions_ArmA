if (debugar == 1) then {
	sleep 60;
} else {
	sleep tempo;
};

_anyBluforAlive = { alive _x && side _x == west && isPlayer _x } count allUnits;

if (_anyBluforAlive > 0) then {
	// ["<t color='#ffffff' size = '1'>Os sobreviventes venceram!</t>",-1,-1,2,2,0,789] remoteExec ["BIS_fnc_dynamicText", 0];
	// sleep 2;
	["end1"] remoteExec ["BIS_fnc_endMission"];
};