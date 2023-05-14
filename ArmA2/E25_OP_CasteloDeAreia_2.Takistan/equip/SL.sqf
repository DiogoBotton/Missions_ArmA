//
// Na inicialização da unidade, coloque:
//
// null = this execVM "equip\SL.sqf";
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
	_this addWeapon "ItemCompass";
	_this addWeapon "ItemWatch";
	_this addWeapon "ItemMap";
	_this addWeapon "ItemRadio";
	_this addWeapon "ACE_Earplugs";
	_this addWeapon "ACE_KeyCuffs";
	_this addWeapon "ItemGPS";
	_this addWeapon "Binocular";

	//ADICIONAR ARMA PRINCIPAL E MUNIÇÃO
	_this addWeapon "M16A2GL";
	for [{_z=1}, {_z <= 9}, {_z=_z+1}] do {	
		_this addMagazine "30Rnd_556x45_Stanag";
	};

	_this addWeapon "ACE_CharliePack_WMARPAT";
	[_this, "1Rnd_HE_M203", 8] call ACE_fnc_PackMagazine;
	[_this, "1Rnd_Smoke_M203", 4] call ACE_fnc_PackMagazine;
	[_this, "1Rnd_SmokeRed_M203", 2] call ACE_fnc_PackMagazine;
	[_this, "1Rnd_SmokeGreen_M203", 2] call ACE_fnc_PackMagazine;
	[_this, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;
	[_this, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
	[_this, "ACE_Medkit", 2] call ACE_fnc_PackMagazine;
	[_this, "ACE_LargeBandage", 5] call ACE_fnc_PackMagazine;
	[_this, ""] call ACE_fnc_PutWeaponOnBack;
};