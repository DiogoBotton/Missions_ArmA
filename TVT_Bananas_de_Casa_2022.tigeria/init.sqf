//Adiciona briefing
execVM "briefing.sqf";

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


A1 addAction ["GRITO MST","GRITAR.sqf"];
A2 addAction ["GRITO MST","GRITAR.sqf"];
A3 addAction ["GRITO MST","GRITAR.sqf"];
A4 addAction ["GRITO MST","GRITAR.sqf"];
A5 addAction ["GRITO MST","GRITAR.sqf"];
A6 addAction ["GRITO MST","GRITAR.sqf"];
A7 addAction ["GRITO MST","GRITAR.sqf"];
A8 addAction ["GRITO MST","GRITAR.sqf"];
A9 addAction ["GRITO MST","GRITAR.sqf"];
A10 addAction ["GRITO MST","GRITAR.sqf"];
A11 addAction ["GRITO MST","GRITAR.sqf"];
A12 addAction ["GRITO MST","GRITAR.sqf"];
A13 addAction ["GRITO MST","GRITAR.sqf"];
A14 addAction ["GRITO MST","GRITAR.sqf"];
A15 addAction ["GRITO MST","GRITAR.sqf"];
A16 addAction ["GRITO MST","GRITAR.sqf"];
A17 addAction ["GRITO MST","GRITAR.sqf"];