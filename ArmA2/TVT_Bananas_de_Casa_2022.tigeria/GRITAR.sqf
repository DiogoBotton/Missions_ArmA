_quem = _this select 1;
_GRITOMST = ["mst1","mst2","mst3","mst4","mst5","mst6","mst7","mst8"];
_GRITOMST = _GRITOMST call BIS_fnc_selectRandom;
nul = [_quem, _GRITOMST] call fn_netSay3D;