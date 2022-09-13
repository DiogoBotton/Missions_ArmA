/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\explosive.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addMagazineCargo ["Mine", 100];
	_this addMagazineCargo ["MineE", 100];
	_this addMagazineCargo ["ACE_DM31AT_M", 100];
	_this addMagazineCargo ["ACE_DM21AT_M", 100];
	_this addMagazineCargo ["ACE_PMN1_M", 100];
	_this addMagazineCargo ["ACE_PMN2_M", 100];
	_this addMagazineCargo ["ACE_PMN3_M", 100];
	_this addMagazineCargo ["ACE_PPM2_M", 100];
	_this addMagazineCargo ["Pipebomb", 100];
	_this addMagazineCargo ["ACE_C4_M", 100];
	_this addMagazineCargo ["PMC_ied_v1", 100];
	_this addMagazineCargo ["PMC_ied_v2", 100];
	_this addMagazineCargo ["PMC_ied_v3", 100];
	_this addMagazineCargo ["PMC_ied_v4", 100];
	_this addMagazineCargo ["BAF_ied_v1", 100];
	_this addMagazineCargo ["BAF_ied_v2", 100];
	_this addMagazineCargo ["BAF_ied_v3", 100];
	_this addMagazineCargo ["BAF_ied_v4", 100];
	_this addMagazineCargo ["ACE_M2SLAM_M", 100];
	_this addMagazineCargo ["ACE_M4SLAM_M", 100];
	_this addMagazineCargo ["ACE_PPM2_M", 100];
	_this addMagazineCargo ["ACE_POMZ_M", 100];
	_this addMagazineCargo ["ACE_MON50_M", 100];
	_this addMagazineCargo ["ACE_DM31_M", 100];
	_this addMagazineCargo ["ACE_DM12PARM1_M", 100];
	_this addMagazineCargo ["ACE_Claymore_M", 100];
	_this addMagazineCargo ["ACE_OSM4_M", 100];
	_this addMagazineCargo ["ACE_BBetty_M", 100];
	_this addMagazineCargo ["ACE_M86PDM", 100];
	_this addMagazineCargo ["ACE_TripFlare_M", 100];

/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////


// Restock time.
sleep 1800;
};