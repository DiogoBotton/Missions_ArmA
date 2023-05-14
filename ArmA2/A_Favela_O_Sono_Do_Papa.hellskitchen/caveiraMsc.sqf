_object = _this select 0;
_actionId = _this select 2;

_object removeAction _actionId;

nul = [caveirao, "caveira"] call fn_netSay3D;