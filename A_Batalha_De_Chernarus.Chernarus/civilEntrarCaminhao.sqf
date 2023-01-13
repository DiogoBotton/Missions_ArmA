_civil = _this select 0;
if(_civil distance caminhao_resgate > 20) exitWith {hint "Você precisa chegar mais perto dos civis com o caminhão. (mínimo 20 metros)";};

qualVeiculo = caminhao_resgate;
publicVariable "qualVeiculo";

entrarVeiculo = true;
publicVariable "entrarVeiculo";

if(actionDesembarcar) then {	
	caminhao_resgate addAction ["Desembarcar civis", "desembarcarCivis.sqf"];
	actionDesembarcar = false;
}