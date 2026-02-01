_arrayInimigos = ["CUP_O_TK_INS_Soldier_TL", "CUP_O_TK_INS_Sniper", "CUP_O_TK_INS_Soldier_AT","CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_AR", "CUP_O_TK_INS_Guerilla_Medic"];
_arraySpawnDistancia = [300, 350]; // Array de Distância aleatoria para spawn dos inimigos
_gritoArabeArray = ["arab1","arab2","arab3","arab4","arab5","arab6","arab7","arab8","arab9","arab10"];
_numMaxInimigos = if (!isNil "qtdGruposAtaque") then [{qtdGruposAtaque},{15}]; // Máximo de inimigos que serão spawnados por grupo
_intervaloSpawnInimigos = if (!isNil "IntervaloAtaques") then [{IntervaloAtaques},{45}]; // Intervalo em segundos para o spawn de inimigos
_alvosVivosCount = 1; // Não Alterar

// Adquire todas as unidades blufor presentes dentro do trigger
_groupOriginal = _this select 0;

if(isServer) then {
	// Cria grupo inimigo
	_grupoInimigo = CreateGroup east;

	while {_alvosVivosCount > 0} do {
		// Atualiza o grupo
		_group = group (leader _groupOriginal);

		// Faz um count no grupo e verifica a quantidade de alvos vivos
		_alvosVivosCount = { alive _x } count (units _group);

		//hint format ["Unidades: %1", _alvosVivosCount];

		// Adquire posição do líder do grupo
		_targetPos = getPosATL (leader _group);

		// Distância aleatória
		_spawnDistancia = _arraySpawnDistancia call BIS_fnc_selectRandom;

		_qtdInimigosVivos = { alive _x } count (units _grupoInimigo);

		_qtdOpforParaSpawnar = _numMaxInimigos - _qtdInimigosVivos;

		// Spawn aleatório das unidades, num raio de 300 a 600 metros do alvo
		for [{_i=1}, {_i <= _qtdOpforParaSpawnar}, {_i=_i+1}] do {
			_TipoDeUnidade = _arrayInimigos call BIS_fnc_selectRandom;
			_grupoInimigo createUnit [_TipoDeUnidade, [(_targetPos select 0),(_targetPos select 1),0], [], _spawnDistancia, "NONE"];
		};

		_gritoArabe = _gritoArabeArray call BIS_fnc_selectRandom;
		_liderGroup = (leader _grupoInimigo);
		nul = [(_liderGroup), _gritoArabe, 400] call fn_netSay3D;

		{
			_x setskill ["courage",1];
			_x setskill ["commanding",1];
			_x setskill ["spotDistance",1];
			_x setskill ["spotTime",1];
			_x setskill ["reloadSpeed",1];
			_x setskill ["aimingAccuracy",0.6];
			_x setskill ["aimingShake",0.6];
			_x setskill ["aimingShake",0.6];
		} forEach units _grupoInimigo;

		while {(count (waypoints _grupoInimigo)) > 0} do {deleteWaypoint ((waypoints _grupoInimigo) select 0);};

		_wp1 = _grupoInimigo addWaypoint [_targetPos,0];
		_wp1 setWaypointType "SAD" ;  
		_wp1 setWaypointCombatMode "RED";
		_wp1 setWaypointBehaviour "AWARE";
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointPosition [_targetPos,0];
		[_grupoInimigo, 0] waypointAttachVehicle (leader _group);

		_grupoInimigo allowFleeing 0;
		_grupoInimigo setCombatMode "RED";

		sleep _intervaloSpawnInimigos;

		// Atualiza o grupo
		_group = group (leader _groupOriginal);

		// Verifica se chegou próximo da base para não spawnar mais inimigos, mas volta a spawnar caso sair novamente.
		_nearBase = true;
		while {_nearBase} do {
			if ((leader _group) distance (getMarkerPos "marker_base") <= 1200) then {
				if(debugar == 1) then {
					sleep 5;
				} else {
					sleep _intervaloSpawnInimigos;
				};
			} else {
				_nearBase = false;
			};
		};

		//hint format ["Qtd Inimigos Vivos: %1 | Vão spawnar: %2", _qtdInimigosVivos, _qtdOpforParaSpawnar];
	};
	//hint "Unidades blufor morreram";
};