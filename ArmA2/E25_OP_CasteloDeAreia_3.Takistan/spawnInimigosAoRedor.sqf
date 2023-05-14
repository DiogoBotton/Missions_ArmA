_arrayInimigos = ["TK_INS_Soldier_TL_EP1", "TK_INS_Soldier_wp_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_EP1", "TK_INS_Soldier_AR_EP1", "TK_INS_Soldier_Sniper_EP1", "TK_INS_Soldier_3_EP1", "TK_INS_Soldier_4_EP1"];
_arraySpawnDistancia = [300,400,500,600]; // Array de Distância aleatoria para spawn dos inimigos
_numMaxInimigos = 15; // Máximo de inimigos que serão spawnados
_intervaloSpawnInimigos = 60; // Intervalo em segundos para o spawn de inimigos
_maxSpawnDistance = 400; // Metros
_tamanhoTriggerAxisB = 100; // Número do trigger (tamanho) em axis b
_alvosVivosCount = 1; // Não Alterar
_distanciaCorresponde = true; // Não alterar
alvosVivos = [];

if(isServer) then {
	// Retorna unidades que passaram pelo "trigger da morte" (essa variável atualiza em tempo real, não utiliza-la)
	_unidades = list fimDaLinha;
	grupoInimigo = CreateGroup east;

	// Retorna uma lista com os alvos vivos que entraram no "trigger da morte"
	{
		if (side _x == west && alive _x && isPlayer _x) then
			{
				alvosVivos = alvosVivos + [_x];
			};
	} forEach _unidades;

	while {_alvosVivosCount > 0 && _distanciaCorresponde} do {
		// Baseado na lista de alvos vivos, verifica se realmente o alvo não morreu e escolhe-o como alvo
		{
		if (side _x == west && alive _x && isPlayer _x) then
			{
				_num = 0;
				_num = _num + 1;
				_alvosVivosCount = _num;
				target = _x;
			};
		} forEach alvosVivos;

		//hint format ["Unidades: %1", alvosVivos];

		// Adquire posição da unidade
		_targetPos = getPosATL target;

		// Distância aleatória
		_spawnDistancia = _arraySpawnDistancia call BIS_fnc_selectRandom;

		_qtdInimigosVivos = { alive _x } count (units grupoInimigo);

		_qtdOpforParaSpawnar = _numMaxInimigos - _qtdInimigosVivos;

		// Spawn aleatório das unidades, num raio de 300 a 600 metros do alvo
		for [{_i=1}, {_i <= _qtdOpforParaSpawnar}, {_i=_i+1}] do {
			_TipoDeUnidade = _arrayInimigos call BIS_fnc_selectRandom;
			grupoInimigo createUnit [_TipoDeUnidade, [(_targetPos select 0),(_targetPos select 1),0], [], _spawnDistancia, "NONE"];
		};

		{
			_x setVariable ["zeu_AIBypass", true];
			_x setskill ["courage",1];
			_x setskill ["commanding",1];
			_x setskill ["spotDistance",1];
			_x setskill ["spotTime",1];
			_x setskill ["reloadSpeed",1];
			_x setskill ["aimingAccuracy",0.1];
			_x setskill ["aimingShake",0.1];
			_x setskill ["aimingShake",0.1];
		} forEach units grupoInimigo;

		while {(count (waypoints grupoInimigo)) > 0} do {deleteWaypoint ((waypoints grupoInimigo) select 0);};

		_wp1 = grupoInimigo addWaypoint [_targetPos,0];
		_wp1 setWaypointType "SAD" ;  
		_wp1 setWaypointCombatMode "RED";
		_wp1 setWaypointBehaviour "AWARE";
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointPosition [_targetPos,0];
		[grupoInimigo, 0] waypointAttachVehicle (target);

		sleep _intervaloSpawnInimigos;

		_triggerPos = position fimDaLinha;
		distanciaMaximaLinha = (_maxSpawnDistance + (_tamanhoTriggerAxisB / 2));

		// Verifica se algum dos players que ativaram o trigger ainda estão a menos de 450 metros de distância
		{
		if (side _x == west && alive _x && isPlayer _x) then
			{
				_playerPos = position _x;

				// Retorna a distância do player até o trigger (simula uma linha horizontal)
				_linhaPos = [_playerPos select 0, _triggerPos select 1, 0];
				distanciaPlayerLinha = floor (([_playerPos select 0, _playerPos select 1, 0]) distance _linhaPos);

				// Distancia do player até o "trigger/linha da morte" é menor que a distância máxima?
				_distanciaCorresponde = if (distanciaPlayerLinha < distanciaMaximaLinha) then [{true},{false}];

				if(_distanciaCorresponde) exitWith {};
			};
		} forEach alvosVivos;

		//hint format ["Qtd Inimigos Vivos: %1 | Vão spawnar: %2", _qtdInimigosVivos, _qtdOpforParaSpawnar];
		//hint format ["Distância Player do Trigger: %1 | Distância máxima: %2", distanciaPlayerLinha, distanciaMaximaLinha];
	};
	//hint "Unidades blufor sairam da área ou morreram";
};