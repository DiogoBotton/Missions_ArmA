_quem = _this select 1;

rojoes = rojoes -1;
publicVariable "rojoes";

_quem addAction ["Acender Rojão", "rojao.sqf"];

foguetes removeAction 0;