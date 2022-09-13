SFV_V = vehicle player;
moveOut player;
waitUntil {vehicle player == player};
player attachTo [SFV_V,[0,-0.3,-1.4]];
player setVariable ["st_mh6_enhance_ffv_active",true];
player setDir 360;
[31, [false, false, false], {player execVM "SFV\HMMWV\stopG.sqf"}] call CBA_fnc_addKeyHandler;
hint format ["CONTROLS \n\nAim+ALT to free-aim \n\nS to stop/reload"];