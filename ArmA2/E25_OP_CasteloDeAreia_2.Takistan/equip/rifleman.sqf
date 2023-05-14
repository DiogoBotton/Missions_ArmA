//
// Na inicialização da unidade, coloque:
//
// null = this execVM "equip\rifleman.sqf";
//

if(alive _this) then {
	removeAllWeapons _this;

	sleep 10;

	// Remover tudo da unidade
	removeAllWeapons _this;
	removeAllItems _this;
	removeBackpack _this;

	// Equipamento comum americano
	_this addMagazine "HandGrenade_West";
	_this addMagazine "HandGrenade_West";
	_this addMagazine "SmokeShell";
	_this addMagazine "ACE_LargeBandage";
	_this addMagazine "ACE_LargeBandage";
	_this addMagazine "ACE_LargeBandage";
	_this addMagazine "ACE_LargeBandage";
	_this addMagazine "ACE_Medkit";
	_this addMagazine "ACE_Epinephrine";
	_this addMagazine "ACE_Morphine";
	_this addMagazine "ACE_Morphine";
	_this addWeapon "ItemCompass";
	_this addWeapon "ItemWatch";
	_this addWeapon "ItemMap";
	_this addWeapon "ItemRadio";
	_this addWeapon "ACE_Earplugs";
	_this addWeapon "ACE_KeyCuffs";

	//ADICIONAR ARMA PRINCIPAL E MUNIÇÃO			
	_this addWeapon "M16A2";
	for [{_z=1}, {_z <= 9}, {_z=_z+1}] do {	
		_this addMagazine "30Rnd_556x45_Stanag";
	};
};