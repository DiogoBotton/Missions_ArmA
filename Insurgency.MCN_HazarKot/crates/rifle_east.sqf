/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\rifle_east.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addWeaponCargo ["AK_74", 30];
	_this addWeaponCargo ["AK_74_GL", 30];
	_this addWeaponCargo ["AK_74_GL_kobra", 30];
	_this addWeaponCargo ["AKS_74_NSPU", 30];
	_this addWeaponCargo ["AK_47_M", 30];
	_this addWeaponCargo ["AK_47_S", 30];
	_this addWeaponCargo ["AKS_74", 30];
	_this addWeaponCargo ["AKS_74_kobra", 30];
	_this addWeaponCargo ["AKS_74_pso", 30];
	_this addWeaponCargo ["AKS_74_U", 30];
	_this addWeaponCargo ["AKS_GOLD", 30];
	_this addWeaponCargo ["ACE_AK74M_Kobra", 30];
	_this addWeaponCargo ["ACE_AK74M_PSO", 30];
	_this addWeaponCargo ["ACE_AK74M_1P78", 30];
	_this addWeaponCargo ["ACE_AK74M_NSPU", 30];
	_this addWeaponCargo ["ACE_AK74M_GL", 30];
	_this addWeaponCargo ["ACE_AK74M_FL_F", 30];
	_this addWeaponCargo ["ACE_AK74M_Kobra_FL", 30];
	_this addWeaponCargo ["ACE_AK74M_1P29", 30];
	_this addWeaponCargo ["ACE_AK74M_PSO_FL_F", 30];
	_this addWeaponCargo ["ACE_AK74M_1P78_FL", 30];
	_this addWeaponCargo ["ACE_AK74M_TWS_FL", 30];
	_this addWeaponCargo ["ACE_AK74M_NSPU_FL", 30];
	_this addWeaponCargo ["ACE_AK74M_GL_Kobra", 30];
	_this addWeaponCargo ["ACE_AK74M_GL_PSO", 30];
	_this addWeaponCargo ["ACE_AK74M_GL_1P78", 30];
	_this addWeaponCargo ["ACE_AK74M_GL_TWS", 30];
	_this addWeaponCargo ["ACE_AK74M_GL_NSPU", 30];
	_this addWeaponCargo ["ACE_AK74M_GL_1P29", 30];
	_this addWeaponCargo ["ACE_AK74M_SD_1P78", 30];
	_this addWeaponCargo ["ACE_AK74M_SD", 30];
	_this addWeaponCargo ["ACE_AK74M_SD_Kobra", 30];
	_this addWeaponCargo ["ACE_AK74M_SD_NSPU", 30];
	_this addWeaponCargo ["ACE_AK74M_SD_PSO", 30];
	_this addWeaponCargo ["ACE_AK74M_SD_TWS", 30];
	_this addWeaponCargo ["ACE_AK74M_TWS", 30];
	_this addWeaponCargo ["ACE_AK103_Kobra", 30];
	_this addWeaponCargo ["ACE_AK103_1P29", 30];
	_this addWeaponCargo ["ACE_AK103_PSO", 30];
	_this addWeaponCargo ["ACE_AK103_GL", 30];
	_this addWeaponCargo ["ACE_AK103_GL_Kobra", 30];
	_this addWeaponCargo ["ACE_AK103_GL_1P29", 30];
	_this addWeaponCargo ["ACE_AK103_GL_PSO", 30];
	_this addWeaponCargo ["ACE_AK104", 30];
	_this addWeaponCargo ["ACE_AK104_Kobra", 30];
	_this addWeaponCargo ["ACE_AK104_1P29", 30];
	_this addWeaponCargo ["ACE_AK104_PSO", 30];
	_this addWeaponCargo ["ACE_AK105_Kobra", 30];
	_this addWeaponCargo ["ACE_AK105_1P29", 30];
	_this addWeaponCargo ["ACE_AK105_PSO", 30];
	_this addWeaponCargo ["ACE_AKM", 30];
	_this addWeaponCargo ["ACE_AKM_GL", 30];
	_this addWeaponCargo ["ACE_AKMS", 30];
	_this addWeaponCargo ["ACE_AKMS_SD", 30];
	_this addWeaponCargo ["ACE_AKS74_GP25", 30];
	_this addWeaponCargo ["ACE_AKS74_UN", 30];
	_this addWeaponCargo ["ACE_AKS74P", 30];
	_this addWeaponCargo ["ACE_AKS74P_1P29", 30];
	_this addWeaponCargo ["ACE_AKS74P_GL", 30];
	_this addWeaponCargo ["ACE_AKS74P_GL_1P29", 30];
	_this addWeaponCargo ["ACE_AKS74P_GL_Kobra", 30];
	_this addWeaponCargo ["ACE_AKS74P_GL_PSO", 30];
	_this addWeaponCargo ["ACE_AKS74P_Kobra", 30];
	_this addWeaponCargo ["ACE_AKS74P_PSO", 30];
	_this addWeaponCargo ["ACE_AEK_971", 30];
	_this addWeaponCargo ["ACE_AEK_971_gp", 30];
	_this addWeaponCargo ["ACE_AEK_971_1p63", 30];
	_this addWeaponCargo ["ACE_AEK_971_gp_1p63", 30];
	_this addWeaponCargo ["ACE_AEK_971_1p78", 30];
	_this addWeaponCargo ["ACE_AEK_971_1pn100", 30];
	_this addWeaponCargo ["ACE_AEK_971_shahin", 30];
	_this addWeaponCargo ["ACE_AEK_971_tgp_cln", 30];
	_this addWeaponCargo ["ACE_AEK_973s", 30];
	_this addWeaponCargo ["ACE_AEK_973s_gp", 30];
	_this addWeaponCargo ["ACE_AEK_973s_1p63", 30];
	_this addWeaponCargo ["ACE_AEK_973s_gp_1p63", 30];
	_this addWeaponCargo ["ACE_AEK_973s_1p78", 30];
	_this addWeaponCargo ["ACE_AEK_973s_1pn100", 30];
	_this addWeaponCargo ["ACE_AEK_973s_shahin", 30];
	_this addWeaponCargo ["ACE_AEK_973s_tgp_cln", 30];
	_this addWeaponCargo ["AK_107_kobra", 30];
	_this addWeaponCargo ["AK_107_GL_kobra", 30];
	_this addWeaponCargo ["AK_107_pso", 30];
	_this addWeaponCargo ["AK_107_GL_pso", 30];
	_this addWeaponCargo ["ACE_gr1", 30];
	_this addWeaponCargo ["ACE_gr1sd", 30];
	_this addWeaponCargo ["ACE_gr1sdsp", 30];
	_this addWeaponCargo ["ACE_gr1sp", 30];
	_this addMagazineCargo ["ACE_30Rnd_545x39_AP_AK", 150];
	_this addMagazineCargo ["ACE_30Rnd_545x39_EP_AK", 150];
	_this addMagazineCargo ["ACE_30Rnd_545x39_S_AK", 150];
	_this addMagazineCargo ["ACE_30Rnd_545x39_T_AK", 150]; 
	_this addMagazineCargo ["ACE_45Rnd_545x39_AP_AK", 150];
	_this addMagazineCargo ["ACE_45Rnd_545x39_EP_AK", 150];
	_this addMagazineCargo ["ACE_75Rnd_762x39_S_AK47", 150];
	_this addMagazineCargo ["ACE_75Rnd_762x39_B_AK47", 150];
	_this addMagazineCargo ["ACE_75Rnd_545x39_S_RPK", 150];
	_this addMagazineCargo ["ACE_75Rnd_545x39_T_RPK", 150];
	_this addMagazineCargo ["30Rnd_762x39_AK47", 150];
	_this addMagazineCargo ["ACE_30Rnd_762x39_AP_AK47", 150];
	_this addMagazineCargo ["ACE_30Rnd_762x39_SD_AK47", 150];
	_this addMagazineCargo ["ACE_30Rnd_762x39_T_AK47", 150];
	_this addMagazineCargo ["ACE_40Rnd_762x39_B_AK47", 150];
	_this addMagazineCargo ["ACE_40Rnd_762x39_T_AK47", 150];
	_this addMagazineCargo ["ACE_40Rnd_762x39_AP_AK47", 150];
	_this addMagazineCargo ["FlareWhite_GP25", 150];
	_this addMagazineCargo ["FlareGreen_GP25", 150];
	_this addMagazineCargo ["FlareRed_GP25", 150];
	_this addMagazineCargo ["FlareYellow_GP25", 150];
	_this addMagazineCargo ["ACE_1Rnd_CS_GP25", 150];
	_this addMagazineCargo ["ACE_1Rnd_HE_GP25P", 150];
	_this addMagazineCargo ["1Rnd_HE_GP25", 150];
	_this addMagazineCargo ["1Rnd_SMOKE_GP25", 150];
	_this addMagazineCargo ["1Rnd_SmokeRed_GP25", 150];
	_this addMagazineCargo ["1Rnd_SmokeGreen_GP25", 150];
	_this addMagazineCargo ["1Rnd_SmokeYellow_GP25", 150];
	_this addMagazineCargo ["ACE_SSGreen_GP25", 150];
	_this addMagazineCargo ["ACE_SSRed_GP25", 150];
	_this addMagazineCargo ["ACE_SSWhite_GP25", 150];
	_this addMagazineCargo ["ACE_SSYellow_GP25", 150];

	_this addWeaponCargo ["FN_FAL", 30];
	_this addWeaponCargo ["FN_FAL_ANPVS4", 30];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_FAL", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_FAL", 150];
	
	_this addWeaponCargo ["LeeEnfield", 30];
	_this addMagazineCargo ["10x_303", 150];
	
	_this addWeaponCargo ["ACE_SKS", 30];
	_this addMagazineCargo ["ACE_10Rnd_762x39_B_SKS", 150];
	_this addMagazineCargo ["ACE_10Rnd_762x39_T_SKS", 150];
	
	_this addWeaponCargo ["ACE_Val", 30];
	_this addWeaponCargo ["ACE_Val_Kobra", 30];
	_this addWeaponCargo ["ACE_Val_PSO", 30];
	_this addMagazineCargo ["10Rnd_9x39_SP5_VSS", 150];
	_this addMagazineCargo ["20Rnd_9x39_SP5_VSS", 150];
	_this addMagazineCargo ["ACE_10Rnd_9x39_SP6_VSS", 150];
	_this addMagazineCargo ["ACE_20Rnd_9x39_SP6_VSS", 150];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};