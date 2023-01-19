_object = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_object removeAction _actionId;

partirHeli = true;
publicVariable "partirHeli";