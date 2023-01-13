_object = _this select 0;
_caller = _this select 1;

if(_caller == lider) then {componentesLider = componentesLider +1; publicVariable "componentesLider";};
if(_caller == piloto) then {componentesPiloto = componentesPiloto +1; publicVariable "componentesPiloto";};
if(_caller == copiloto) then {componentesCoPiloto = componentesCoPiloto +1; publicVariable "componentesCoPiloto";};
if(_caller == aaat) then {componentesAAAT = componentesAAAT +1; publicVariable "componentesAAAT";};
if(_caller == at) then {componentesAT = componentesAT +1; publicVariable "componentesAT";};
if(_caller == heavy_1) then {componentesHeavy1 = componentesHeavy1 +1; publicVariable "componentesHeavy1";};
if(_caller == heavy_2) then {componentesHeavy2 = componentesHeavy2 +1; publicVariable "componentesHeavy2";};
if(_caller == heavy_3) then {componentesHeavy3 = componentesHeavy3 +1; publicVariable "componentesHeavy3";};
if(_caller == heavy_4) then {componentesHeavy4 = componentesHeavy4 +1; publicVariable "componentesHeavy4";};
if(_caller == heavy_5) then {componentesHeavy5 = componentesHeavy5 +1; publicVariable "componentesHeavy5";};
if(_caller == heavy_6) then {componentesHeavy6 = componentesHeavy6 +1; publicVariable "componentesHeavy6";};
if(_caller == heavy_7) then {componentesHeavy7 = componentesHeavy7 +1; publicVariable "componentesHeavy7";};

componentesEletricos = componentesEletricos +1;
publicVariable "componentesEletricos";

_aviso = str componentesEletricos + " componentes elétricos encontrados.";
nul = [(_aviso)] execVM "hintGlobal.sqf";

if(!pegouComponente) then {
	ufo addAction ["Reparar Nave", "repararNave.sqf"]; 
	pegouComponente = true;
};

deleteVehicle _object;