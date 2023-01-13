if(!ufo_attack && isServer) then {
	ufo enableAI "MOVE";

	ufo_attack = true;
	publicVariable "ufo_attack";

	ufo move getMarkerPos "move_marker";

	while {alive ufo && !unitReady ufo} do 
	{
		sleep 1;
	};

	nul = [ufo, "tripod"] call fn_netSay3D;

	{
		_x action ["EJECT", ufo];
		sleep 0.5;
	} forEach units alienL;

	sleep 1;

	_grp = group ufo;
	_wp = _grp addWaypoint [getMarkerPos "move_alien", 1];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "NORMAL";
	[_grp, 1] setWaypointPosition [getMarkerPos "move_alien", 0];
};