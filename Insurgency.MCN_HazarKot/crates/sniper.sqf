/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\sniper.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addWeaponCargo ["VSS_vintorez", 5];
	_this addMagazineCargo ["10Rnd_9x39_SP5_VSS", 50];
	_this addMagazineCargo ["20Rnd_9x39_SP5_VSS", 50];
	_this addMagazineCargo ["ACE_10Rnd_9x39_SP6_VSS", 50];
	_this addMagazineCargo ["ACE_20Rnd_9x39_SP6_VSS", 50];

	_this addWeaponCargo ["ACE_G3SG1", 5];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_G3", 50];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_G3", 50];	
	
	_this addWeaponCargo ["M24_des_EP1", 5];
	_this addWeaponCargo ["M24", 5];
	_this addWeaponCargo ["M40A3", 5];
	_this addMagazineCargo ["5Rnd_762x51_M24", 50];
	_this addMagazineCargo ["ACE_5Rnd_762x51_T_M24", 50];
	
	_this addWeaponCargo ["huntingrifle", 5];
	_this addMagazineCargo ["5x_22_LR_17_HMR", 50];
		
	_this addWeaponCargo ["DMR", 5];
	_this addMagazineCargo ["20Rnd_762x51_DMR", 50];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_DMR", 50];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_M14", 50];
	_this addMagazineCargo ["ACE_20Rnd_762x51_S_M14", 50];
		
	_this addWeaponCargo ["SCAR_H_LNG_Sniper", 5];
	_this addWeaponCargo ["SCAR_H_LNG_Sniper_SD", 5];
	_this addMagazineCargo ["20Rnd_762x51_B_SCAR", 50];
	_this addMagazineCargo ["ACE_20rnd_762x51_SB_SCAR", 50];
	_this addMagazineCargo ["ACE_20rnd_762x51_T_SCAR", 50];
	
	_this addWeaponCargo ["BAF_LRR_scoped", 5];
	_this addWeaponCargo ["BAF_LRR_scoped_W", 5];
	_this addMagazineCargo ["5Rnd_86x70_L115A1", 50];
	_this addMagazineCargo ["ACE_5Rnd_86x70_T_L115A1", 50];
	
	_this addWeaponCargo ["SVD", 5];
	_this addWeaponCargo ["SVD_des_EP1", 5];
	_this addWeaponCargo ["SVD_CAMO", 5];
	_this addWeaponCargo ["ACE_SVD_Bipod", 5];
	_this addWeaponCargo ["SVD_NSPU_EP1", 5];
	_this addMagazineCargo ["10Rnd_762x54_SVD", 50];
	_this addMagazineCargo ["ACE_10Rnd_762x54_T_SVD", 50];
	
	_this addWeaponCargo ["M107", 5];
	_this addWeaponCargo ["m107_TWS_EP1", 5];
	_this addMagazineCargo ["10Rnd_127x99_M107", 50];
	_this addMagazineCargo ["ACE_10Rnd_127x99_Raufoss_m107", 50];
	
	_this addWeaponCargo ["ACE_M110", 5];
	_this addWeaponCargo ["ACE_M110_SD", 5];
	_this addWeaponCargo ["M110_TWS_EP1", 5];
	_this addWeaponCargo ["M110_NVG_EP1", 5];
	_this addMagazineCargo ["ACE_20Rnd_762x51_S_M110", 50];
	_this addMagazineCargo ["ACE_20Rnd_762x51_SB_M110", 50];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_M110", 50];
	
	_this addWeaponCargo ["ACE_M4SPR_SD", 5];
	_this addWeaponCargo ["ACE_Mk12mod1", 5];
	_this addWeaponCargo ["ACE_Mk12mod1_SD", 5];
	_this addMagazineCargo ["ACE_20Rnd_556x45_S_Stanag", 50];
	_this addMagazineCargo ["ACE_100Rnd_556x45_S_BetaCMag", 50];
	_this addMagazineCargo ["30Rnd_556x45_StanagSD", 50];
	_this addMagazineCargo ["30Rnd_556x45_Stanag", 50];
	_this addMagazineCargo ["20Rnd_556x45_Stanag", 50];
	_this addMagazineCargo ["100Rnd_556x45_BetaCMag", 50];
	_this addMagazineCargo ["ACE_30Rnd_556x45_T_Stanag", 50];
	_this addMagazineCargo ["ACE_30Rnd_556x45_S_Stanag", 50];
	_this addMagazineCargo ["ACE_30Rnd_556x45_SB_S_Stanag", 50];
	_this addMagazineCargo ["ACE_30Rnd_556x45_SB_Stanag", 50];
	
	_this addWeaponCargo ["ACE_AS50", 5];
	_this addWeaponCargo ["BAF_AS50_scoped", 5];
	_this addWeaponCargo ["BAF_AS50_TWS", 5];
	_this addMagazineCargo ["5Rnd_127x99_as50", 50];
		
	_this addWeaponCargo ["ACE_TAC50", 5];
	_this addWeaponCargo ["ACE_TAC50_SD", 5];
	_this addMagazineCargo ["ACE_5Rnd_127x99_B_TAC50", 50];
	_this addMagazineCargo ["ACE_5Rnd_127x99_S_TAC50", 50];
	_this addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50", 50];
	
	_this addWeaponCargo ["ACE_M109", 5];
	_this addMagazineCargo ["ACE_5Rnd_25x59_HEDP_Barrett", 50];
	
	_this addWeaponCargo ["KSVK", 5];
	_this addMagazineCargo ["5Rnd_127x108_KSVK", 50];
	_this addMagazineCargo ["ACE_5Rnd_127x108_T_KSVK", 50];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};