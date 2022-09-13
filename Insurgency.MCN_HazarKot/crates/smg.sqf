/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\smg.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////
	
	_this addWeaponCargo ["ACE_oc14", 10];
	_this addWeaponCargo ["ACE_oc14gl", 10];
	_this addWeaponCargo ["ACE_oc14glsp", 10];
	_this addWeaponCargo ["ACE_oc14sd", 10];
	_this addWeaponCargo ["ACE_oc14sdsp", 10];
	_this addWeaponCargo ["ACE_oc14sp", 10];
	_this addMagazineCargo ["ACE_20Rnd_9x39_B_OC14", 100];
	_this addMagazineCargo ["ACE_20Rnd_9x39_B_SP6_OC14", 100];
	_this addMagazineCargo ["ACE_20Rnd_9x39_S_OC14", 100];
	_this addMagazineCargo ["ACE_20Rnd_9x39_S_SP6_OC14", 100];
		
	_this addWeaponCargo ["ACE_MP5A4", 10];
	_this addWeaponCargo ["ACE_MP5A5", 10];
	_this addWeaponCargo ["ACE_MP5SD", 10];
	_this addMagazineCargo ["30Rnd_9x19_MP5", 100];
	_this addMagazineCargo ["30Rnd_9x19_MP5SD", 100];
	
	_this addWeaponCargo ["ACE_MP7", 10];
	_this addWeaponCargo ["ACE_MP7_RSAS", 10];
	_this addMagazineCargo ["ACE_40Rnd_B_46x30_MP7", 100];
	
	_this addWeaponCargo ["ACE_UMP45", 10];
	_this addWeaponCargo ["ACE_UMP45_SD", 10];
	_this addWeaponCargo ["ACE_UMP45_AIM", 10];
	_this addWeaponCargo ["ACE_UMP45_AIM_SD", 10];
	_this addMagazineCargo ["ACE_25Rnd_1143x23_B_UMP45", 100];	
	
	_this addWeaponCargo ["ACE_KAC_PDW", 10];
	_this addMagazineCargo ["ACE_30Rnd_6x35_B_PDW", 100];
	
	_this addWeaponCargo ["bizon", 10];
	_this addWeaponCargo ["bizon_silenced", 10];
	_this addMagazineCargo ["64Rnd_9x19_Bizon", 100];
	_this addMagazineCargo ["64Rnd_9x19_SD_Bizon", 100];
	_this addMagazineCargo ["ACE_64Rnd_9x19_S_Bizon", 100];
	
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};