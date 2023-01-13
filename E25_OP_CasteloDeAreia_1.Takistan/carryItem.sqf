_object = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

sleep 1;

_object attachTo [_caller,[0.1, 2, 0.7]];

_caller addAction ["Soltar Caixa", "dropItem.sqf"];