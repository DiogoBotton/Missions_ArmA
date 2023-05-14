execVM "briefing.sqf";
execVM "addActionCivilians.sqf";

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

trilhaSonora = false;
publicVariable "trilhaSonora";
ufo_attack = false;
publicVariable "ufo_attack";
ch1Partiu = false;
publicVariable "ch1Partiu";
civisEmbarcadosHeli = false;
publicVariable "civisEmbarcadosHeli";

actionDesembarcar = true;
actionEmbarcaHeli = true;

entrarVeiculo = false;
publicVariable "entrarVeiculo";
sairVeiculo = false;
publicVariable "sairVeiculo";
qualVeiculo = objNull;
publicVariable "qualVeiculo";

sleep 5;

if(isServer) then {
	nul = [lider, "discursoInicial"] call fn_netSay3D;
};