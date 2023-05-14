if(!alive coronel_aziz) exitWith {hint "Unidade já esta morta.";};

_unidade = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_unidade removeAction _actionId;

// Salva e remove arma principal do jogador
main_weapon = primaryWeapon player;
if (main_weapon != "") then
{
	player playMove "AidlPercMstpSnonWnonDnon04";
	sleep 2;
	player removeWeapon main_weapon;
};

renderUnidade = true;
publicVariable "renderUnidade";

if(_unidade hasWeapon "revolver_gold_EP1") then {sleep 6;};

sleep 2;

_unidade attachTo [_caller,[0,1,0]];

_caller addAction ["Soltar", "soltar.sqf"];

while {renderUnidade && alive player} do
{
	if (vehicle player != player) then
	{
		player globalChat "Você não pode entrar no veículo enquanto não largar o prisioneiro.";
		player action ["eject", vehicle player];
		sleep 1;
	};
	
	if ([0,0,0] distance (velocity player) > 2.8) then
	{
		player globalChat "Você precisa andar lentamente enquanto carrega o prisioneiro.";
		player playMove "AmovPpneMstpSnonWnonDnon";
		sleep 1;
	};
	
	sleep 0.25;
};

if(!alive player) then {
	detach _unidade;
	renderUnidade = false;
	publicVariable "renderUnidade";
};