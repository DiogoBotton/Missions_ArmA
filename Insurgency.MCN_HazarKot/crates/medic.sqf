/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\medic.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["ACE_Stretcher", 300];
	_this addMagazineCargo ["ACE_Tourniquet", 300];
	_this addMagazineCargo ["ACE_Bandage", 300];
	_this addMagazineCargo ["ACE_LargeBandage", 300];
	_this addMagazineCargo ["ACE_Morphine", 300];
	_this addMagazineCargo ["ACE_Epinephrine", 300];
	_this addMagazineCargo ["ACE_Medkit", 300];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};