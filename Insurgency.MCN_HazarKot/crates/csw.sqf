/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\csw.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["ACE_KORDProxy", 10];
	_this addMagazineCargo ["ACE_KORD_CSWDM", 100];
	_this addWeaponCargo ["ACE_KonkursTripodProxy", 10];
	_this addMagazineCargo ["ACE_Konkurs_CSWDM", 100];
	_this addMagazineCargo ["ACE_KonkursM_CSWDM", 100];
	_this addWeaponCargo ["ACE_DSHKMProxy", 10];
	_this addWeaponCargo ["ACE_DSHKMTripodProxy", 10];
	_this addMagazineCargo ["ACE_DSHKM_CSWDM", 100];	
	_this addWeaponCargo ["ACE_AGS30Proxy", 10];
	_this addWeaponCargo ["ACE_AGS30TripodProxy", 10];
	_this addMagazineCargo ["ACE_AGS30_CSWDM", 100];
	_this addWeaponCargo ["ACE_6T7TripodProxy", 10];
	_this addWeaponCargo ["ACE_2b14Proxy", 10];
	_this addWeaponCargo ["ACE_2b14TripodProxy", 10];
	_this addMagazineCargo ["ACE_Stinger_CSWDM", 100];
	_this addMagazineCargo ["ACE_2B14HE_CSWDM", 100];
	_this addMagazineCargo ["ACE_2B14WP_CSWDM", 100];
	_this addMagazineCargo ["ACE_2B14IL_CSWDM", 100];
	_this addWeaponCargo ["ACE_MK19MOD3Proxy", 10];
	_this addWeaponCargo ["ACE_M3TripodProxy", 10];
	_this addMagazineCargo ["ACE_MK19_CSWDM", 100];
	_this addWeaponCargo ["ACE_M252Proxy", 10];
	_this addMagazineCargo ["ACE_M2_CSWDM", 100];
	_this addWeaponCargo ["ACE_M252TripodProxy", 10];
	_this addMagazineCargo ["ACE_GMG_CSWDM", 100];
	_this addMagazineCargo ["ACE_TOW_CSWDM", 100];
	_this addWeaponCargo ["ACE_M224Proxy", 10];
	_this addWeaponCargo ["ACE_M224TripodProxy", 10];
	_this addWeaponCargo ["ACE_M220Proxy", 10];
	_this addWeaponCargo ["ACE_M220TripodProxy", 10];
	_this addWeaponCargo ["ACE_M122TripodProxy", 10];
	_this addWeaponCargo ["ACE_M2HBProxy", 10];
	_this addWeaponCargo ["ACE_M3TripodProxy", 10];
	_this addWeaponCargo ["ACE_BAF_L2A1Proxy", 10];
	_this addWeaponCargo ["ACE_BAF_static_GMGProxy", 10];
	_this addMagazineCargo ["ACE_M252HE_CSWDM", 100];
	_this addMagazineCargo ["ACE_M252WP_CSWDM", 100];
	_this addMagazineCargo ["ACE_M252IL_CSWDM", 100];
	_this addMagazineCargo ["ACE_M224HE_CSWDM", 100];
	_this addMagazineCargo ["ACE_M224WP_CSWDM", 100];
	_this addMagazineCargo ["ACE_M224IL_CSWDM", 100];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////


// Restock time.
sleep 1800;
};