ativador = _this select 0;
alvo = _this select 1;


if(debugar == 1) then {hint format ["ativador é %1 e o alvo é %2", ativador, alvo];};


posOrigem = getPos (ativador);
//posAlvo = getPos (missionnamespace getvariable (alvo));
posAlvo = getPos (alvo);


VetorX = (PosAlvo select 0) - (PosOrigem select 0);
VetorX = VetorX * 2;
VetorY = (PosAlvo select 1) - (PosOrigem select 1);
VetorY = VetorY * 2;
arrayVelocidade = [VetorX,VetorY,5];
	
//getPos (missionnamespace getvariable (alvo)) setVelocity arrayVelocidade;
alvo setVelocity arrayVelocidade;
if(isServer)then {
	dano = damage alvo;
	alvo setdamage (dano + 0.1);
};

somBatida = ["batida1", "batida2", "batida3"];
somBatida = somBatida call BIS_fnc_selectRandom;

if(isServer)then {
	nul = [(alvo), (somBatida)] call fn_netSay3D;
};