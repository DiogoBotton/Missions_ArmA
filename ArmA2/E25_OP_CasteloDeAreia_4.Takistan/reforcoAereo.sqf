_markerNameSpawn = _this select 0;
_qtdMarkers = _this select 1;

if (isServer) then {
	while { alive civilPararReforcos } do {
		_numRandom = [1, _qtdMarkers] call BIS_fnc_randomInt;
		_markerNameSpawnRandom = _markerNameSpawn + str _numRandom;

		_heliInimigoGroup = createGroup east;

		// Spawnar heli
		_heliEast = createVehicle ["UH1H_TK_EP1", getmarkerPos _markerNameSpawnRandom, [], 0, "FLY"];

		// Função que cria tripulação e move-as para o veículo
		[_heliEast, _heliInimigoGroup] call BIS_fnc_spawnCrew;

		// Alterar IA para não sentir medo
		{
			_x setskill ["courage", 1];
			_x setskill ["commanding", 1];
			_x setskill ["spotDistance", 1];
			_x setskill ["spotTime", 1];
			_x setskill ["reloadSpeed", 1];
			_x setskill ["aimingAccuracy", 0.1];
			_x setskill ["aimingShake", 0.1];
			_x setskill ["aimingShake", 0.1];
			_x allowFleeing 0;
		} forEach units group (leader _heliInimigoGroup);

		while { alive _heliEast } do {
			// Retorna o atual líder de blufor
			{
				if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then {
					target_heli = _x;
				};
			} forEach allUnits;

			// Adquire posição da unidade
			_targetPos = position target_heli;

			[_heliInimigoGroup, currentWaypoint _heliInimigoGroup] setWaypointPosition [getPosASL ((units _heliInimigoGroup) select 0), -1];
			sleep 0.1;
			while { (count (waypoints _heliInimigoGroup)) > 0 } do {
				deleteWaypoint [_heliInimigoGroup, 0];
			};

			_wp1 = _heliInimigoGroup addWaypoint [_targetPos, 0];
			_wp1 setWaypointType "SAD";
			_wp1 setWaypointCombatMode "RED";
			_wp1 setWaypointBehaviour "AWARE";
			_wp1 setWaypointSpeed "FULL";
			_wp1 setWaypointPosition [_targetPos, 0];
			[_heliInimigoGroup, 0] waypointAttachVehicle (vehicle target_heli);

			sleep 120; // Espera 2 minutos antes de verificar novamente a posição do líder blufor
		};

		sleep 20;
	};
};