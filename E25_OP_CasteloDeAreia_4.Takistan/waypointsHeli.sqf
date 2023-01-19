if(!isServer) exitWith {};

if (alive bh) then{ bh engineOn true; };

bh move getMarkerPos "bh_lz";

while {(alive bh && !unitReady bh)} do 
{
	sleep 1;
};

if (alive bh) then{ bh land "LAND";};

_heliXYZ = getPosATL bh;
_altitudeHeli = _heliXYZ select 2;

// Loop para verificar altitude do helicoptero
while {_altitudeHeli >= 1} do {
	_heliXYZ = getPosATL bh;
	_altitudeHeli = floor (_heliXYZ select 2);
	//hint format ["altitude: %1", _altitudeHeli];
	sleep 1;
};

if (alive bh) then{ bh engineOn true; };

{
	// Verifica se a unidade é Blufor e se não é algum dos pilotos e ordena descer dos helicopteros
	if(side _x == west && _x != p1 && isPlayer _x) then {
		_veh = vehicle _x;
		_x leaveVehicle _veh;
		moveOut _x;
		sleep 0.5;
	};
} forEach allUnits;

sleep 5;

bh move getMarkerPos "bh_land_base";

civilFeruzAbad setDamage 1;

while {(alive bh && !unitReady bh)} do 
{
	sleep 1;
};

if (alive bh) then{ bh land "LAND";};