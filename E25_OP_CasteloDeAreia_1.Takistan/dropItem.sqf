_object = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_object removeAction _actionId;

if(_caller distance caixa1 <= 5) then {
	detach caixa1;
};
if(_caller distance caixa2 <= 5) then {
	detach caixa2;
};
if(_caller distance caixa3 <= 5) then {
	detach caixa3;
};
if(_caller distance caixa4 <= 5) then {
	detach caixa4;
};