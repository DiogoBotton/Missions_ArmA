SFV_V = vehicle player;
moveOut player;
waitUntil {vehicle player == player};
player attachTo [SFV_V,[0,-1.55,-1.25]];
player setVariable ["st_mh6_enhance_ffv_active",true];
player setDir 360;
[31, [false, false, false], {player execVM "SFV\SUV\stopG.sqf"}] call CBA_fnc_addKeyHandler;
hint format ["CONTROLS \n\nA\D to turn \n\nAim+ALT to free-aim \n\nS to stop/reload"];