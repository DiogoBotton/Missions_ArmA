/////////////////////////////////////////////////////
// Called from an ammocrate's init field via:
//   null = this execVM "crates\machinegun.sqf";
/////////////////////////////////////////////////////

while {alive _this} do
{

// Remove the stock items from the crate
clearMagazineCargo _this;
clearWeaponCargo _this;

/////////////////////////////////////////////////////
// WEAPONS
/////////////////////////////////////////////////////

	_this addWeaponCargo ["ACE_MG36", 30];
	_this addWeaponCargo ["ACE_MG36_D", 30];
	_this addWeaponCargo ["MG36", 30];
	_this addWeaponCargo ["MG36_camo", 30];
	_this addMagazineCargo ["30Rnd_556x45_G36", 100];
	_this addMagazineCargo ["30Rnd_556x45_G36SD", 100];
	_this addMagazineCargo ["ACE_30Rnd_556x45_T_G36", 100];
	_this addMagazineCargo ["ACE_30Rnd_556x45_AP_G36", 100];
	
		
	_this addWeaponCargo ["RPK_74", 30];
	_this addWeaponCargo ["ACE_RPK", 30];
	_this addWeaponCargo ["ACE_RPK74M", 30];
	_this addWeaponCargo ["ACE_RPK74M_1P29", 30];
	
	_this addMagazineCargo ["ACE_30Rnd_545x39_AP_AK", 100];
	_this addMagazineCargo ["ACE_30Rnd_545x39_EP_AK", 100];
	_this addMagazineCargo ["ACE_30Rnd_545x39_S_AK", 100];
	_this addMagazineCargo ["ACE_30Rnd_545x39_T_AK", 100]; 
	_this addMagazineCargo ["ACE_45Rnd_545x39_AP_AK", 100];
	_this addMagazineCargo ["ACE_45Rnd_545x39_EP_AK", 100];
	_this addMagazineCargo ["ACE_75Rnd_762x39_S_AK47", 100];
	_this addMagazineCargo ["ACE_75Rnd_762x39_B_AK47", 100];
	_this addMagazineCargo ["ACE_75Rnd_545x39_S_RPK", 100];
	_this addMagazineCargo ["ACE_75Rnd_545x39_T_RPK", 100];
	_this addMagazineCargo ["30Rnd_762x39_AK47", 100];
	_this addMagazineCargo ["ACE_30Rnd_762x39_AP_AK47", 100];
	_this addMagazineCargo ["ACE_30Rnd_762x39_SD_AK47", 100];
	_this addMagazineCargo ["ACE_30Rnd_762x39_T_AK47", 100];
	_this addMagazineCargo ["ACE_40Rnd_762x39_B_AK47", 100];
	_this addMagazineCargo ["ACE_40Rnd_762x39_T_AK47", 100];
	_this addMagazineCargo ["ACE_40Rnd_762x39_AP_AK47", 100];


	_this addWeaponCargo ["M60A4_EP1", 30];
	_this addWeaponCargo ["ACE_PKT_out_3", 30];
	_this addWeaponCargo ["ACE_M60", 30];
	_this addWeaponCargo ["Pecheneg", 30];
	_this addWeaponCargo ["PK", 30];	
	_this addWeaponCargo ["ACE_SpareBarrel", 40];
	
	_this addMagazineCargo ["100Rnd_762x51_M240", 100];
	_this addMagazineCargo ["2000Rnd_762x54_PKT", 100];
	_this addMagazineCargo ["100Rnd_762x54_PK", 100];			
/////////////////////////////////////////////////////
// AMMO
/////////////////////////////////////////////////////

// Restock time.
sleep 1800;
};