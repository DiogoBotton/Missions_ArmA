_unidade = _this select 0;
_caller = _this select 1;
_actionId = _this select 2;

_unidade removeAction _actionId;

//_unidade action ["DropWeapon", "GroundWeaponHolder" createVehicle position player, currentWeapon _deadmanwalking];

_unidade setCaptive true;
_unidade action ["surrender", _unidade];

removeAllWeapons _unidade;

sleep 2;

_unidade attachTo [_caller,[0,1,0]];

_unidade addAction ["Soltar", "soltar.sqf"];