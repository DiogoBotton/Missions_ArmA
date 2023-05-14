_unidade = _this select 0;
_caller = _this select 1;

if(bombaExplodiu) exitWith {hint "A bomba já explodiu.";};
if(bombaDesarmada) exitWith {hint "A bomba já foi desarmada.";};
if(_caller distance _unidade > 2) exitWith {hint "Você precisa chegar mais perto para ver o relógio da bomba.";};

hint format ["Tempo restante para a bomba explodir: %1 segundos.", timeBomb];