// Nome de markers de spawn de inimigos/reforços
_respawnInimigoMarker = ["enemyLocation_1", "enemyLocation_2", "enemyLocation_3", "enemyLocation_4", "enemyLocation_5", "enemyLocation_6", "enemyLocation_7"];

_markersAtaque = ["attack_1", "attack_2"];

_arrayInimigos = ["CUP_O_TK_INS_Soldier_TL", "CUP_O_TK_INS_Sniper", "CUP_O_TK_INS_Soldier", "CUP_O_TK_INS_Soldier", "CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_AT","CUP_O_TK_INS_Soldier_Enfield", "CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Bomber", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_AR", "CUP_O_TK_INS_Soldier_AR", "CUP_O_TK_INS_Guerilla_Medic"];
_arrayCarrosInimigos = ["CUP_O_Hilux_DSHKM_TK_INS", "CUP_O_LR_MG_TKM"];

_arrayTempoInicio = [600, 900, 1200, 1800];
_arrayTempoOndas = [180, 300, 480, 600, 780];

// Parâmetros da missão
_qtdMaxInimigos = QtdMaxInimigos;
_qtdInimigosPorGrupos = 8; // NÃO ALTERAR, A MENOS QUE MODIFIQUE O PARÂMETRO DE DIFICULDADE NO DESCRIPTION.EXT PARA A QTD DESEJADA

anyAlive = true;

fnc_tempo_ondas = {
	if(debugar == 0) then {
		_tempoOndas = TempoOndas;

		if(_tempoOndas == -1) then {
			_tempoOndas = _arrayTempoOndas call BIS_fnc_selectRandom;
		};

		_intervalo = _tempoOndas + 120;
		timeSleep = [_tempoOndas, _intervalo] call BIS_fnc_randomInt;
	} else {
		timeSleep = 5;
	};

	sleep timeSleep;
};

if(debugar == 0) then {
	_tempoInicio = TempoInicio;

	if(_tempoInicio == -1) then {
		_tempoInicio = _arrayTempoInicio call BIS_fnc_selectRandom;
	};
	
	sleep _tempoInicio;
} else {
	sleep 5;
};

if (isServer) then {
	while {anyAlive && alive civil_reforcos} do {
		anyAlive = false;
		
		// Verifica se existe ao menos 1 BLUFOR vivo, caso não, na próxima repetição sai do loop
		{
		if (side _x == west && isPlayer _x) then
			{
				if (alive _x) then{
					anyAlive = true;
					break;
				};
			};
		} forEach allUnits;

		_numOpforsAlive = 0;
		// Verifica quantidade de opfors vivos
		{
		if (side _x == east && alive _x) then
			{
				_numOpforsAlive = _numOpforsAlive + 1;
			};
		} forEach allUnits;

		// Calculo para definir quantos grupos de unidades serão criadas baseado na _qtdInimigosPorGrupos
		_numInimigosDisponiveis = _qtdMaxInimigos - _numOpforsAlive;
		_numGruposParaCriar = floor (_numInimigosDisponiveis / _qtdInimigosPorGrupos);

		//hint format ["Qtd Inimigos Vivos: %1 | Grupos para spawnar: %2", _numOpforsAlive, _numGruposParaCriar];

		// Loop para criação dos grupos de inimigos
		for [{_i=0}, {_i < _numGruposParaCriar}, {_i=_i+1}] do {
			_grupoInimigo = createGroup EAST;
			
			_localSpawn = _respawnInimigoMarker call BIS_fnc_selectRandom;

			for [{_y=0}, {_y < _qtdInimigosPorGrupos}, {_y=_y+1}] do {
				_TipoDeUnidade = _ArrayInimigos call BIS_fnc_selectRandom;
				_grupoInimigo createUnit [_TipoDeUnidade, [(getMarkerPos _localSpawn select 0),(getMarkerPos _localSpawn select 1),0], [], 10, "CAN_COLLIDE"];
			};

			randomNumber = random 1;
			_50CalProb = ProbEsturro;

			// Caso número randomico for maior que a probabilidade de esturro, spawna carro com .50 e adiciona 2 unidades como driver e gunner
			if (randomNumber > _50CalProb) then {
				_TipoVeiculo = _arrayCarrosInimigos call BIS_fnc_selectRandom;
				_veiculoInimigo = createVehicle [_TipoVeiculo, getmarkerPos _localSpawn,[],35,"CAN_COLLIDE"];

				_ContagemDaEquipe = 1;
				{
					if (_ContagemDaEquipe == 1) then {_x moveInGunner _veiculoInimigo;};
					if (_ContagemDaEquipe == 2) then {_x moveInDriver _veiculoInimigo;};
					_ContagemDaEquipe = _ContagemDaEquipe +1;
				} forEach units group (leader _grupoInimigo);
			};
			
			// Define local de ataque e cria waypoint para o grupo
			_localAtaque = _markersAtaque call BIS_fnc_selectRandom;
			_wp = _grupoInimigo addWaypoint [getMarkerPos _localAtaque,0];
    		_wp setWaypointType "MOVE";
    		_wp setWaypointCombatMode "RED";
    		_wp setWaypointBehaviour "AWARE";
    		_wp setWaypointSpeed "FULL";
    		_wp setWaypointPosition [getMarkerPos _localAtaque,0];

			call fnc_tempo_ondas;
		};

		if (_numGruposParaCriar <= 0) then {call fnc_tempo_ondas;};
	};
};