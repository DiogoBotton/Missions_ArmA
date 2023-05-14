_unidade = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

if(bombaExplodiu) exitWith {hint "A bomba já explodiu.";};
if(_caller distance _unidade > 2) exitWith {hint "Você precisa chegar mais perto para desarmar a bomba.";};

_unidade removeAction _actionId;

_caller addAction ["Cancelar Desarmamento", "cancelarDesarmamento.sqf"];

_contagemRegressiva = 60;

hint "Tempo para desarmar: 1 MINUTO.";

// Salva e remove arma principal do jogador
main_weapon = primaryWeapon player;
if (main_weapon != "") then
{
	player playMove "AidlPercMstpSnonWnonDnon04";
	sleep 2;
	player removeWeapon main_weapon;
};

_caller switchMove "RepairingKneel";

while {_contagemRegressiva > 0 && !cancelouDesarmamento && alive _caller} do {
	_contagemRegressiva = _contagemRegressiva - 1;
	sleep 1;
};

if(!cancelouDesarmamento && alive _caller) then {
	bombaDesarmada = true;
	publicVariable "bombaDesarmada";
}
else {
	hbA addAction ["Desarmar Bomba", "desarmarBomba.sqf"];
	cancelouDesarmamento = false;
	publicVariable "cancelouDesarmamento";
};

if(alive _caller) then {
	_caller switchMove "aidlpknlmstpslowwrfldnon_idlesteady02"; // Para a animação
}
else {
	_caller switchMove "";
};

// Restaura a arma primária
if (alive player && main_weapon != "") then
{
	player addWeapon main_weapon;
	player selectWeapon main_weapon;
	player selectWeapon (getArray (configFile >> "cfgWeapons" >> main_weapon >> "muzzles") select 0);
};

if(bombaDesarmada) then {
	hint "Bomba desarmada com sucesso!";
};