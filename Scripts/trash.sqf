if(isServer) then {
	unitsLixo = list lixoTrigger;

	lixeira = false;
	publicVariable "lixeira";

	for [{i=0}, {i < 3}, {i=i+1}] do {
		{
			if (side _x == west && !isPlayer _x && _x != hmmw_1 && _x != hmmw_2 && _x != hmmw_3 && _x != ch_1 && _x != ch_2 && _x != p_1 && _x != p_2) then {
				deleteVehicle _x;
			};
		} foreach unitsLixo;

		sleep 1;
	};
};