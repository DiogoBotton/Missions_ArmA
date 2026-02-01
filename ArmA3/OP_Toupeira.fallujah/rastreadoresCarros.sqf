// Este script irá spawnar tropas rastreadoras enquanto houver unidades blufor player vivas
// Caso todas as unidades rastreadores forem mortas, spawnará outra após tempo determinado na váriavel: _intervaloSpawn

_arrayInimigosCarros = ["CUP_O_TK_INS_Soldier_TL", "CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_GL"];
_arrayCars = ["CUP_O_BTR40_MG_TKM", "CUP_O_BTR40_MG_TKM", "CUP_O_Hilux_armored_DSHKM_TK_INS", "CUP_O_Hilux_DSHKM_TK_INS"];
_spawnMarkerCarTrackerArray = ["spawnMarker_car_tracker_1", "spawnMarker_car_tracker_2", "spawnMarker_car_tracker_3", "spawnMarker_car_tracker_4"];
_distPista = 100;
_intervaloSpawn = if (!isNil "IntervaloAtaques") then [{IntervaloAtaques},{120}];
_distProximaPista = 50;

// Adquire todas as unidades blufor presentes dentro do trigger
_groupOriginal = _this select 0;

_anyBluforAlive = 1;
_anyTrackerAlive = 1;

if(isServer) then {
	// Loop de repetição para respawnar rastreadores enquanto houver unidades blufor vivas (caso todas morrerem)
	while {_anyBluforAlive > 0} do {
		// Atualiza o grupo
		_group = group (leader _groupOriginal);

		_anyTrackerAlive = 1;
		_anyBluforAlive = { alive _x } count (units _group);

		_grupoAtaqueCarro = createGroup EAST;

		_spawnMarkerCarTracker = _spawnMarkerCarTrackerArray call BIS_fnc_selectRandom;
		_TipoVeiculo = _arrayCars call BIS_fnc_selectRandom;
		_veiculoAtaque = createVehicle [_TipoVeiculo, (getmarkerPos _spawnMarkerCarTracker),[],50,"CAN_COLLIDE"];

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
		while {_anyBluforAlive > 0 && _anyTrackerAlive > 0} do {
			// Remove waypoint anterior
			while {(count (waypoints _grupoAtaqueCarro)) > 0} do {deleteWaypoint ((waypoints _grupoAtaqueCarro) select 0);};

			// Define local *aproximado* da localização do líder blufor
			_pista = createVehicle ["HeliHEmpty", (position (leader _group)),[],(_distPista), "NONE"];

			// Cria waypoint para grupo com carro
			_wp2 = _grupoAtaqueCarro addWaypoint [position _pista,0];
    		_wp2 setWaypointType "SAD";
    		_wp2 setWaypointCombatMode "RED";
    		_wp2 setWaypointBehaviour "AWARE";
    		_wp2 setWaypointSpeed "NORMAL";
    		_wp2 setWaypointPosition [position _pista,0];

			// Verifica se rastreadores chegaram perto da pista para irem à próxima
			_grupoPertoDaPista = false;
			while {!_grupoPertoDaPista} do {
				{
					if (side _x == east && alive _x && (leader group _x == leader _x)) then
					{
						if((_x distance _pista <= _distProximaPista) && _x distance (leader _group) >= _distProximaPista) then {
							_grupoPertoDaPista = true;
							break;
						} else {
							sleep 1;
						};
					} else {
						// Caso todos os rastreadores morram, sai do loop
						_grupoPertoDaPista = true;
						break;
					};
				} forEach Units _grupoAtaqueCarro;
			};

			deleteVehicle _pista;

			// Verifica se há alguma unidade blufor player viva
			_anyBluforAlive = { alive _x } count (units _group);

			// Verifica se há alguma unidade rastreadora viva
			_anyTrackerAlive = { alive _x } count (units _grupoAtaqueCarro);
		};

		if(debugar == 1) then {
			sleep 10;
		} else {
			sleep _intervaloSpawn;
		};

		// Atualiza o grupo
		_group = group (leader _groupOriginal);

		// Verifica se chegou próximo da base para não spawnar mais inimigos, mas volta a spawnar caso sair novamente.
		_nearBase = true;
		while {_nearBase} do {
			if ((leader _group) distance (getMarkerPos "marker_base") <= 1200) then {
				if(debugar == 1) then {
					sleep 5;
				} else {
					sleep _intervaloSpawn;
				};
			} else {
				_nearBase = false;
			};
		};
	};
};