//
// Na inicialização da unidade, coloque:
//
// null = this execVM "equip\car.sqf";
//

if(alive _this) then {
	clearMagazineCargo _this;
	clearWeaponCargo _this;
	
	_this addWeaponCargo ["M136", 5];
	_this addMagazineCargo ["Pipebomb", 5];
	_this addMagazineCargo ["ACE_LargeBandage",10];    
	_this addMagazineCargo ["ACE_Epinephrine",4];  
	_this addMagazineCargo ["ACE_Morphine",4];  
	_this addMagazineCargo ["ACE_Medkit",4];  
	_this addMagazineCargo ["HandGrenade_West",5];  
	_this addMagazineCargo ["SmokeShell",5];
	_this addMagazineCargo ["30Rnd_556x45_Stanag",15];
};