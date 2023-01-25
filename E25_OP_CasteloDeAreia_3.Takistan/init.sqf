execVM "hideBuildings.sqf";
execVM "briefing.sqf";
execVM "repareAnim.sqf";

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

stopAnim = false;
hbArrependido = false;
bombaDesarmada = false;
bombaExplodiu = false;
timeBomb = 240;
cancelouDesarmamento = false;

if(isServer) then {
    publicVariable "stopAnim";
    publicVariable "hbArrependido";
    publicVariable "bombaDesarmada";
    publicVariable "bombaExplodiu";
    publicVariable "timeBomb";
    publicVariable "cancelouDesarmamento";
};