private ["_obj","_snd", "_dtc"];

_obj = _this select 0;	//object
_snd = _this select 1;	//sound
_dtc = _this select 2;	//distance

//transmitir pv
PVEH_netSay3D = [_obj,_snd, _dtc];
publicVariable "PVEH_netSay3D";

// roda na maquina local também se nao estiver no dedicado
if (not isDedicated) then {_obj say3D [_snd, _dtc, 1]};

true