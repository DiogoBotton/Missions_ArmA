// Distribuir quantia X de objetos invisiveis (markers) nas posições que deseja bombardear
// Os nomes devem seguir este padrão, target_0, target_1, target_2, target_3, e assim até chegar o número total de targets criados
// Baseado na quantidade de targets criados, alterar variavel _qtdAlvos (subtrair -1, pois a contagem inicia de 0)

_counterBombing = 0;
_salvos = 50;
_qtdAlvos = 79;
//executar somente no servidor

if (isServer) then {
	for [{_i=0}, {_i < _salvos}, {_i=_I+1}] do {
    	_alvoBomba = floor (random _qtdAlvos);
    	//gera valor aleatório de 0 a 7
    	_tempo          = floor (random 7);
    	_tempo          = _tempo + 2;
    	_ArrayMortSound = ["mort1","mort2","mort3","mort4"];
    	_ArrayMortSound = _ArrayMortSound call BIS_fnc_selectRandom;
    	_detonar = ("target_" + str _alvoBomba);

    	_detonarPos = getMarkerPos _detonar;
    	alvomort setPos _detonarPos;
	
    	_delaySom = _tempo - 2;
    	sleep _delaySom;
	
    	nul = [alvomort, _ArrayMortSound] call fn_netSay3D;
	
    	_delayBomba = _tempo - _delaySom;
    	sleep _delayBomba;
	
    	_bomb = "Bo_Mk82" createVehicle (_detonarPos);
	};
};
