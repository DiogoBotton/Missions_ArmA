// Este script irá spawnar tropas rastreadoras enquanto houver unidades blufor player vivas
// Caso todas as unidades rastreadores forem mortas, spawnará outra após tempo determinado na váriavel: _intervaloSpawn

_arrayInimigos = ["CUP_O_TK_INS_Soldier_TL", "CUP_O_TK_INS_Sniper", "CUP_O_TK_INS_Sniper", "CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_AR", "CUP_O_TK_INS_Guerilla_Medic"];
_distPista = 200;
_distSpawnRastreadores = 700;
_intervaloSpawn = 300;
_distProximaPista = 50;

anyBluforAlive = true;
anyTrackerAlive = true;

if(isServer) then {
	// Loop de repetição para respawnar rastreadores enquanto houver unidades blufor vivas (caso todas morrerem)
	while {anyBluforAlive} do {
		anyTrackerAlive = true;

		// Retorna o atual líder de blufor
		{
			if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
				{
					liderBlufor = _x;
				};
		} forEach allUnits;

		// Define local para spawnar rastreadores baseado na posição do líder blufor
		_spawnLocal = createVehicle ["HeliHEmpty", (position liderBlufor),[],(_distSpawnRastreadores), "NONE"];

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
			while {(count (waypoints _grupoAtaque)) > 0} do {deleteWaypoint ((waypoints _grupoAtaque) select 0);};

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
						if(_x distance _pista <= _distProximaPista) then {
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
				} forEach Units _grupoAtaque;
			};

			deleteVehicle _pista;

			// Verifica se há alguma unidade blufor player viva
			anyBluforAlive = false;
			{
				if (side _x == west && alive _x && isPlayer _x) then
					{
						anyBluforAlive = true;
						break;
					};
			} forEach allUnits;

			// Verifica se há alguma unidade rastreadora viva
			anyTrackerAlive = false;
			{
				if (side _x == east && alive _x) then
					{
						anyTrackerAlive = true;
						break;
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