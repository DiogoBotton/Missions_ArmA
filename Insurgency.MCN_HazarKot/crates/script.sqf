_marker = "DMZ_DA";  // marker used to spawn.
_boxType = "USBasicWeapons_EP1";  // the type of ammobox used.
_timer = 600;  // time in seconds until box is refilled.

if (_this != player) exitWith {};  // exit all other clients.
_weapons = []; _magazines = [];

// load available to unitname1 only.
if (_this == player) then {
	_weapons = 
	[
		["SCAR_L_CQC_EGLM_Holo",1],
		["SCAR_L_STD_EGLM_RCO",1],
		["SCAR_L_STD_EGLM_TWS",1],
		["HandGrenade_West",3]  // notice that there is no , at the end of the last weapon.
	];
	
	_magazines = 
	[
		["30Rnd_556x45_Stanag",20],
		["1Rnd_HE_M203",5],
		["1Rnd_Smoke_M203",5]  // notice that there is no , at the end of the last magazine.
		
	];
};


// create and fill the box.
_box = _boxType createVehicleLocal (getMarkerPos _marker);
_box allowDamage false;

while {true} do {
	// empty it.
	clearWeaponCargo _box;
	clearMagazineCargo _box;
	
	// add in all weapons.
	{_box addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;
	
	// add in all magazines.
	{_box addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;
	
	// wait x amount of seconds then refill box.
	sleep _timer;
};