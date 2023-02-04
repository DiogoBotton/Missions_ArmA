_markerNameSpawn = _this select 0;

if(isServer) then {
	_heliInimigoGroup = CreateGroup east;

	// Spawnar heli
	_heliEast = createVehicle ["UH1H_TK_EP1", getmarkerPos _markerNameSpawn,[],0,"FLY"];

	// Função que cria tripulação e move-as para o veículo
	[_heliEast, _heliInimigoGroup] call BIS_fnc_SpawnCrew;

	// Alterar IA para não sentir medo
	{
		_x setskill ["courage",1];
		_x setskill ["commanding",1];
		_x setskill ["spotDistance",1];
		_x setskill ["spotTime",1];
		_x setskill ["reloadSpeed",1];
		_x setskill ["aimingAccuracy",0.1];
		_x setskill ["aimingShake",0.1];
		_x setskill ["aimingShake",0.1];
		_x allowFleeing 0;
	} forEach units group (leader _heliInimigoGroup);

	while {alive _heliEast} do {
		// Retorna o atual líder de blufor
		{
			if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
				{
					target = _x;
				};
		} forEach allUnits;

		// Adquire posição da unidade
		_targetPos = getPosATL target;

		while {(count (waypoints _heliInimigoGroup)) > 0} do {deleteWaypoint ((waypoints _heliInimigoGroup) select 0);};

		_wp1 = _heliInimigoGroup addWaypoint [_targetPos,0];
		_wp1 setWaypointType "SAD" ;  
		_wp1 setWaypointCombatMode "RED";
		_wp1 setWaypointBehaviour "AWARE";
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointPosition [_targetPos,0];
		[_heliInimigoGroup, 0] waypointAttachVehicle (target);

		sleep 120;
	};
};