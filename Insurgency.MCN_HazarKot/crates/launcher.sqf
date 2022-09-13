/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\launcher.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["M136", 100];
	_this addWeaponCargo ["ACE_M136_CSRS", 100];	
	_this addWeaponCargo ["BAF_NLAW_Launcher", 100];
	_this addWeaponCargo ["ACE_M72", 100];
	_this addWeaponCargo ["ACE_M72A2", 100];
	
	_this addWeaponCargo ["ACE_RMG", 100];
	_this addWeaponCargo ["RPG18", 100];
	_this addWeaponCargo ["ACE_RPG22", 100];
	_this addWeaponCargo ["ACE_RPG27", 100];
	_this addWeaponCargo ["ACE_RPOM", 100];
	_this addWeaponCargo ["ACE_RSHG1", 100];
	
	_this addWeaponCargo ["M47Launcher_EP1", 30];
	_this addWeaponCargo ["ACE_M47_Daysight", 30];
	_this addMagazineCargo ["Dragon_EP1", 30];
		
	_this addWeaponCargo ["MAAWS", 30];
	_this addMagazineCargo ["ACE_MAAWS_HE", 100];
	_this addMagazineCargo ["MAAWS_HEAT", 100];
	_this addMagazineCargo ["MAAWS_HEDP", 100];
	
	_this addWeaponCargo ["SMAW", 30];
	_this addMagazineCargo ["ACE_SMAW_NE", 100];
	_this addMagazineCargo ["SMAW_HEAA", 100];
	_this addMagazineCargo ["SMAW_HEDP", 100];
	_this addMagazineCargo ["ACE_SMAW_Spotting", 5];
	
	_this addWeaponCargo ["STINGER", 30];
	_this addMagazineCargo ["STINGER", 100];
	
	_this addWeaponCargo ["JAVELIN", 100];
	_this addWeaponCargo ["ACE_Javelin_CLU", 100];	
	
	_this addWeaponCargo ["ACE_RPG29", 30];
	_this addMagazineCargo ["ACE_RPG29_PG29", 100];
	_this addMagazineCargo ["ACE_RPG29_TBG29", 100];
	
	_this addWeaponCargo ["RPG7V", 30];
	_this addWeaponCargo ["ACE_RPG7V_PGO7", 30];
	_this addMagazineCargo ["ACE_OG7_PGO7", 100];
	_this addMagazineCargo ["ACE_PG7V_PGO7", 100];
	_this addMagazineCargo ["ACE_PG7VL_PGO7", 100];
	_this addMagazineCargo ["ACE_PG7VM", 100];
	_this addMagazineCargo ["ACE_PG7VM_PGO7", 100];
	_this addMagazineCargo ["ACE_PG7VR_PGO7", 100];
	_this addMagazineCargo ["ACE_TBG7V", 100];
	_this addMagazineCargo ["ACE_TBG7V_PGO7", 100];
	
	_this addWeaponCargo ["Igla", 30];
	_this addMagazineCargo ["Igla", 100];
	
	_this addWeaponCargo ["Strela", 30];
	_this addMagazineCargo ["Strela", 100];
	
	_this addWeaponCargo ["MetisLauncher", 30];
	_this addMagazineCargo ["ACE_AT13TB", 100];
	_this addMagazineCargo ["ACE_AT13", 100];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};