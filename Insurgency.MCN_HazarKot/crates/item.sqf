/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\item.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["ACE_M47_Daysight", 30];
	_this addWeaponCargo ["ACE_Javelin_CLU", 30];

	_this addWeaponCargo ["ACE_MineMarkers", 100];
	_this addWeaponCargo ["ACE_MineMarkers_Light", 100];
	_this addWeaponCargo ["ACE_MineMarkers_MineSign", 100];
	_this addWeaponCargo ["ACE_MineMarkers_PathSign", 100];
	_this addWeaponCargo ["ACE_MineMarkers_MineFlag", 100];	
	
	_this addWeaponCargo ["ACE_GlassesGasMask_S10", 30];
	_this addWeaponCargo ["ACE_GlassesGasMask_RU", 30];
	_this addWeaponCargo ["ACE_GlassesGasMask_US", 30];
	_this addWeaponCargo ["ACE_GlassesGasMask2_US", 30];
			
	_this addWeaponCargo ["ace_arty_rangeTable_tampella", 30];
	_this addWeaponCargo ["ace_arty_rangeTable_m252", 30];
	_this addWeaponCargo ["ace_arty_rangeTable_m224", 30];
	_this addWeaponCargo ["ace_arty_rangeTable_m119", 30];
		
	_this addWeaponCargo ["ItemMap", 30];
	_this addWeaponCargo ["ACE_Map", 30];
	
	_this addWeaponCargo ["ItemGPS", 30];
	_this addWeaponCargo ["ItemCompass", 30];
	_this addWeaponCargo ["ItemRadio", 30];
	_this addWeaponCargo ["ItemWatch", 30];
	
	_this addWeaponCargo ["ACE_Earplugs", 30];
	_this addWeaponCargo ["ACE_KeyCuffs", 30];
	_this addWeaponCargo ["ACE_Map_Tools", 30];
	_this addWeaponCargo ["ACE_Kestrel4500", 30];
	_this addWeaponCargo ["ACE_DAGR", 30];
	_this addWeaponCargo ["ACE_HuntIR_monitor", 30];
	_this addMagazineCargo ["ACE_Bodybag",30];
	
	_this addMagazineCargo ["ACE_Knicklicht_R", 100];
	_this addMagazineCargo ["ACE_Knicklicht_W", 100];
	_this addMagazineCargo ["ACE_Knicklicht_Y", 100];
	_this addMagazineCargo ["ACE_Knicklicht_B", 100];
	_this addMagazineCargo ["ACE_Knicklicht_IR", 100];
	
	_this addMagazineCargo ["ACE_VS17Panel_M", 30];
	_this addMagazineCargo ["ACE_VS21APANEL_M", 30];
	_this addMagazineCargo ["ACE_VS21BPANEL_M", 30];
	_this addMagazineCargo ["ACE_VS21CPANEL_M", 30];
	_this addMagazineCargo ["ACE_VS21MEDICPANEL_M", 30];
	
	_this addMagazineCargo ["ACE_Rope_M_50", 30];
	_this addMagazineCargo ["ACE_Rope_M_60", 30];
	_this addMagazineCargo ["ACE_Rope_M_90", 30];
	_this addMagazineCargo ["ACE_Rope_M_120", 30];
	_this addMagazineCargo ["ACE_Rope_M5", 30];
	_this addMagazineCargo ["ACE_Rope_TOW_M_5", 30];
		
	_this addWeaponCargo ["ACE_SpottingScope", 30];
	_this addWeaponCargo ["ACE_SOFLAMTripod", 30];
	
	_this addWeaponCargo ["ACE_GlassesBlackSun", 30];
	_this addWeaponCargo ["ACE_GlassesRedSun", 30];
	_this addWeaponCargo ["ACE_GlassesGreenSun", 30];
	_this addWeaponCargo ["ACE_GlassesBlueSun", 30];
	_this addWeaponCargo ["ACE_GlassesSpectacles", 30];
	_this addWeaponCargo ["ACE_GlassesRoundGlasses", 30];
	_this addWeaponCargo ["ACE_GlassesSunglasses", 30];
	_this addWeaponCargo ["ACE_GlassesLHD_glasses", 30];
	_this addWeaponCargo ["ACE_GlassesTactical", 30];
	_this addWeaponCargo ["ACE_GlassesMFS", 30];
	
	_this addWeaponCargo ["ACE_GlassesBalaklava", 30];
	_this addWeaponCargo ["ACE_GlassesBalaklavaGray", 30];
	_this addWeaponCargo ["ACE_GlassesBalaklavaOlive", 30];
	
	_this addWeaponCargo ["NVGoggles", 30];
	_this addWeaponCargo ["Binocular", 30];
	
	_this addWeaponCargo ["Laserdesignator", 30];
	_this addMagazineCargo ["Laserbatteries", 30];
	
	_this addWeaponCargo ["Binocular_Vector", 30];
	_this addWeaponCargo ["ACE_Rangefinder_OD", 30];
	_this addMagazineCargo ["ACE_Battery_Rangefinder", 30];
	
	_this addWeaponCargo ["ACE_MX2A", 30];
		
	_this addWeaponCargo ["ACE_YardAge450", 30];
		
	_this addWeaponCargo ["ACE_SniperTripod", 30];
	
	_this addMagazineCargo ["IR_Strobe_Target", 30];
	_this addMagazineCargo ["IR_Strobe_Marker", 30];
	_this addMagazineCargo ["IRStrobe", 30];
	_this addMagazineCargo ["ACE_IRStrobe", 30];
	
	_this addMagazineCargo ["ACE_SandBag_Magazine", 100];
	
	
	_this addWeaponCargo ["ACE_Minedetector_US", 30];
	_this addWeaponCargo ["ACE_VMH3", 30];
	
	
	_this addWeaponCargo ["ACE_SearchMirror", 30];
	_this addWeaponCargo ["ACE_WireCutter", 30];
	_this addWeaponCargo ["ACE_TacticalLadder_Pack", 30];
	
	_this addWeaponCargo ["ACE_JerryCan_Dummy_15", 1];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};