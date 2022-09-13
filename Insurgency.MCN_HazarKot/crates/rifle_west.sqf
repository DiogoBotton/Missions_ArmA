/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\rifle_west.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addWeaponCargo ["SCAR_L_CQC", 30];
	_this addWeaponCargo ["SCAR_L_CQC_Holo", 30];
	_this addWeaponCargo ["SCAR_L_STD_Mk4CQT", 30];
	_this addWeaponCargo ["SCAR_L_STD_EGLM_RCO", 30];
	_this addWeaponCargo ["SCAR_L_CQC_EGLM_Holo", 30];
	_this addWeaponCargo ["SCAR_L_STD_EGLM_TWS", 30];
	_this addWeaponCargo ["SCAR_L_STD_HOLO", 30];
	_this addWeaponCargo ["SCAR_L_CQC_CCO_SD", 30];
	
	_this addWeaponCargo ["BAF_L85A2_RIS_ACOG", 30];
	_this addWeaponCargo ["BAF_L85A2_RIS_CWS", 30];
	_this addWeaponCargo ["BAF_L85A2_RIS_Holo", 30];
	_this addWeaponCargo ["BAF_L85A2_RIS_SUSAT", 30];
	_this addWeaponCargo ["BAF_L85A2_UGL_ACOG", 30];
	_this addWeaponCargo ["BAF_L85A2_UGL_Holo", 30];
	_this addWeaponCargo ["BAF_L85A2_UGL_SUSAT", 30];
	_this addWeaponCargo ["BAF_L86A2_ACOG", 30];
	
	_this addWeaponCargo ["m8_carbine", 30];
	_this addWeaponCargo ["m8_carbine_pmc", 30];
	_this addWeaponCargo ["m8_carbineGL", 30];
	_this addWeaponCargo ["m8_compact", 30];
	_this addWeaponCargo ["m8_compact_pmc", 30];
	_this addWeaponCargo ["m8_holo_sd", 30];
	_this addWeaponCargo ["m8_sharpshooter", 30];
	_this addWeaponCargo ["m8_tws", 30];
	_this addWeaponCargo ["m8_tws_sd", 30];
	
	_this addWeaponCargo ["m16a4", 30];
	_this addWeaponCargo ["M16A2", 30];
	_this addWeaponCargo ["M16A2GL", 30];
	_this addWeaponCargo ["M16A2GL", 30];
	_this addWeaponCargo ["ACE_m16a2_scope", 30];
	_this addWeaponCargo ["ACE_m16a2gl_scope", 30];
	_this addWeaponCargo ["ACE_M16A4_CCO_GL", 30];
	_this addWeaponCargo ["ACE_M16A4_ACG_GL_UP", 30];
	_this addWeaponCargo ["ACE_M16A4_EOT", 30];
	_this addWeaponCargo ["ACE_M16A4_EOT_GL", 30];
	_this addWeaponCargo ["ACE_M16A4_GL_UP", 30];
	_this addWeaponCargo ["ACE_M16A4_Iron", 30];
		
	_this addWeaponCargo ["ACE_M3A1", 30];
	_this addMagazineCargo ["ACE_30Rnd_1143x23_B_M3", 150];
		
	_this addWeaponCargo ["ACE_M27_IAR", 30];
	_this addWeaponCargo ["ACE_M27_IAR_ACOG", 30];
	_this addWeaponCargo ["ACE_M27_IAR_CCO", 30];
	
	_this addWeaponCargo ["ACE_M4", 30];
	_this addWeaponCargo ["ACE_M4_ACOG", 30];
	_this addWeaponCargo ["ACE_M4_Aim", 30];
	_this addWeaponCargo ["ACE_M4_AIM_GL", 30];
	_this addWeaponCargo ["ACE_M4_Eotech", 30];
	_this addWeaponCargo ["ACE_M4_GL", 30];
	_this addWeaponCargo ["ACE_M4_RCO_GL", 30];	
	_this addWeaponCargo ["M4A1", 30];
	_this addWeaponCargo ["M4A1_HWS_GL", 30];
	_this addWeaponCargo ["M4A1_HWS_GL_camo", 30];
	_this addWeaponCargo ["M4A1_HWS_GL_SD_Camo", 30];
	_this addWeaponCargo ["M4A1_Aim_camo", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_Aim", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_GL", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1", 30];
	_this addWeaponCargo ["ACE_M4A1_GL", 30];
	_this addWeaponCargo ["ACE_M4A1_GL_SD", 30];
	_this addWeaponCargo ["ACE_M4_ACOG_PVS14", 30];	
	_this addWeaponCargo ["ACE_SOC_M4A1_GL_SD", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_Eotech", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_Eotech_4x", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_GL_13", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_SD_9", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 30];
	_this addWeaponCargo ["ACE_SOC_M4A1_TWS", 30];
	_this addWeaponCargo ["ACE_M4A1_ACOG", 30];
	_this addWeaponCargo ["ACE_M4A1_ACOG_SD", 30];
	_this addWeaponCargo ["ACE_M4A1_Aim_SD", 30];
	_this addWeaponCargo ["ACE_M4A1_Eotech", 30];
	_this addWeaponCargo ["ACE_M4A1_AIM_GL", 30];
	_this addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 30];
	_this addWeaponCargo ["ACE_M4A1_RCO2_GL", 30];
	_this addWeaponCargo ["ACE_M4A1_RCO_GL", 30];
	_this addWeaponCargo ["ACE_M4A1_ACOG_PVS14", 30];
	_this addWeaponCargo ["ACE_M4A1_EOT_SD", 30];
	_this addWeaponCargo ["M4A3_CCO_EP1", 30];
	_this addWeaponCargo ["M4A1_RCO_GL", 30];
	_this addWeaponCargo ["M4A3_RCO_GL_EP1", 30];
	
	_this addWeaponCargo ["ACE_HK416_D10", 30];
	_this addWeaponCargo ["ACE_HK416_D10_SD", 30];
	_this addWeaponCargo ["ACE_HK416_D10_COMPM3", 30];
	_this addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 30];
	_this addWeaponCargo ["ACE_HK416_D14", 30];
	_this addWeaponCargo ["ACE_HK416_D14_SD", 30];
	_this addWeaponCargo ["ACE_HK416_D14_COMPM3", 30];
	_this addWeaponCargo ["ACE_HK416_D14_COMPM3_M320", 30];
	_this addWeaponCargo ["ACE_HK416_D10_AIM", 30];
	_this addWeaponCargo ["ACE_HK416_D10_Holo", 30];
	_this addWeaponCargo ["ACE_HK416_D10_M320", 30];
	_this addWeaponCargo ["ACE_HK416_D14_ACOG_PVS14", 30];
	_this addWeaponCargo ["ACE_HK416_D14_TWS", 30];
	
	_this addMagazineCargo ["ACE_20Rnd_556x45_S_Stanag", 150];
	_this addMagazineCargo ["ACE_100Rnd_556x45_S_BetaCMag", 150];
	_this addMagazineCargo ["30Rnd_556x45_StanagSD", 150];
	_this addMagazineCargo ["30Rnd_556x45_Stanag", 150];
	_this addMagazineCargo ["20Rnd_556x45_Stanag", 150];
	_this addMagazineCargo ["100Rnd_556x45_BetaCMag", 150];
	_this addMagazineCargo ["ACE_30Rnd_556x45_T_Stanag", 150];
	_this addMagazineCargo ["ACE_30Rnd_556x45_S_Stanag", 150];
	_this addMagazineCargo ["ACE_30Rnd_556x45_SB_S_Stanag", 150];
	_this addMagazineCargo ["ACE_30Rnd_556x45_SB_Stanag", 150];
	
	_this addWeaponCargo ["G36C_camo", 30];
	_this addWeaponCargo ["G36_C_SD_camo", 30];
	_this addWeaponCargo ["G36A_camo", 30];
	_this addWeaponCargo ["G36K_camo", 30];
	_this addWeaponCargo ["ACE_G36K_EOTech", 30];
	_this addWeaponCargo ["ACE_G36K_EOTech_D", 30];
	_this addWeaponCargo ["G36K", 30];
	_this addWeaponCargo ["G36A", 30];
	_this addWeaponCargo ["G36_C_SD_eotech", 30];
	_this addWeaponCargo ["ACE_G36K_iron", 30];
	_this addWeaponCargo ["ACE_G36K_iron_D", 30];
	_this addWeaponCargo ["ACE_G36A1_AG36_UP_F", 30];
	_this addWeaponCargo ["ACE_G36A1_AG36A1_D", 30];
	_this addWeaponCargo ["ACE_G36A2", 30];
	_this addWeaponCargo ["ACE_G36A2_AG36A2", 30];
	_this addWeaponCargo ["ACE_G36A2_Bipod", 30];
	_this addMagazineCargo ["30Rnd_556x45_G36", 150];
	_this addMagazineCargo ["30Rnd_556x45_G36SD", 150];
	_this addMagazineCargo ["ACE_30Rnd_556x45_T_G36", 150];
	_this addMagazineCargo ["ACE_30Rnd_556x45_AP_G36", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_G3", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_G3", 150];
	
	_this addWeaponCargo ["ACE_G3A3", 30];
	_this addWeaponCargo ["ACE_G3A3_RSAS", 30];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_G3", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_G3", 150];	
	
	_this addWeaponCargo ["SCAR_H_CQC_CCO", 30];
	_this addWeaponCargo ["SCAR_H_CQC_CCO_SD", 30];
	_this addWeaponCargo ["SCAR_H_STD_EGLM_Spect", 30];
	_this addWeaponCargo ["SCAR_H_STD_TWS_SD", 30];
	_this addWeaponCargo ["ACE_SCAR_H_STD_Spect", 30];
	
	_this addMagazineCargo ["20Rnd_762x51_B_SCAR", 150];
	_this addMagazineCargo ["ACE_20rnd_762x51_SB_SCAR", 150];
	_this addMagazineCargo ["ACE_20rnd_762x51_T_SCAR", 150];
	
	_this addWeaponCargo ["ACE_HK417_Shortdot", 30];
	_this addWeaponCargo ["ACE_HK417_leupold", 30];
	_this addWeaponCargo ["ACE_HK417_micro", 30];
	_this addWeaponCargo ["ACE_HK417_Eotech_4x", 30];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_HK417", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_SB_HK417", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_HK417", 150];
		
	_this addWeaponCargo ["M14_EP1", 30];
	_this addWeaponCargo ["ACE_M14_ACOG", 30];
	_this addMagazineCargo ["20Rnd_762x51_DMR", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_T_DMR", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_B_M14", 150];
	_this addMagazineCargo ["ACE_20Rnd_762x51_S_M14", 150];
	
	_this addWeaponCargo ["Sa58P_EP1", 30];
	_this addWeaponCargo ["Sa58V_CCO_EP1", 30];
	_this addWeaponCargo ["Sa58V_EP1", 30];
	_this addWeaponCargo ["Sa58V_RCO_EP1", 30];
	_this addMagazineCargo ["30Rnd_762x39_SA58", 150];	
	_this addMagazineCargo ["ACE_30Rnd_762x39_T_SA58", 150];	
	
	_this addWeaponCargo ["M32_EP1", 30];
	_this addWeaponCargo ["M79_EP1", 30];
	_this addWeaponCargo ["Mk13_EP1", 30];
	_this addMagazineCargo ["ACE_6Rnd_CS_M32", 150];	
	_this addMagazineCargo ["ACE_HuntIR_M203", 150];
	_this addMagazineCargo ["FlareWhite_M203", 150];
	_this addMagazineCargo ["FlareGreen_M203", 150];
	_this addMagazineCargo ["FlareRed_M203", 150];
	_this addMagazineCargo ["FlareYellow_M203", 150];
	_this addMagazineCargo ["1Rnd_HE_M203", 150];
	_this addMagazineCargo ["ACE_1Rnd_HE_M203", 150];
	_this addMagazineCargo ["ACE_1Rnd_CS_M203", 150];
	_this addMagazineCargo ["6Rnd_FlareWhite_M203", 150];
	_this addMagazineCargo ["6Rnd_FlareGreen_M203", 150];
	_this addMagazineCargo ["6Rnd_FlareRed_M203", 150];
	_this addMagazineCargo ["6Rnd_FlareYellow_M203", 150];
	_this addMagazineCargo ["6Rnd_HE_M203", 150];
	_this addMagazineCargo ["6Rnd_Smoke_M203", 150];
	_this addMagazineCargo ["6Rnd_SmokeRed_M203", 150];
	_this addMagazineCargo ["6Rnd_SmokeGreen_M203", 150];
	_this addMagazineCargo ["6Rnd_SmokeYellow_M203", 150];
	_this addMagazineCargo ["1Rnd_Smoke_M203", 150];
	_this addMagazineCargo ["1Rnd_Smoke_M203", 150];
	_this addMagazineCargo ["ACE_M576", 150];
	_this addMagazineCargo ["1Rnd_Smoke_M203", 150];
	_this addMagazineCargo ["1Rnd_SmokeRed_M203", 150];
	_this addMagazineCargo ["1Rnd_SmokeGreen_M203", 150];
	_this addMagazineCargo ["1Rnd_SmokeYellow_M203", 150];
	_this addMagazineCargo ["ACE_SSWhite_FG", 150];
	_this addMagazineCargo ["ACE_SSRed_FG", 150];
	_this addMagazineCargo ["ACE_SSGreen_FG", 150];
	_this addMagazineCargo ["ACE_SSYellow_FG", 150];
	_this addMagazineCargo ["ACE_SSWhite_M203", 150];
	_this addMagazineCargo ["ACE_SSGreen_M203", 150];
	_this addMagazineCargo ["ACE_SSRed_M203", 150];
	_this addMagazineCargo ["ACE_SSYellow_M203", 150];

/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};