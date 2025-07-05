execVM "hideBuildings.sqf";
execVM "briefing.sqf";

// Salva parametros como global variable
if (isNil "paramsArray") then {
    if (isClass (missionConfigFile/"Params")) then {
        for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
            _paramName = configName ((missionConfigFile >> "Params") select _i);
            missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
            };
        };
} else {
    for "_i" from 0 to (count paramsArray - 1) do {
        missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
    };
};

// Define Say3D como comando de efeito global
fn_netSay3D = compile preprocessFileLineNumbers "fn_netSay3D.sqf";

if (isNil "PVEH_netSay3D") then {
PVEH_NetSay3D = [objNull,0];
};

"PVEH_netSay3D" addPublicVariableEventHandler {
     private["_array"];
     _array = _this select 1;
    (_array select 0) say3D (_array select 1);
};

nivelResistencia = (ParamPercentualResistencia);

// Aleatoriedade
rolarDado = false;
numDado = -1;

// String para avisos globais
avisos = false;
avisoMsg = "";

// Para ações globais
abastecimentoIniciado = false;
abastecimentoConcluido = false;

// Torres de Água
w1Abastecido = false;
w2Abastecido = false;
w3Abastecido = false;
w4Abastecido = false;
w5Abastecido = false;
qualTorre = objNull;
tempoEspera = 300;

finalizarMissao = false;

if(isServer) then {
    publicVariable "rolarDado";
    publicVariable "numDado";
    publicVariable "avisos";
    publicVariable "avisoMsg";
    publicVariable "abastecimentoIniciado";
    publicVariable "abastecimentoConcluido";
    publicVariable "w1Abastecido";
    publicVariable "w1Abastecido";
    publicVariable "w1Abastecido";
    publicVariable "w1Abastecido";
    publicVariable "w1Abastecido";
    publicVariable "qualTorre";
    publicVariable "finalizarMissao";
};

w1 addAction ["Abastecer Torre de Água", "abastecerTorreAguaLocal.sqf"];
w2 addAction ["Abastecer Torre de Água", "abastecerTorreAguaLocal.sqf"];
w3 addAction ["Abastecer Torre de Água", "abastecerTorreAguaLocal.sqf"];
w4 addAction ["Abastecer Torre de Água", "abastecerTorreAguaLocal.sqf"];
w5 addAction ["Abastecer Torre de Água", "abastecerTorreAguaLocal.sqf"];

execVM "carroPamonha.sqf";