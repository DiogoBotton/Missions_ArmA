{
	// Verifica se a unidade é Independent (alien) e se é líder atual do grupo
	if(side _x == resistance && (leader group _x == leader _x)) then {
		_grp = group _x;
		_wp = _grp addWaypoint [getMarkerPos "ufo_attack", 1];
		_wp setWaypointType "DESTROY";
		_wp setWaypointSpeed "FULL";
		[_grp, 1] setWaypointPosition [getMarkerPos "ufo_attack", 300];
	};	
} forEach allUnits;