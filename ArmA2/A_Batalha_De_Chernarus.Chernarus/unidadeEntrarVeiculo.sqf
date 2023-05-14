if(qualVeiculo == objNull) exitWith {};

{
	// Verifica se é civil
	if(side _x == civilian && _x != civilPrimeiraOnda && _x != civilNuke) then {
		//_x enableAI "MOVE";
		_x moveInCargo qualVeiculo;
		//_x assignAsCargo caminhao_resgate;
		//[_x] orderGetIn true;
		sleep 0.5;
	};	
} forEach allUnits;

sleep 1;

entrarVeiculo = false;
publicVariable "entrarVeiculo";
qualVeiculo = objNull;
publicVariable "qualVeiculo";

if(!ch1Partiu && civisEmbarcadosHeli) then {
	hint "1 MINUTO PARA PARTIDA!";
	sleep 60;

	if(isServer) then {
		if (alive ch1) then{ ch1 engineOn true; };

		ch1 move getPosATL landHeliBase1;

		ch1Partiu = true;
		publicVariable "ch1Partiu";

		while { (alive ch1 && !unitReady ch1)} do 
		{
			sleep 1;
		};

		if (alive ch1) then{ ch1 land "LAND";};
	};
};

execVM "ufoAttack.sqf";