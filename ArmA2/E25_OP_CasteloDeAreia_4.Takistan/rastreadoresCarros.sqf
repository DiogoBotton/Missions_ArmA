// Este script irá spawnar tropas rastreadoras enquanto houver unidades blufor player vivas
// Caso todas as unidades rastreadores forem mortas, spawnará outra após tempo determinado na váriavel: _intervaloSpawn
// Para spawnar um carro rastreador, no chamamento do script coloque como o exemplo abaixo:
//
// 1° exemplo: nul = ["nomeDoMarker_", 2] execVM "rastreadoresCarros.sqf";
// 2° exemplo: nul = ["rastreadoresCarros_", 3] execVM "rastreadoresCarros.sqf";
//
// O 1° exemplo spawnará 1 carro em algum dos 2 markers criados
// O 2° exemplo spawnará 1 carro em algum dos 3 markers criados

_arrayInimigosCarros = ["TK_Soldier_SL_EP1", "TK_Soldier_GL_EP1"];
_arrayCars = ["UAZ_MG_TK_EP1", "LandRover_MG_TK_EP1"];
_intervaloSpawn = 30;

_spawnMarkerCarTracker = _this select 0;
_qtdMarkers = _this select 1;

if(isServer) then {
	// Loop de repetição para respawnar rastreadores enquanto houver unidades blufor vivas (caso todas morrerem)
	while {alive civilPararReforcos} do {

		_numRandom = [1, _qtdMarkers] call BIS_fnc_randomInt;
		_markerCarTrackerNameRandom = _spawnMarkerCarTracker + str _numRandom;

		_grupoAtaqueCarro = createGroup EAST;

		_TipoVeiculo = _arrayCars call BIS_fnc_selectRandom;
		_veiculoAtaque = createVehicle [_TipoVeiculo, (getmarkerPos _markerCarTrackerNameRandom),[],5,"CAN_COLLIDE"];

		{
			_TipoDeUnidade = _x;
			_grupoAtaqueCarro createUnit [_TipoDeUnidade, (getmarkerPos _markerCarTrackerNameRandom), [], 50, "CAN_COLLIDE"];
		} forEach _arrayInimigosCarros;

		_ContagemDaEquipe = 1;
		{
			if (_ContagemDaEquipe == 1) then {_x moveInGunner _veiculoAtaque;};
			if (_ContagemDaEquipe == 2) then {_x moveInDriver _veiculoAtaque;};
			if (_ContagemDaEquipe > 2) then {_x moveInCargo _veiculoAtaque;};
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

		// Enquanto o veículo e a equipe estiverem vivos (ao menos 3 membros) continua loop, do contrário, sai do loop e spawna outro veículo
		while { alive _veiculoAtaque && {alive _x} count units _grupoAtaqueCarro > 1} do {
			// Retorna o atual líder de blufor
			{
				if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then {
					target_car = _x;
				};
			} forEach allUnits;

			// Adquire posição da unidade
			_targetPos = position target_car;

			[_grupoAtaqueCarro, currentWaypoint _grupoAtaqueCarro] setWaypointPosition [getPosASL ((units _grupoAtaqueCarro) select 0), -1];
			sleep 0.1;
			while { (count (waypoints _grupoAtaqueCarro)) > 0 } do {
				deleteWaypoint ((waypoints _grupoAtaqueCarro) select 0);
			};

			_wp1 = _grupoAtaqueCarro addWaypoint [_targetPos, 0];
			_wp1 setWaypointType "SAD";
			_wp1 setWaypointCombatMode "RED";
			_wp1 setWaypointBehaviour "AWARE";
			_wp1 setWaypointSpeed "FULL";
			_wp1 setWaypointPosition [_targetPos, 0];
			[_grupoAtaqueCarro, 0] waypointAttachVehicle (vehicle target_car);

			sleep 120; // Espera 2 minutos antes de verificar novamente a posição do líder blufor
		};

		if(debugar == 1) then {
			sleep 10;
		} else {
			sleep _intervaloSpawn;
		};
	};
};