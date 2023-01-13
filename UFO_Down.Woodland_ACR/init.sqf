execVM "prenderTriggerUfo.sqf";
execVM "EHCivisHostis.sqf";

// SALVA OS PARÂMETROS DO LOBBY COMO VARIÁVEIS GLOBAIS
if (isNil "paramsArray") then
	{
    	if (isClass (missionConfigFile/"Params")) then
		{
        	for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do
			{
			_paramName = configName ((missionConfigFile >> "Params") select _i);
			missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
            		};
	        };
	} else

	{
	for "_i" from 0 to (count paramsArray - 1) do
		{
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
	        };
};

// DETERMINA SE ESTA DEBUGANDO OU NAO
debugar = (ParamDEBUGAR);

// PROCURA O PARAMETRO DO HC
HCPresente = (HEADLESS);

// PROCURA A DIFICULDADE
dificuldade = (ParamDificuldade);
if(dificuldade == 0) then {tempoReparoSegundos = 60; tempoReparoText = "1 MINUTO"; tempoWarpSegundos = 23; tempWarpText = "30 segundos"};
if(dificuldade == 1) then {tempoReparoSegundos = 180; tempoReparoText = "3 MINUTOS"; tempoWarpSegundos = 57; tempWarpText = "1 minuto"};
if(dificuldade == 2) then {tempoReparoSegundos = 300; tempoReparoText = "5 MINUTOS"; tempoWarpSegundos = 113; tempWarpText = "2 minutos"};

// DETERMINA QTD DE DRONES ESTÁTICOS
dronesDisponiveis = (ParamDrones);
publicVariable "dronesDisponiveis";

//define Say3D como comando de efeito global
fn_netSay3D = compile preprocessFileLineNumbers "fn_netSay3D.sqf";

if (isNil "PVEH_netSay3D") then {
PVEH_NetSay3D = [objNull,0];
};

"PVEH_netSay3D" addPublicVariableEventHandler {
     private["_array"];
     _array = _this select 1;
    (_array select 0) say3D (_array select 1);
};

// Variaveis Globais
if(debugar == 1) then {
	componentesEletricos = 4;
	publicVariable "componentesEletricos";
} else {
	componentesEletricos = 0;
	publicVariable "componentesEletricos";
};

// String para avisos globais
avisos = false;
publicVariable "avisos";
avisoMsg = "";
publicVariable "avisoMsg";

// Componentes adquiridos por cada player
componentesLider = 0;
publicVariable "componentesLider";
componentesPiloto = 0;
publicVariable "componentesPiloto";
componentesCoPiloto = 0;
publicVariable "componentesCoPiloto";
componentesAAAT = 0;
publicVariable "componentesAAAT";
componentesAT = 0;
publicVariable "componentesAT";
componentesHeavy1 = 0;
publicVariable "componentesHeavy1";
componentesHeavy2 = 0;
publicVariable "componentesHeavy2";
componentesHeavy3 = 0;
publicVariable "componentesHeavy3";
componentesHeavy4 = 0;
publicVariable "componentesHeavy4";
componentesHeavy5 = 0;
publicVariable "componentesHeavy5";
componentesHeavy6 = 0;
publicVariable "componentesHeavy6";
componentesHeavy7 = 0;
publicVariable "componentesHeavy7";

combustivelNave = 0;
publicVariable "combustivelNave";

// Variavel local para não pegar varias vezes a mesma action
pegouComponente = false;

// Componentes na hora do reparo da nave (30 metros para ser considerado)
componentesEletricosReparo = 0;
publicVariable "componentesEletricosReparo";
msgFinalReparo = "";
publicVariable "msgFinalReparo";

// Demais variaveis globais necessárias
reparoNave = false;
publicVariable "reparoNave";
reparoNaveFinalizado = false;
publicVariable "reparoNaveFinalizado";
dobraEspacialIniciada = false;
publicVariable "dobraEspacialIniciada";
dobraEspacialAtivada = false;
publicVariable "dobraEspacialAtivada";
dobraLigada = false;
publicVariable "dobraLigada";
lancarDrone = false;
publicVariable "lancarDrone";
droneEmLancamento = false;
publicVariable "droneEmLancamento";
triggerNameDrone = "";
publicVariable "triggerNameDrone";
fimJogo = false;
publicVariable "fimJogo";

gerador_1 addAction ["Pegar Componente Elétrico", "pegarComponente.sqf"];
gerador_2 addAction ["Pegar Componente Elétrico", "pegarComponente.sqf"];
satelite_1 addAction ["Pegar Componente Elétrico", "pegarComponente.sqf"];
satelite_2 addAction ["Pegar Componente Elétrico", "pegarComponente.sqf"];
pc addAction ["Pegar Componente Elétrico", "pegarComponente.sqf"];

ufo addAction ["Botão Vermelho (Remover Segurança)", "btnSafeOff.sqf"];
ufo addAction ["Lançar Drone estático", "lancarDrone.sqf"];
actionDestruirDrone = false;
fnc_addActionDestroyDrones = {
	if(!actionDestruirDrone) then {
		ufo addAction ["Destruir Drones", "destruirDrones.sqf"];
		actionDestruirDrone = true;
	};
};

["UFO Down, Bystrica", "08 de Julho de 1988, 00:00", "Criado por WolFros_Fay4"] spawn BIS_fnc_infoText;