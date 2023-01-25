if(isServer) then {
	_positionHBA = position hbA;

	while {timeBomb > 0 && !bombaDesarmada} do {
		timeBomb = timeBomb - 1;
		publicVariable "timeBomb";
		sleep 1;
	};

	if(bombaDesarmada) exitWith {};

	bombaExplodiu = true;
	publicVariable "bombaExplodiu";

	if(bombaExplodiu && !bombaDesarmada) then {
		nul = [(hbA), "ultimasPalavras"] call fn_netSay3D;
		sleep 2;
		_boom = "Bo_Mk82" createVehicle (_positionHBA);
	};
};