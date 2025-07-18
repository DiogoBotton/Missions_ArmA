execVM "hideBuildings.sqf";
execVM "briefing.sqf";
execVM "enemyWeapons.sqf";
execVM "posicaoAziz.sqf";

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

big_tank setDamage 1;

coronel_aziz addAction ["Algemar", "prender.sqf"];
bh addAction ["Partir", "heliPartir.sqf"];

// Anim Global
renderUnidade = false;

partirHeli = false;

if(isServer) then {
    publicVariable "renderUnidade";
    publicVariable "partirHeli";
};