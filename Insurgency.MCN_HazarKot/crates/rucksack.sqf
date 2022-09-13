/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\rucksack.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addWeaponCargo ["ACE_ParachutePack", 100];
	_this addWeaponCargo ["ACE_ParachuteRoundPack", 100];
	
	_this addWeaponCargo ["ACE_APOBS_A", 30];
	_this addWeaponCargo ["ACE_APOBS_B", 30];
	
	_this addWeaponCargo ["ACE_ALICE_Backpack", 30];
	_this addWeaponCargo ["ACE_AssaultPack_BAF", 30];
	_this addWeaponCargo ["ACE_BackPack", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR_DDPM", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR_DPM", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR_FL", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR_MTP", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR_TT", 30];
	_this addWeaponCargo ["ACE_Backpack_ACU", 30];
	_this addWeaponCargo ["ACE_Backpack_CivAssault", 30];
	_this addWeaponCargo ["ACE_Backpack_FL", 30];
	_this addWeaponCargo ["ACE_Backpack_Multicam", 30];
	_this addWeaponCargo ["ACE_Backpack_Olive", 30];
	_this addWeaponCargo ["ACE_Backpack_RPG", 30];
	_this addWeaponCargo ["ACE_Backpack_TT", 30];
	_this addWeaponCargo ["ACE_BackPack_ACR_Small", 30];
	_this addWeaponCargo ["ACE_Backpack_US", 30];	
	_this addWeaponCargo ["ACE_Backpack_Wood", 30];
	_this addWeaponCargo ["ACE_CharliePack", 30];
	_this addWeaponCargo ["ACE_CharliePack_ACU", 30];
	_this addWeaponCargo ["ACE_CharliePack_ACU_Medic", 30];
	_this addWeaponCargo ["ACE_CharliePack_FLORA", 30];	
	_this addWeaponCargo ["ACE_CharliePack_Multicam", 30];
	_this addWeaponCargo ["ACE_CharliePack_WMARPAT", 30];
	_this addWeaponCargo ["ACE_Combat_Pack", 30];
	_this addWeaponCargo ["ACE_Coyote_Pack", 30];
	_this addWeaponCargo ["ACE_Coyote_Pack_Black", 30];	
	_this addWeaponCargo ["ACE_Coyote_Pack_Flora", 30];
	_this addWeaponCargo ["ACE_Coyote_Pack_Multicam", 30];
	_this addWeaponCargo ["ACE_Coyote_Pack_Wood", 30];
	_this addWeaponCargo ["ACE_FAST_PackEDC", 30];
	_this addWeaponCargo ["ACE_FAST_PackEDC_ACU", 30];
	_this addWeaponCargo ["ACE_Rucksack_EAST", 30];
	_this addWeaponCargo ["ACE_Rucksack_EAST_Medic", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_ACU", 30];	
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_ACU_Medic", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Brown", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Brown_Medic", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_DMARPAT", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_DMARPAT_Medic", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Green", 30];	
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Green_Medic", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_WMARPAT", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_WMARPAT_Medic", 30];
	_this addWeaponCargo ["ACE_Rucksack_MOLLE_Wood", 30];
	_this addWeaponCargo ["ACE_Rucksack_RD54", 30];
	_this addWeaponCargo ["ACE_Rucksack_RD90", 30];	
	_this addWeaponCargo ["ACE_Rucksack_RD91", 30];
	_this addWeaponCargo ["ACE_Rucksack_RD92", 30];
	_this addWeaponCargo ["ACE_Rucksack_RD99", 30];
	_this addWeaponCargo ["ACE_VTAC_RUSH72", 30];
	_this addWeaponCargo ["ACE_VTAC_RUSH72_ACU", 30];
	_this addWeaponCargo ["ACE_VTAC_RUSH72_FT_MEDIC", 30];
	_this addWeaponCargo ["ACE_VTAC_RUSH72_OD", 30];
	_this addWeaponCargo ["ACE_VTAC_RUSH72_TT_MEDIC", 30];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};