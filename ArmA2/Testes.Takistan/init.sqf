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

informante1 addAction ["Conversar", "conversa.sqf"];
informante2 addAction ["Conversar", "conversa.sqf"];
informante3 addAction ["Conversar", "conversa.sqf"];
interprete addAction ["Cinto Bomba", "cintoBomba.sqf"];
CivilPrender addAction ["Algemar", "prender.sqf"];

sequenciaConversa1 = 1;
sequenciaConversa2 = 1;
sequenciaConversa3 = 1;
sequenciaConversa4 = 1;

trigger_som attachTo [caixa_som,[0,0,0]];
triggerCarro_som attachTo [carro_som,[0,0,0]];

if(isServer) then {
	nul = [(carro_som_2), "pamonha"] call fn_netSay3D;
};

extracaoTempo = false;

// comuna3 addAction["Conversar",
//    "conversa.sqf",
//    "player sideChat 'Conversando';",
//    10,
//    false,
//    true,
//    "",
//    "this && comuna1 in thislist"
// ];