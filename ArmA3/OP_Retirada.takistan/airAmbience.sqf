// Script de ambientação aérea
// Esse script fara uma rota de ida e volta para a aeronave (helicopteros)

_aeronave = _this select 0;
_spawnLocal = _this select 1;
_moveLocal = _this select 2;
_timeInit = _this select 3;
_distLanding = 70;
_timeWait = 300;

if(!isServer) exitWith {};
_pilot = fullCrew [_aeronave, "driver"];
_pilot = (_pilot select 0) select 0;

while {alive _aeronave && alive _pilot} do {
	sleep _timeInit;

	if(!alive _aeronave || !alive _pilot) exitWith{};

	if (alive _aeronave && alive _pilot) then{ _aeronave engineOn true; };

	// Define local aproximado do local de pouso
	_newMove = createVehicle ["HeliHEmpty", (getMarkerPos _moveLocal),[],(_distLanding), "NONE"];

	_aeronave move (position _newMove);
	//hint "Aeronave partindo";

	deleteVehicle _newMove;

	while { (alive _aeronave && alive _pilot && !unitReady _aeronave)} do 
	{
		sleep 1;
	};

	if(!alive _aeronave || !alive _pilot) exitWith{};

	if (alive _aeronave && alive _pilot) then{ _aeronave land "LAND";};

	_aeronaveXYZ = getPosATL _aeronave;
	_altitudeAeronave = _aeronaveXYZ select 2;

	while {floor _altitudeAeronave >= 1} do {
		_aeronaveXYZ = getPosATL _aeronave;
		_altitudeAeronave = _aeronaveXYZ select 2;
		//hint format ["altitude: %1", _altitudeAeronave];
		sleep 1;
	};

	if(debugar == 1) then {
		sleep 30;
	} else {
		sleep _timeWait;
	};

	if(!alive _aeronave || !alive _pilot) exitWith{};

	if (alive _aeronave && alive _pilot) then{ _aeronave engineOn true; };
	
	// Define local aproximado do local de pouso
	_newReturn = createVehicle ["HeliHEmpty", (getMarkerPos _spawnLocal),[],(_distLanding), "NONE"];

	_aeronave move (position _newReturn);

	//hint "Aeronave retornando";

	deleteVehicle _newReturn;

	while { (alive _aeronave && alive _pilot && !unitReady _aeronave)} do 
	{
		sleep 1;
	};

	if(!alive _aeronave || !alive _pilot) exitWith{};

	if (alive _aeronave && alive _pilot) then{ _aeronave land "LAND";};
};