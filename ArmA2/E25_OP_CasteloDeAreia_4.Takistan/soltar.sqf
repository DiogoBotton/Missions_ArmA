_unidade = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_unidade removeAction _actionId;

detach coronel_aziz;

coronel_aziz addAction ["Algemar", "prender.sqf"];

renderUnidade = false;
publicVariable "renderUnidade";

// Restaura a arma primária
if (alive player && main_weapon != "") then
{
	player addWeapon main_weapon;
	player selectWeapon main_weapon;
	player selectWeapon (getArray (configFile >> "cfgWeapons" >> main_weapon >> "muzzles") select 0);
};