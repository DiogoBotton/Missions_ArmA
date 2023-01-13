if(qualTorre == objNull) exitWith {};

if(isServer) then {
	_aviso = "Abastecimento de água finalizado.";
	nul = [(_aviso)] execVM "hintGlobal.sqf";

	if(qualTorre == w1) then {
		w1Abastecido = true;
		publicVariable "w1Abastecido";
	};
	if(qualTorre == w2) then {
		w2Abastecido = true;
		publicVariable "w2Abastecido";
	};
	if(qualTorre == w3) then {
		w3Abastecido = true;
		publicVariable "w3Abastecido";
	};
	if(qualTorre == w4) then {
		w4Abastecido = true;
		publicVariable "w4Abastecido";
	};
	if(qualTorre == w5) then {
		w5Abastecido = true;
		publicVariable "w5Abastecido";
	};

	abastecimentoIniciado = false;
	publicVariable "abastecimentoIniciado";

	abastecimentoConcluido = false;
	publicVariable "abastecimentoConcluido";
};

sleep 1;
caminhao_pipa setFuel 1;
caminhao_pipa lockDriver false;