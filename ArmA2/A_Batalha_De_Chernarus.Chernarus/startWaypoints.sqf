if(!isServer) exitWith {};

if (alive ch1) then{ ch1 engineOn true; };
if (alive ch2) then{ ch2 engineOn true; };
if (alive ch3) then{ ch3 engineOn true; };
if (alive ch4) then{ ch4 engineOn true; };
if (alive ch5) then{ ch5 engineOn true; };

ch1 move getPosATL landHeli1;
ch2 move getPosATL landHeli2;
ch3 move getPosATL landHeli3;
ch4 move getPosATL landHeli4;
ch5 move getPosATL landHeli5;

while { (alive ch1 && !unitReady ch1) || (alive ch2 && !unitReady ch2) || (alive ch3 && !unitReady ch3) || (alive ch4 && !unitReady ch4) || (alive ch5 && !unitReady ch5)} do 
{
	sleep 1;
};

if (alive ch1) then{ ch1 land "LAND";};
if (alive ch2) then{ ch2 land "LAND";};
if (alive ch3) then{ ch3 land "LAND";};
if (alive ch4) then{ ch4 land "LAND";};
if (alive ch5) then{ ch5 land "LAND";};

sleep 5;
ch3 setDamage 1;
sleep 3;
ch4 setDamage 1;
sleep 7;
ch5 setDamage 1;

_ch1XYZ = getPosATL ch1;
_altitudeCH1 = _ch1XYZ select 2;
_ch2XYZ = getPosATL ch2;
_altitudeCH2 = _ch2XYZ select 2;

while {_altitudeCH1 > 0 || _altitudeCH2 > 0} do {
	_ch1XYZ = getPosATL ch1;
	_altitudeCH1 = _ch1XYZ select 2;
	_ch2XYZ = getPosATL ch2;
	_altitudeCH2 = _ch2XYZ select 2;
	sleep 1;
};

sleep 10;

{
	// Verifica se a unidade é Blufor e se não é algum dos pilotos e ordena descer dos helicopteros
	if(side _x == west && _x != p1 && _x != p2 && _x != player) then {
		_veh = vehicle _x;
		_x leaveVehicle _veh;
		moveOut _x;
		sleep 0.5;
	};
} forEach allUnits;

sleep 5;

{
	// Verifica se a unidade é Blufor e se é líder atual do grupo, ordena se mover para posição
	if(side _x == west && (leader group _x == leader _x) && _x != p1 && _x != p2) then {
		_grp = group _x;
		_wp = _grp addWaypoint [getMarkerPos "move_marker", 1];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		[_grp, 1] setWaypointPosition [getMarkerPos "move_marker", 0];
	};	
} forEach allUnits;

// Spawna unidades aliens
sleep 5;
civilPrimeiraOnda setDamage 1;

if (alive ch2) then{ ch2 engineOn true; };

ch2 move getPosATL landHeliBase2;

while { (alive ch2 && !unitReady ch2)} do 
{
	sleep 1;
};

if (alive ch2) then{ ch2 land "LAND";};