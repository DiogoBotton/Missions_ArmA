_unidade = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_unidade removeAction _actionId;

detach _unidade;

_unidade addAction ["Algemar", "prender.sqf"];