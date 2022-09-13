if(reparoNaveFinalizado) exitWith{hint "Não é possível reparar a nave novamente, energia insuficiente.";};
if(reparoNave) exitWith{hint "A nave já esta sendo reparada.";};

_actionId = _this select 2;
ufo removeAction _actionId;

_unidades = list TriggerReparoUfo;
_qtdUnidades = count _unidades;

{
	if(_x == lider) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesLider;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == piloto) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesPiloto;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == aaat) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesAAAT;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == at) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesAT;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == heavy_1) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesHeavy1;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == heavy_2) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesHeavy2;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == heavy_3) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesHeavy3;
		publicVariable "componentesEletricosReparo";
	};
	if(_x == heavy_4) then {
		componentesEletricosReparo = componentesEletricosReparo + componentesHeavy4;
		publicVariable "componentesEletricosReparo";
	};
} forEach _unidades;

reparoNave = true;
publicVariable "reparoNave";

// Mata civil gatilho caso ainda estiver vivo (em casos de consertarem a nave antes de atingir 4 componentes)
if(alive civilAlertarAutoridades) then{civilAlertarAutoridades setDamage 1;};

if(debugar == 1) then {
	sleep 10;
} else {
	sleep tempoReparoSegundos;
};

if(componentesEletricosReparo > 4) then {
	ufo setDamage 0.10;
	combustivelNave = 0.80;
	publicVariable "combustivelNave";
	//ufo setVehicleAmmo 0.01; // Adiciona apenas 5 munições para o Sound Cannon do UFO (Não funciona)
	msgFinalReparo = "Reparo da nave finalizado. Nave reparada em 90%.";
};
if(componentesEletricosReparo == 4) then {
	ufo setDamage 0.20;
	combustivelNave = 0.80;
	publicVariable "combustivelNave";
	msgFinalReparo = "Reparo da nave finalizado. Nave reparada em 80%.";
};
if(componentesEletricosReparo == 3) then {
	ufo setDamage 0.30;
	combustivelNave = 0.70;
	publicVariable "combustivelNave";
	msgFinalReparo = "Reparo da nave finalizado. Nave reparada em 70%.";
};
if(componentesEletricosReparo == 2) then {
	ufo setDamage 0.50;
	combustivelNave = 0.50;
	publicVariable "combustivelNave";
	msgFinalReparo = "Reparo da nave finalizado. Nave reparada em 50%.";
};
if(componentesEletricosReparo == 1) then {
	ufo setDamage 0.75;
	combustivelNave = 0.25;
	publicVariable "combustivelNave";
	msgFinalReparo = "Reparo da nave finalizado. Nave reparada em 25%.";
};
publicVariable "msgFinalReparo";

reparoNaveFinalizado = true;
publicVariable "reparoNaveFinalizado";