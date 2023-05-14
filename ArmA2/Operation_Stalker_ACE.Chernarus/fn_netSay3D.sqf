private ["_obj","_snd"];

_obj = _this select 0;	//object
_snd = _this select 1;	//sound

//transmitir pv
PVEH_netSay3D = [_obj,_snd];
publicVariable "PVEH_netSay3D";

// roda na maquina local também se nao estiver no dedicado
if (not isDedicated) then {_obj say3D _snd};

true