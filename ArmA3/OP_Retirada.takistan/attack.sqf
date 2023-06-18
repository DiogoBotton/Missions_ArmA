_countThis = count _this;

_localName = _this select 0;
_qtdGroups = if (!isNil "qtdGruposAtaque") then [{qtdGruposAtaque},{_this select 1}];
_qtdCars = if (!isNil "qtdCarrosAtaque") then [{qtdCarrosAtaque},{_this select 2}];
_ondas = if (!isNil "qtdOndasAtaque") then [{qtdOndasAtaque},{_this select 3}];
_tempoOndasSegundos = if (!isNil "IntervaloOndasAtaque") then [{IntervaloOndasAtaque},{_this select 4}];
_probEsturro = if (_countThis >= 6) then [{_this select 5},{100}]; // Valor padrão 100% de probabilidade de esturro (OPCIONAL)
_probEsturro = if (!isNil "ProbEsturroAtaque") then [{ProbEsturroAtaque},{_probEsturro}];

_spawnMarkerLocalInfantry = "spawnMarker_infantry_" + _localName + "_";
_qtdMarkersInfantry = 2; // Quantidade de markers de spawn de infantaria
_spawnMarkerLocalCar = "spawnMarker_car_" + _localName + "_";
_qtdMarkersCar = 2; // Quantidade de markers de spawn de carros
_attackMarker = "attackMarker_" + _localName;

// Todas as unidades deste array serão spawnados para infantaria
_arrayInimigos = ["CUP_O_TK_INS_Soldier_TL", "CUP_O_TK_INS_Sniper", "CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_AT", "CUP_O_TK_INS_Soldier_GL", "CUP_O_TK_INS_Bomber", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_MG", "CUP_O_TK_INS_Soldier_AR", "CUP_O_TK_INS_Guerilla_Medic"];
// Os carros e unidades deste array serão sorteados
_arrayCars = ["CUP_O_Hilux_DSHKM_TK_INS", "CUP_O_Hilux_DSHKM_TK_INS", "CUP_O_Hilux_DSHKM_TK_INS", "CUP_O_Hilux_armored_DSHKM_TK_INS"];
_qtdUnitsPerCar = 2;

if (isServer) then {
	// Gera x ondas das Fire Team's e carros
	for [{z=0}, {z < _ondas}, {z=z+1}] do {
		
		// Spawna grupos de unidades caso variável _qtdGroups for maior que zero
		for [{i=0}, {i < _qtdGroups}, {i=i+1}] do {

			// Sorteia local de spawn da infantaria
			_numMarkerInfantry = [1, _qtdMarkersInfantry] call BIS_fnc_randomInt;
			_spawnMarkerInfantry = _spawnMarkerLocalInfantry + str _numMarkerInfantry;

			_grupoAtaque = createGroup EAST;
			{
				_TipoDeUnidade = _x;
				_grupoAtaque createUnit [_TipoDeUnidade, [(getMarkerPos _spawnMarkerInfantry select 0),(getMarkerPos _spawnMarkerInfantry select 1),0], [], 50, "CAN_COLLIDE"];

			} forEach _arrayInimigos;

			{
				_x setskill ["courage",1];
				_x setskill ["commanding",1];
				_x setskill ["spotDistance",1];
				_x setskill ["spotTime",1];
				_x setskill ["reloadSpeed",1];
			} forEach Units _grupoAtaque;

			// Define local de ataque e cria waypoint para o grupo
			_wp = _grupoAtaque addWaypoint [getMarkerPos _attackMarker,0];
    		_wp setWaypointType "MOVE";
    		_wp setWaypointCombatMode "RED";
    		_wp setWaypointBehaviour "AWARE";
    		_wp setWaypointSpeed "FULL";
    		_wp setWaypointPosition [getMarkerPos _attackMarker,0];
		};

		randomNumber = [0, 100] call BIS_fnc_randomInt;
		_50CalProb = 100 - _probEsturro;
		if (randomNumber > _50CalProb) then {

			// Spawna carros caso variavel _qtdCars for maior que zero
			for [{i=0}, {i < _qtdCars}, {i=i+1}] do {

				// Sorteia local de spawn do carro
				_numMarkerCar = [1, _qtdMarkersCar] call BIS_fnc_randomInt;
				_spawnMarkerCar = _spawnMarkerLocalCar + str _numMarkerCar;

				_grupoAtaqueCar = createGroup EAST;

				_TipoVeiculo = _arrayCars call BIS_fnc_selectRandom;
				_veiculoAtaque = createVehicle [_TipoVeiculo, getmarkerPos _spawnMarkerCar,[],50,"CAN_COLLIDE"];

				for [{i=0}, {i < _qtdUnitsPerCar}, {i=i+1}] do {
					_TipoDeUnidade = _arrayInimigos call BIS_fnc_selectRandom;
					_grupoAtaqueCar createUnit [_TipoDeUnidade, [(getMarkerPos _spawnMarkerCar select 0),(getMarkerPos _spawnMarkerCar select 1),0], [], 50, "CAN_COLLIDE"];
				};

				_ContagemDaEquipe = 1;
				{
					if (_ContagemDaEquipe == 1) then {_x moveInGunner _veiculoAtaque;};
					if (_ContagemDaEquipe == 2) then {_x moveInDriver _veiculoAtaque;};
					if (_ContagemDaEquipe >= 2) then {_x moveInCargo _veiculoAtaque;};
					_ContagemDaEquipe = _ContagemDaEquipe +1;
				} forEach units group (leader _grupoAtaqueCar);

				// Define local de ataque e cria waypoint para o grupo
				_wp1 = _grupoAtaqueCar addWaypoint [getMarkerPos _attackMarker,0];
    			_wp1 setWaypointType "MOVE";
    			_wp1 setWaypointCombatMode "RED";
    			_wp1 setWaypointBehaviour "AWARE";
    			_wp1 setWaypointSpeed "LIMITED";
    			_wp1 setWaypointPosition [getMarkerPos _attackMarker,0];
			};
		};

		sleep _tempoOndasSegundos;
	};
};