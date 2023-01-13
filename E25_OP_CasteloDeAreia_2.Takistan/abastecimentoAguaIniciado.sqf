caminhao_pipa setFuel 0;
caminhao_pipa lockDriver true;

if(isServer) then {
	sleep tempoEspera;

	abastecimentoConcluido = true;
	publicVariable "abastecimentoConcluido";
};