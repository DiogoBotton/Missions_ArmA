_spawnMarker = _this select 0;
_moveMarker = _this select 1;

_timeSleepHb = 300;

if(isServer) then {
	sleep _timeSleepHb;
	
	_hbAGroup = CreateGroup civilian;
	_hbAGroup createUnit ["TK_CIV_Takistani01_EP1", (getMarkerPos _spawnMarker), [], 0, "CANCOLLIDE"];

	{
		_x disableAI "FSM"; 
		_x setBehaviour "CARELESS";
		_x allowFleeing 0;
		_x setSkill ["courage", 1];
		_x move getMarkerPos _moveMarker;
		hbA = _x;
		publicVariable "hbA";
	} forEach units group (leader _hbAGroup);

	while {(alive hbA && !unitReady hbA)} do 
	{
		sleep 1;
	};

	hbA disableAI "MOVE";
	hbA action ["surrender", hbA];

	hbArrependido = true;
    publicVariable "hbArrependido";

	while {alive hbA && !bombaDesarmada} do {
		sleep 1;
	};

	if(alive hbA && bombaDesarmada && !bombaExplodiu) then {
		sleep 5;

		_wphb = _hbAGroup addWaypoint [getMarkerPos "hbA_move2",0];
		_wphb setWaypointType "MOVE" ;  
		_wphb setWaypointSpeed "LIMITED";
		_wphb setWaypointPosition [getMarkerPos "hbA_move2",0];
	};
};

while {!hbArrependido} do {
	sleep 1;
};

hbA addAction ["Desarmar Bomba", "desarmarBomba.sqf"];
hbA addAction ["Ver tempo restante para explosão", "verTempoRestante.sqf"];

while {alive hbA && !(bombaDesarmada || bombaExplodiu)} do {
	hbA playaction "surrender";
	sleep 1;
};

if(bombaDesarmada) then {
	hbA playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
	hbA enableAI "MOVE";
	titleRsc ["Agradecimento", "plain down"];
};