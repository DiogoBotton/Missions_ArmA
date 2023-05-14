_unidade = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_unidade removeAction _actionId;

if(bombaDesarmada) exitWith {hint "A bomba já foi desarmada.";};

cancelouDesarmamento = true;
publicVariable "cancelouDesarmamento";