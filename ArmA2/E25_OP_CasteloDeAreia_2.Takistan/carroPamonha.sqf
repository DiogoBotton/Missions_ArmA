if(isServer) then {
	while {alive carro_pamonha} do {
		nul = [(carro_pamonha), "pamonha"] call fn_netSay3D;
		sleep 60;
	};
};