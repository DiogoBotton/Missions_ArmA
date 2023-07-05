_spawnMarkerName = _this select 0;
_spawnMarkerAttack = _this select 1;

if (UnidadesReforcos == 1) then {
	arrayReforces = ["B_USAUSMC_Squad_Leader_90WDL_01","B_USAUSMC_Autorifleman_90WDL_01", "B_USAUSMC_Autorifleman_90WDL_01", "B_USAUSMC_Assistant_AR_90WDL_01", "B_USAUSMC_Assistant_AR_90WDL_01", "B_USAUSMC_Corpsman_90WDL_01"];
	arrayCars = ["B_USAUSMC_M1025_M2_90WDL_02", "B_USAUSMC_M1025_M240_90WDL_02"];
} else {
	arrayReforces = ["CUP_B_USMC_Soldier_SL", "CUP_B_USMC_Soldier_AR", "CUP_B_USMC_Soldier_AR", "CUP_B_USMC_Soldier_MG", "CUP_B_USMC_Soldier_LAT", "CUP_B_USMC_Medic"];
	arrayCars = ["CUP_B_nM1025_M2_USMC_WDL", "CUP_B_nM1025_M240_USMC_WDL"];
};

_qtdGroups = 4;
_qtdCars = 2;
_qtdUnitsPerCar = 3;

if (isServer) then {
	// Gera x Carros
	for [{z=0}, {z < _qtdCars}, {z=z+1}] do {
		_grupoReforcosCar = createGroup WEST;

		_TipoVeiculo = arrayCars call BIS_fnc_selectRandom;
		_veiculoReforco = createVehicle [_TipoVeiculo, getmarkerPos _spawnMarkerName,[],50,"CAN_COLLIDE"];

		for [{y=0}, {y < _qtdUnitsPerCar}, {y=y+1}] do {
			_TipoDeUnidade = arrayReforces call BIS_fnc_selectRandom;
			_grupoReforcosCar createUnit [_TipoDeUnidade, [(getMarkerPos _spawnMarkerName select 0),(getMarkerPos _spawnMarkerName select 1),0], [], 50, "CAN_COLLIDE"];
		};

		_ContagemDaEquipe = 1;
		{
			if (_ContagemDaEquipe == 1) then {_x moveInGunner _veiculoReforco;};
			if (_ContagemDaEquipe == 2) then {_x moveInDriver _veiculoReforco;};
			if (_ContagemDaEquipe >= 2) then {_x moveInCargo _veiculoReforco;};
			_ContagemDaEquipe = _ContagemDaEquipe +1;
		} forEach units group (leader _grupoReforcosCar);

		// Define local de ataque e cria waypoint para o grupo
		_wp1 = _grupoReforcosCar addWaypoint [getMarkerPos _spawnMarkerAttack,0];
    	_wp1 setWaypointType "MOVE";
    	_wp1 setWaypointCombatMode "RED";
    	_wp1 setWaypointBehaviour "AWARE";
    	_wp1 setWaypointSpeed "FULL";
    	_wp1 setWaypointPosition [getMarkerPos _spawnMarkerAttack,0];
	};
	
	sleep 15;
	// Gera x Fire Team's
	for [{i=0}, {i < _qtdGroups}, {i=i+1}] do {
		_grupoReforcos = createGroup WEST;
		{
			_TipoDeUnidade = _x;
			_grupoReforcos createUnit [_TipoDeUnidade, [(getMarkerPos _spawnMarkerName select 0),(getMarkerPos _spawnMarkerName select 1),0], [], 50, "CAN_COLLIDE"];
			
		} forEach arrayReforces;

		// Define local de ataque e cria waypoint para o grupo
		_wp = _grupoReforcos addWaypoint [getMarkerPos _spawnMarkerAttack,0];
    	_wp setWaypointType "MOVE";
    	_wp setWaypointCombatMode "RED";
    	_wp setWaypointBehaviour "AWARE";
    	_wp setWaypointSpeed "FULL";
    	_wp setWaypointPosition [getMarkerPos _spawnMarkerAttack,0];
	};
};