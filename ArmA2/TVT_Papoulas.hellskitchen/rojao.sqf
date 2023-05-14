_object = _this select 0;
_quem = _this select 1;
_actionId = _this select 2;

_object removeAction _actionId;

sleep 2;
nul = [(_quem), "rojao"] call fn_netSay3D;