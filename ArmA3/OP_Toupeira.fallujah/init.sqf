execVM "briefing.sqf";

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

//define Say3D como comando de efeito global
fn_netSay3D = compile preprocessFileLineNumbers "fn_netSay3D.sqf";

if (isNil "PVEH_netSay3D") then {
PVEH_NetSay3D = [objNull,0,1];
};

"PVEH_netSay3D" addPublicVariableEventHandler {
     private["_array"];
     _array = _this select 1;
    (_array select 0) say3D [(_array select 1), (_array select 2), 1];
};

// ADQUIRE PARAMETROS Description.ext
debugar = (ParamDEBUGAR);
horario = (ParamHorario);
clima = (ParamClima);
IntervaloAtaques = (ParamIntervaloAtaques);
Esturro = (ParamEsturro);
Morteiros = (ParamMorteiros);
DistMorteiros = (ParamDistMorteiros);
InterMorteiros = (ParamInterMorteiros);
QtdMorteiros = (ParamQtdMorteiros);

_valorClima = clima;
_valorChuva = 0;

sleep 2;

//hint format ["valor clima: %1 \nvalor chuva: %2",_valorClima, _valorChuva];

// Configura clima e horario baseado nos paramêtros
if (_valorClima == 0.75) then {_valorChuva = 0.7;};
if (_valorClima == 1) then {_valorChuva = 1;};
skipTime -24;
1 setOvercast _valorClima;
1 setRain _valorChuva;
skipTime 24;

if (horario == 12) then {setDate [2008, 5, 11, 12, 0];};
if (horario == 16) then {setDate [2008, 5, 11, 16, 0];};
if (horario == 18) then {setDate [2008, 5, 11, 18, 0];};
if (horario == 20) then {setDate [2008, 5, 11, 20, 0];};
if (horario == 0) then {setDate [2008, 5, 11, 0, 0];};
if (horario == 4) then {setDate [2008, 5, 11, 4, 0];};
if (horario == 8) then {setDate [2008, 5, 11, 8, 0];};
if (horario == 25) then 
{
    _HoraRandom   = floor random 23;
    _MinuteRandom = floor random 59;
    setDate [2008, 5, 11, _HoraRandom, _MinuteRandom];
};			
horarioINICIO = daytime;

m113a addAction ["Mandar para Extracao", "LOUD1.sqf", m113a];
m113a addAction ["Venham para o Veiculo", "LOUD2.sqf", m113a];

m113b addAction ["Mandar para Extracao", "LOUD1.sqf", m113b];
m113b addAction ["Venham para o Veiculo", "LOUD2.sqf", m113b];

m113c addAction ["Mandar para Extracao", "LOUD1.sqf", m113c];
m113c addAction ["Venham para o Veiculo", "LOUD2.sqf", m113c];

m113d addAction ["Mandar para Extracao", "LOUD1.sqf", m113d];
m113d addAction ["Venham para o Veiculo", "LOUD2.sqf", m113d];

sleep 5;
// Script de acionamento dos ataques para cada esquadrão
execVM "groups.sqf";