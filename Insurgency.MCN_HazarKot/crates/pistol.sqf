/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\pistol.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["M9", 30];
	_this addWeaponCargo ["M9SD", 30];
	_this addMagazineCargo ["15Rnd_9x19_M9", 150];
	_this addMagazineCargo ["15Rnd_9x19_M9SD", 150];
	
	_this addWeaponCargo ["Colt1911", 30];
	_this addMagazineCargo ["7Rnd_45ACP_1911", 150];
	 
	_this addWeaponCargo ["revolver_EP1", 30];
	_this addWeaponCargo ["revolver_gold_EP1", 30];
	_this addMagazineCargo ["6Rnd_45ACP", 150];
	
	_this addWeaponCargo ["glock17_EP1", 30];
	_this addMagazineCargo ["17Rnd_9x19_glock17", 150];
	
	_this addWeaponCargo ["Sa61_EP1", 30];
	_this addMagazineCargo ["20Rnd_B_765x17_Ball", 150];
	_this addMagazineCargo ["10Rnd_B_765x17_Ball", 150];

	_this addWeaponCargo ["ACE_P8", 30];
	_this addMagazineCargo ["ACE_15Rnd_9x19_P8", 150];
	
	_this addWeaponCargo ["Makarov", 30];
	_this addWeaponCargo ["MakarovSD", 30];
	_this addMagazineCargo ["8Rnd_9x18_Makarov", 150];
	_this addMagazineCargo ["8Rnd_9x18_MakarovSD", 150];
	
	_this addWeaponCargo ["UZI_EP1", 30];
	_this addWeaponCargo ["UZI_SD_EP1", 30];
	_this addMagazineCargo ["30Rnd_9x19_UZI", 150];
	_this addMagazineCargo ["30Rnd_9x19_UZI_SD", 150];
	
	_this addWeaponCargo ["ACE_Glock18", 30];
	_this addMagazineCargo ["ACE_33Rnd_9x19_G18", 150];
	
	_this addWeaponCargo ["ACE_P226", 30];
	_this addMagazineCargo ["ACE_15Rnd_9x19_P226", 150];
	
	_this addWeaponCargo ["ACE_USP", 30];
	_this addWeaponCargo ["ACE_USPSD", 30];
	_this addMagazineCargo ["ACE_12Rnd_45ACP_USP", 150];
	_this addMagazineCargo ["ACE_12Rnd_45ACP_USPSD", 150];
		
	_this addWeaponCargo ["ACE_Flaregun", 30];
	_this addWeaponCargo ["ACE_MugLite", 30];
	_this addWeaponCargo ["ACE_SSVZ", 30];
	
	_this addWeaponCargo ["ACE_APS", 30];
	_this addWeaponCargo ["ACE_APSB", 30];
	_this addMagazineCargo ["ACE_20Rnd_9x18_APS", 150];
	_this addMagazineCargo ["ACE_20Rnd_9x18_APSB", 150];
	
	_this addWeaponCargo ["ACE_L9A1", 30];
	_this addMagazineCargo ["ACE_13Rnd_9x19_L9A1", 150];
	
	_this addWeaponCargo ["ACE_TT", 30];
	_this addMagazineCargo ["ACE_8Rnd_762x25_B_Tokarev", 150];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};