_quem = _this select 1;
_ROSNAR = ["ROSNAR1","ROSNAR2","ROSNAR3"];
_ROSNAR = _ROSNAR call BIS_fnc_selectRandom;
nul = [_quem, _ROSNAR] call fn_netSay3D;
