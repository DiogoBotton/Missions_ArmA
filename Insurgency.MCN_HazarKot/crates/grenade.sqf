/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\grenade.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addMagazineCargo ["HandGrenade_Stone", 100];
	_this addMagazineCargo ["Smokeshell", 100];
	_this addMagazineCargo ["ACE_DM25", 100];
	_this addMagazineCargo ["ACE_RDG2", 100];
	_this addMagazineCargo ["ACE_RDGM", 100]; 
	_this addMagazineCargo ["Smokeshellred", 100];
	_this addMagazineCargo ["ACE_DM33", 100];
	_this addMagazineCargo ["Smokeshellgreen", 100];
	_this addMagazineCargo ["ACE_DM31", 100];
	_this addMagazineCargo ["SmokeShellYellow", 100];
	_this addMagazineCargo ["ACE_DM36", 100];
	_this addMagazineCargo ["SmokeShellOrange", 100];
	_this addMagazineCargo ["ACE_DM32", 100];
	_this addMagazineCargo ["SmokeShellPurple", 100];
	_this addMagazineCargo ["ACE_DM34", 100];
	_this addMagazineCargo ["SmokeShellBlue", 100];
	_this addMagazineCargo ["HandGrenade_West", 100];
	_this addMagazineCargo ["HandGrenade_East", 100];
	_this addMagazineCargo ["BAF_L109A1_HE", 100];
	_this addMagazineCargo ["HandGrenade", 100];
	_this addMagazineCargo ["ACE_DM51", 100];
	_this addMagazineCargo ["ACE_DM51A1", 100];
	_this addMagazineCargo ["ace_flashbang", 100];
	_this addMagazineCargo ["ace_flashbang2", 100];
	_this addMagazineCargo ["ACE_Flashbang9", 100];
	_this addMagazineCargo ["ace_m84", 100];
	_this addMagazineCargo ["ace_torch_c", 100];
	_this addMagazineCargo ["ace_m7a3", 100];
	_this addMagazineCargo ["ACE_RG60A", 100];
	_this addMagazineCargo ["ace_m34", 100];
	_this addMagazineCargo ["ACE_M15", 100];
	_this addMagazineCargo ["ACE_ANM14", 100];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////


// Restock time.
sleep 1800;
};