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

tocarMusicaOnlyU = false;
publicVariable "tocarMusicaOnlyU";

tocarMusicaWhip = false;
publicVariable "tocarMusicaWhip";

// Desabilita artilharia computadorizada para todos
enableEngineArtillery false;

// DETERMINA SE ESTA DEBUGANDO OU NAO
debugar = (ParamDEBUGAR);

TempoInicio = (ParamTempoInicio);

TempoOndas = (ParamTempoOndas);

TempoReforcos = (ParamTempoReforcos);

QtdMaxInimigos = (ParamDificuldade);

ProbEsturro = (ParamProbEsturro);

Horario = (ParamHorario);

Clima = (ParamClima);

_valorChuva = 0;
if (Clima == 0.75) then {_valorChuva = 0.7;};
if (Clima == 1) then {_valorChuva = 1;};

1 setOvercast Clima;
1 setRain _valorChuva;

setDate [2008, 5, 11, Horario, 0];

hmmwv1 addAction ["Espantar Inimigos", "musica.sqf"];
hmmwv1 addAction ["Nao me Aperte", "whiplash.sqf"];

if (isServer) then {
	execVM "attacks.sqf";
	execVM "cronometro.sqf";
};