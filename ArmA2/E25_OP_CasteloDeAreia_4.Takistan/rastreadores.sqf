// Este script irá spawnar tropas rastreadoras enquanto houver unidades blufor player vivas
// Caso todas as unidades rastreadores forem mortas, spawnará outra após tempo determinado na váriavel: _intervaloSpawn

_arrayInimigos = ["TK_Soldier_SL_EP1", "TK_Soldier_GL_EP1", "TK_Soldier_MG_EP1", "TK_Soldier_AT_EP1", "TK_Soldier_AT_EP1", "TK_Soldier_Medic_EP1"];
//_arrayInimigos = ["TK_Soldier_SL_EP1"];
_distPista = 10; // Distância aproximada da pista onde os rastreadores irão procurar
_distSpawnRastreadores = 700; // Distância máxima para spawnar rastreadores perto do líder blufor
_distanciaSpawnMinima = 300; // Distância mínima para spawnar rastreadores perto do líder blufor
_intervaloSpawn = 60; // Tempo em segundos para spawnar novo grupo de rastreadores
_distProximaPista = 50; // Distância mínima para rastreadores irem para a próxima pista

anyBluforAlive = true;
anyTrackerAlive = true;

if(isServer) then {
	// Loop de repetição para respawnar rastreadores enquanto houver unidades blufor vivas (caso todas morrerem)
	while {anyBluforAlive && alive civilPararReforcos} do {
		anyTrackerAlive = true;

		// Retorna o atual líder de blufor
		{
			if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
				{
					liderBlufor = _x;
				};
		} forEach allUnits;

		// Define local para spawnar rastreadores baseado na posição do líder blufor - TODO (spawnar no eixo z 0)
		_liderPosition = position liderBlufor;
		_spawnLocal = createVehicle ["HeliHEmpty", [(_liderPosition select 0), (_liderPosition select 1), 0],[],(_distSpawnRastreadores), "NONE"];

		// Verifica se o spawn está muito perto do líder blufor, caso sim, cria outro spawn
		while {_spawnLocal distance _liderPosition < _distanciaSpawnMinima} do {
			deleteVehicle _spawnLocal;
			_spawnLocal = createVehicle ["HeliHEmpty", [(_liderPosition select 0), (_liderPosition select 1), 0],[],(_distSpawnRastreadores), "NONE"];
			sleep 1;
		};

		// Cria grupo de rastreador
		_grupoAtaque = createGroup EAST;
		{
			_TipoDeUnidade = _x;
			_grupoAtaque createUnit [_TipoDeUnidade, position _spawnLocal, [], 50, "CAN_COLLIDE"];
		} forEach _arrayInimigos;

		deleteVehicle _spawnLocal;

		// Aumenta skills: coragem, precisão de tiro, etc
		{
			_x setskill ["courage",1];
			_x setskill ["commanding",1];
			_x setskill ["spotDistance",1];
			_x setskill ["spotTime",1];
			_x setskill ["reloadSpeed",1];
			_x setskill ["aimingAccuracy",0.6];
			_x setskill ["aimingShake",0.6];
			_x setskill ["aimingShake",0.6];
		} forEach Units _grupoAtaque;

		// Loop de repetição que verifica posição blufor a cada x segundos
		while {anyBluforAlive && anyTrackerAlive} do {
			// Retorna o atual líder de blufor
			{
				if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
					{
						liderBlufor = _x;
					};
			} forEach allUnits;

			// Remove waypoint anterior
			[_grupoAtaque, currentWaypoint _grupoAtaque] setWaypointPosition [getPosASL ((units _grupoAtaque) select 0), -1];
			sleep 0.1;
			while { (count (waypoints _grupoAtaque)) > 0 } do {
				deleteWaypoint [_grupoAtaque, 0];
			};

			// Define local *aproximado* da localização do líder blufor
			_pista = createVehicle ["HeliHEmpty", (position liderBlufor),[],(_distPista), "NONE"];

			// Define local de ataque e cria waypoint para o grupo
			_wp = _grupoAtaque addWaypoint [position _pista,0];
    		_wp setWaypointType "SAD";
    		_wp setWaypointCombatMode "RED";
    		_wp setWaypointBehaviour "AWARE";
    		_wp setWaypointSpeed "FULL";
    		_wp setWaypointPosition [position _pista,0];

			// Verifica se rastreadores chegaram perto da pista para irem à próxima
			_grupoPertoDaPista = false;
			while {!_grupoPertoDaPista} do {
				{
					if (side _x == east && alive _x && (leader group _x == leader _x)) then
					{
						if((_x distance _pista <= _distProximaPista) && _x distance liderBlufor >= _distProximaPista) then {
							_grupoPertoDaPista = true; // Sim poderia ter o break, porém não tem no arma 2, apenas no arma 3
						} else {
							sleep 1;
						};
					} else {
						// Caso todos os rastreadores morram, sai do loop
						_grupoPertoDaPista = true;
					};
				} forEach Units _grupoAtaque;
			};

			deleteVehicle _pista;

			// Verifica se há alguma unidade blufor player viva
			anyBluforAlive = false;
			{
				if (side _x == west && alive _x && isPlayer _x) then
					{
						anyBluforAlive = true;
					};
			} forEach allUnits;

			// Verifica se há alguma unidade rastreadora viva
			anyTrackerAlive = false;
			{
				if (side _x == east && alive _x) then
					{
						anyTrackerAlive = true;
					};
			} forEach Units _grupoAtaque;
		};

		if(debugar == 1) then {
			sleep 10;
		} else {
			sleep _intervaloSpawn;
		};
	};
};