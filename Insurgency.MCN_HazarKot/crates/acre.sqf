/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\acre.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["ACRE_PRC148", 60];
	_this addWeaponCargo ["ACRE_PRC148_UHF", 60];
	_this addWeaponCargo ["ACRE_PRC152", 60];
	_this addWeaponCargo ["ACRE_PRC343", 60];
	_this addWeaponCargo ["ACRE_PRC119", 60];
	_this addWeaponCargo ["ACRE_PRC117F", 60];
	_this addWeaponCargo ["ACE_ANPRC77", 60];
	_this addWeaponCargo ["ACE_PRC119", 60];
	_this addWeaponCargo ["ACE_P159_RD54", 60];
	_this addWeaponCargo ["ACE_P159_RD90", 60];
	_this addWeaponCargo ["ACE_P159_RD99", 60];

/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////


// Restock time.
sleep 1800;
};