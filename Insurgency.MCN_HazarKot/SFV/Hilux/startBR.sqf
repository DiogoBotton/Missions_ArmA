SFV_V = vehicle player;
moveOut player;
waitUntil {vehicle player == player};
player attachTo [SFV_V,[0,-1.9,-0.75]];
player setVariable ["st_mh6_enhance_ffv_active",true];
player setDir 180;
[31, [false, false, false], {player execVM "SFV\Hilux\stopBR.sqf"}] call CBA_fnc_addKeyHandler;
hint format ["CONTROLS \n\nAim+ALT to free-aim \n\nS to stop/reload"];
player allowdamage false;