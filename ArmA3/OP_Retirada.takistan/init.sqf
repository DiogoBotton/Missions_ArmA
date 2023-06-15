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

locaisVerificados = 0;
publicVariable "locaisVerificados";

localAlvo = "";
publicVariable "localAlvo";

txtRsc = "";
publicVariable "txtRsc";
txtRscActive = false;
publicVariable "txtRscActive";

counter = false;
publicVariable "counter";

// DETERMINA SE ESTA DEBUGANDO OU NAO
debugar = (ParamDEBUGAR);

if (debugar == 1) then {
	sleep 10;
	execVM "attackEffects.sqf";
	sleep 10;
	civil_ataque_musica setDamage 1;
};