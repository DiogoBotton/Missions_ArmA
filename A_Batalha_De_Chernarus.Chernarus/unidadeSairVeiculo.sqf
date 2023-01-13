{
	// Verifica se é civil e manda todos desembarcarem
	if(side _x == civilian && _x != civilPrimeiraOnda && _x != civilNuke) then {
		_x leaveVehicle (nearestObject [_x, "Landvehicle"]);
		moveOut _x;
		sleep 0.5;
	};	
} forEach allUnits;

// Caminhao esta à uma distancia de 40 ou menos do helicoptero? Adiciona ação para civis embarcarem no heli
if(caminhao_resgate distance ch1 <= 40 && actionEmbarcaHeli) then {
	{
		if(side _x == civilian) then {
			_x addAction ["Embarcar civis no helicóptero", "civilEntrarHeli.sqf"];
		};	
	} forEach allUnits;
	caminhao_resgate addAction ["Embarcar civis no helicóptero", "civilEntrarHeli.sqf"];
	actionEmbarcaHeli = false;
};

sleep 1;

sairVeiculo = false;
publicVariable "sairVeiculo";