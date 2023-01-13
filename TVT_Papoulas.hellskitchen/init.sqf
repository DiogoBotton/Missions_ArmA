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

foguetes addAction ["Pegar Rojão", "pegarRojao.sqf"];
alto_falante addAction ["Tocar Pancadão", "msc.sqf"];

rojoes = 2;
tocouMsc = false;
publicVariable "rojoes";
publicVariable "tocouMsc";