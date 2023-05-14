// Crie um marker no local desejado para spawnar o helicóptero e outro para a região que deverá pousar quando finalizar a extração
//
// Para spawnar um helicóptero de extração, no chamamento do script coloque como o exemplo abaixo:
//
// exemplo: nul = ["spawn_heli", "heli_land"] execVM "extracao.sqf";
//
// O exemplo spawnará 1 helicóptero na posição "spawn_heli", irá até a posição do líder blufor (que será obrigatóriamente um player), irá pousar e esperar 1 minuto
// Ao passar o tempo, irá se mover para a posição "heli_land"
//
// Observações:
//
// * IMPORTANTE: Esse script deve rodar no lado do servidor! Mate um civil ou use Radio Alpha para isso.
// * Caso o piloto não encontre um local adequado para pousar na última posição do líder blufor, irá procurar outro local adequado por perto.
// * Para facilitar a IA do ArmA 2, é recomendado que esteja em locais planos e com poucas arvores/pedras antes de acionar o script.
// * Caso o script seja acionado com o líder blufor ainda em uma cidade grande, a IA do helicóptero pode pousar em um lugar muito longe ou em cima de um prédio e 
//   se explodir/danificar, ou simplesmente não fazer nada, e a extração nunca ocorrerá.

_markerNameSpawn = _this select 0;
_markerNameLand = _this select 1;

if(isServer) then {
	_heliGroup = CreateGroup west;

	// Spawnar heli
	_heli = createVehicle ["UH60M_EP1", getmarkerPos _markerNameSpawn,[],0,"FLY"];

	// Função que cria tripulação e move-as para o veículo
	[_heli, _heliGroup] call BIS_fnc_SpawnCrew;

	//_heliGroup createUnit ["US_Soldier_Pilot_EP1", [(getMarkerPos _markerNameSpawn select 0),(getMarkerPos _markerNameSpawn select 1),0], [], 100, "CANCOLLIDE"];
	//_heliGroup createUnit ["US_Soldier_Pilot_EP1", [(getMarkerPos _markerNameSpawn select 0),(getMarkerPos _markerNameSpawn select 1),0], [], 100, "CANCOLLIDE"];

	// Alterar IA para não sentir medo
	//_ContagemDaEquipe = 1;
	{
		_x disableAI "FSM"; 
		_x setBehaviour "CARELESS";
		_x allowFleeing 0;
		_x setSkill ["courage", 1];

		//if (_ContagemDaEquipe == 1) then {_x moveInDriver _heli;};
		//if (_ContagemDaEquipe == 2) then {_x moveInGunner _heli;};
		//_ContagemDaEquipe = _ContagemDaEquipe + 1;
	} forEach units group (leader _heliGroup);

	// Define o local de pouso baseado na posição do líder blufor (player)
	{
		if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
			{
				landTarget = _x;
			};
	} forEach allUnits;

	if (alive _heli) then{ _heli engineOn true; };
	
	_heli move getPosATL landTarget;

	while { (alive _heli && !unitReady _heli)} do 
	{
		sleep 1;
	};

	if (alive _heli) then{ _heli land "LAND";};

	_heliXYZ = getPosATL _heli;
	_altitudeHeli = _heliXYZ select 2;

	// Loop para verificar altitude do helicoptero
	while {_altitudeHeli >= 1} do {
		_heliXYZ = getPosATL _heli;
		_altitudeHeli = floor (_heliXYZ select 2);
		//hint format ["altitude: %1", _altitudeHeli];
		sleep 1;
	};

	extracaoTempo = true;
	publicVariable "extracaoTempo";

	sleep 60;

	_heli move getmarkerPos _markerNameLand;

	while { (alive _heli && !unitReady _heli)} do 
	{
		sleep 1;
	};

	if (alive _heli) then{ _heli land "LAND";};
};