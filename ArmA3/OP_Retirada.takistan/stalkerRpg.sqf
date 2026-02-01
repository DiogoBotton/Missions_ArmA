_arrayInimigos = ["CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_AT"];
_minDistanceToAttack = 1000;
_carsDestroy = [hmmw_1, hmmw_2, hmmw_3, caminhao_1];
_listCarsToDestroy = [];

if(isServer) then {
	// Sorteia local de spawn da infantaria
	_spawnAttack = "spawnMarker_rpg_" + localAlvo;
	_attackMarker = "attackMarker_" + localAlvo;

	_spawnMarkerRpg = getMarkerPos _spawnAttack;
	_attackLocal = getMarkerPos _attackMarker;

	{
		if(_x distance _attackLocal < _minDistanceToAttack) then {
			_listCarsToDestroy append [_x];
		};
	} forEach _carsDestroy;

	_countCars = count _listCarsToDestroy;
	_numCarActual = 0;

	while {_numCarActual < _countCars} do {
		_car = _listCarsToDestroy select _numCarActual;

		_grupoAtaque = createGroup EAST;
		{
			_TipoDeUnidade = _x;
			_grupoAtaque createUnit [_TipoDeUnidade, [(_spawnMarkerRpg select 0),(_spawnMarkerRpg select 1),0], [], 50, "CAN_COLLIDE"];

		} forEach _arrayInimigos;

		{
			// Coloca skill no máximo
			_x setskill ["courage",1];
			_x setskill ["commanding",1];
			_x setskill ["spotDistance",1];
			_x setskill ["spotTime",1];
			_x setskill ["reloadSpeed",1];
			_x setskill ["aimingAccuracy",1];
			_x setskill ["aimingShake",1];
			_x setskill ["aimingShake",1];
			
			_x removeWeapon (primaryWeapon _x);

			_x addWeapon "CUP_launch_RPG7V";
			_x addItemToBackpack "CUP_PG7VL_M";
			_x addItemToBackpack "CUP_PG7VL_M";

			//_x addEventHandler ["Fired",{if(alive _car) then {_x addItemToBackpack "CUP_PG7VL_M";};}];
		} forEach Units _grupoAtaque;

		// Define local de ataque e cria waypoint para o grupo
		_wp = _grupoAtaque addWaypoint [position _car,0];
    	_wp setWaypointType "SAD";
    	_wp setWaypointCombatMode "RED";
    	_wp setWaypointBehaviour "AWARE";
    	_wp setWaypointSpeed "FULL";
    	_wp setWaypointPosition [position _car,0];
		[_grupoAtaque, 0] waypointAttachVehicle (_car);

		_numCarActual = _numCarActual +1;
	};
};