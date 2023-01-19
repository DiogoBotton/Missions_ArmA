execVM "hideBuildings.sqf";
execVM "briefing.sqf";
execVM "functions.sqf";
execVM "enemyWeapons.sqf";

caixa1 addEventHandler["Killed", { (caixa1) spawn fnc_cacheKilled; }];
caixa2 addEventHandler["Killed", { (caixa2) spawn fnc_cacheKilled; }];
caixa3 addEventHandler["Killed", { (caixa3) spawn fnc_cacheKilled; }];
caixa4 addEventHandler["Killed", { (caixa4) spawn fnc_cacheKilled; }];

caixa1 addAction ["Pegar Caixa", "carryItem.sqf"];
caixa2 addAction ["Pegar Caixa", "carryItem.sqf"];
caixa3 addAction ["Pegar Caixa", "carryItem.sqf"];
caixa4 addAction ["Pegar Caixa", "carryItem.sqf"];

fogo = false;
qtdCaixasDestruidas = 0;
if(isServer) then {
	publicVariable "fogo";
	publicVariable "qtdCaixasDestruidas";
};