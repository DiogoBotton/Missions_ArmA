// Este script irá spawnar tropas rastreadoras enquanto houver unidades blufor player vivas
// Caso todas as unidades rastreadores forem mortas, spawnará outra após tempo determinado na váriavel: _intervaloSpawn

_arrayInimigosCarros = ["CUP_O_TK_INS_Soldier_TL", "CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_GL"];
_arrayCars = ["CUP_O_BTR40_MG_TKM", "CUP_O_BTR40_MG_TKM", "CUP_O_Hilux_armored_BTR60_TK_INS", "CUP_O_T34_TKA"];
_spawnMarkerCarTracker = "spawnMarker_car_tracker";
_distPista = 200;
_distSpawnRastreadores = 700;
_intervaloSpawn = 120;
_distProximaPista = 50;

anyBluforAlive2 = true;
anyTrackerAlive2 = true;

if(isServer) then {
	// Loop de repetição para respawnar rastreadores enquanto houver unidades blufor vivas (caso todas morrerem)
	while {anyBluforAlive2} do {
		anyTrackerAlive2 = true;

		// Retorna o atual líder de blufor
		{
			if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x) && typeOf vehicle _x != "CUP_B_US_Pilot_Light") then
				{
					liderBlufor2 = _x;
				};
		} forEach allUnits;

		_grupoAtaqueCarro = createGroup EAST;

		_TipoVeiculo = _arrayCars call BIS_fnc_selectRandom;
		_veiculoAtaque = createVehicle [_TipoVeiculo, (getmarkerPos _spawnMarkerCarTracker),[],5,"CAN_COLLIDE"];

		{
			_TipoDeUnidade = _x;
			_grupoAtaqueCarro createUnit [_TipoDeUnidade, (getmarkerPos _spawnMarkerCarTracker), [], 50, "CAN_COLLIDE"];
		} forEach _arrayInimigosCarros;

		_ContagemDaEquipe = 1;
		{
			if (_ContagemDaEquipe == 1) then {_x moveInGunner _veiculoAtaque;};
			if (_ContagemDaEquipe == 2) then {_x moveInDriver _veiculoAtaque;};
			if (_ContagemDaEquipe >= 2) then {_x moveInCargo _veiculoAtaque;};
			_ContagemDaEquipe = _ContagemDaEquipe +1;
		} forEach units group (leader _grupoAtaqueCarro);

		// Aumenta skills: coragem, precisão de tiro, etc
		{
			_x setskill ["courage",1];
			_x setskill ["commanding",1];
			_x setskill ["spotDistance",0.8];
			_x setskill ["spotTime",1];
			_x setskill ["reloadSpeed",1];
			_x setskill ["aimingAccuracy",0.6];
			_x setskill ["aimingShake",0.6];
			_x setskill ["aimingShake",0.6];
		} forEach Units _grupoAtaqueCarro;

		// Loop de repetição que verifica posição blufor a cada x segundos
		while {anyBluforAlive2 && anyTrackerAlive2} do {
			// Retorna o atual líder de blufor
			{
				if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
					{
						liderBlufor2 = _x;
					};
			} forEach allUnits;

			// Remove waypoint anterior
			while {(count (waypoints _grupoAtaqueCarro)) > 0} do {deleteWaypoint ((waypoints _grupoAtaqueCarro) select 0);};

			// Define local *aproximado* da localização do líder blufor
			_pista2 = createVehicle ["HeliHEmpty", (position liderBlufor2),[],(_distPista), "NONE"];

			// Cria waypoint para grupo com carro
			_wp2 = _grupoAtaqueCarro addWaypoint [position _pista2,0];
    		_wp2 setWaypointType "SAD";
    		_wp2 setWaypointCombatMode "RED";
    		_wp2 setWaypointBehaviour "AWARE";
    		_wp2 setWaypointSpeed "FULL";
    		_wp2 setWaypointPosition [position _pista2,0];

			// Verifica se rastreadores chegaram perto da pista para irem à próxima
			_grupoPertoDaPista2 = false;
			while {!_grupoPertoDaPista2} do {
				{
					if (side _x == east && alive _x && (leader group _x == leader _x)) then
					{
						if((_x distance _pista2 <= _distProximaPista) && _x distance liderBlufor >= _distProximaPista) then {
							_grupoPertoDaPista2 = true;
							break;
						} else {
							sleep 1;
						};
					} else {
						// Caso todos os rastreadores morram, sai do loop
						_grupoPertoDaPista2 = true;
						break;
					};
				} forEach Units _grupoAtaqueCarro;
			};

			deleteVehicle _pista2;

			// Verifica se há alguma unidade blufor player viva
			anyBluforAlive2 = false;
			{
				if (side _x == west && alive _x && isPlayer _x) then
					{
						anyBluforAlive2 = true;
						break;
					};
			} forEach allUnits;

			// Verifica se há alguma unidade rastreadora viva
			anyTrackerAlive2 = false;
			{
				if (side _x == east && alive _x) then
					{
						anyTrackerAlive2 = true;
						break;
					};
			} forEach Units _grupoAtaqueCarro;
		};

		if(debugar == 1) then {
			sleep 10;
		} else {
			sleep _intervaloSpawn;
		};
	};
};