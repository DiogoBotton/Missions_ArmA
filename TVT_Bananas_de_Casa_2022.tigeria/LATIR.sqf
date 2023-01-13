_quem = _this select 1;
_LATIR = ["latir1","latir2","latir3"];
_LATIR = _LATIR call BIS_fnc_selectRandom;
nul = [_quem, _LATIR] call fn_netSay3D;
