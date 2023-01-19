// Verifica se alguém está dentro do caminhão e expulsa-o
if(!isServer) then {
	while {abastecimentoIniciado} do {
		if({alive _x} count crew caminhao_pipa > 0 && vehicle player == caminhao_pipa) then {
			player globalChat "Você não pode dirigir o caminhão pipa enquanto ele abastece uma torre de água.";
			player action ["eject", vehicle player];
			sleep 1;
		};

		sleep 1;
	};
};