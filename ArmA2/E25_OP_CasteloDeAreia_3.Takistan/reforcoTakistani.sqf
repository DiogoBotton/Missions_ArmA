_arrayInimigos = ["TK_INS_Soldier_TL_EP1", "TK_INS_Soldier_wp_EP1", "TK_INS_Bonesetter_EP1", "TK_INS_Soldier_AT_EP1", "TK_INS_Soldier_EP1", "TK_INS_Soldier_AR_EP1", "TK_INS_Soldier_Sniper_EP1", "TK_INS_Soldier_3_EP1", "TK_INS_Soldier_4_EP1"];
_qtdUnidades = 14;
_spawnVeiculo = _this select 0;
_localAtaque = _this select 1;

if(isServer) then {
	_grupoInimigo = CreateGroup east;
	_veiculo = createVehicle ["M113_TK_EP1", getmarkerPos _spawnVeiculo,[],35,"CAN_COLLIDE"];

	for [{_i=1}, {_i <= _qtdUnidades}, {_i=_i+1}] do {
		_TipoDeUnidade = _arrayInimigos call BIS_fnc_selectRandom;
		_grupoInimigo createUnit [_TipoDeUnidade, [(getmarkerPos _spawnVeiculo select 0),(getmarkerPos _spawnVeiculo select 1),0], [], 35, "CANCOLLIDE"];
	};

	//Mover unidades para o veiculo
	_ContagemDaEquipe = 1;
	{		
		if (_ContagemDaEquipe == 1) then {_x moveInDriver _veiculo;}; 
		if (_ContagemDaEquipe == 2) then {_x moveInGunner _veiculo;};
		if (_ContagemDaEquipe >= 3) then {_x moveInCargo _veiculo;};
		_ContagemDaEquipe = _ContagemDaEquipe + 1;
	} foreach units group (leader _grupoInimigo);

	_wp1 = _grupoInimigo addWaypoint [getMarkerPos _localAtaque,10];
	_wp1 setWaypointType "MOVE" ;  
	_wp1 setWaypointCombatMode "RED";
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointSpeed "FULL";
	_wp1 setWaypointPosition [getMarkerPos _localAtaque,10];
};