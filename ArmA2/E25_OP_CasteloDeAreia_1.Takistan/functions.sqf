fnc_cacheKilled = {
	if(isServer) then {
		_pos	= getPosATL(_this);
		curTime	= time; 
		_dur	= 5 + random 5;
		if(_this != caixa4) then {
			"ARTY_R_227mm_HE" createVehicle _pos; 
			while{ true }do{ 
				"Warfare82mmMortar" createVehicle _pos; 
				if (random 100 > 70) then { "Sh_125_HE" createVehicle _pos; }; 
				if ((time - curTime) > _dur) exitWith { "ARTY_R_227mm_HE" createVehicle _pos; }; 
				sleep random 1;
			};
		};
		qtdCaixasDestruidas = qtdCaixasDestruidas +1;
		publicVariable "qtdCaixasDestruidas";
	};
};