private ["_obj","_snd"];

_obj = _this select 0;	//object
_snd = _this select 1;	//sound

// broadcast PV
PVEH_netSay3D = [_obj,_snd];
publicVariable "PVEH_netSay3D";

// run on current machine also if not dedi server
if (not isDedicated) then {_obj say3D _snd};

true