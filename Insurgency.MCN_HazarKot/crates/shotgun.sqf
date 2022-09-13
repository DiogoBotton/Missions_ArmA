/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\shotgun.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addWeaponCargo ["AA12_PMC", 10];
	_this addMagazineCargo ["20Rnd_B_AA12_74Slug", 100];
	_this addMagazineCargo ["20Rnd_B_AA12_HE", 100];
	_this addMagazineCargo ["20Rnd_B_AA12_Pellets", 100];
	
	_this addWeaponCargo ["ACE_SPAS12", 10];
	_this addWeaponCargo ["M1014", 10];
	_this addWeaponCargo ["ACE_M1014_Eotech", 10];
	_this addMagazineCargo ["8Rnd_B_Beneli_74Slug", 100];
	_this addMagazineCargo ["8Rnd_B_Beneli_Pellets", 100];
	_this addMagazineCargo ["ACE_8Rnd_12Ga_Buck00", 100];
	_this addMagazineCargo ["ACE_8Rnd_12Ga_Slug", 100];
	
	_this addWeaponCargo ["Saiga12K", 10];
	_this addMagazineCargo ["8Rnd_B_Saiga12_74Slug", 100];
	_this addMagazineCargo ["8Rnd_B_Saiga12_Pellets", 100];
	_this addMagazineCargo ["ACE_8Rnd_12Ga_Buck00_Saiga12", 100];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};