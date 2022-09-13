// Remove combustivel dos carros
nul = [] execvm "removerFuncoesCarro.sqf";

// Desliga as luzes dos carros e impede que seja ligado novamente
sl_refugio_1 call fnc_killLights;
sl_refugio_2 call fnc_killLights;
suv1 call fnc_killLights;
suv2 call fnc_killLights;
suv3 call fnc_killLights;

nukeDetonated = true;

// Desliga todos os postes de luz da cidade em um diâmetro X
desligar = [nukePos,900] execVM "apagarCidades.sqf";

if(isServer)then {
	// Som de choque
	nul = [suv1, "choque"] call fn_netSay3D;
	nul = [suv2, "choque"] call fn_netSay3D;
	nul = [suv3, "choque"] call fn_netSay3D;

	sleep 10;

	// Som de sirene e bomba
	nul = [suv1, "nam"] call fn_netSay3D;
	nul = [suv2, "nam"] call fn_netSay3D;
	nul = [suv3, "nam"] call fn_netSay3D;
};

if(!isServer) then {sleep 18;}
else {sleep 8;};
// Efeito visual nuke
nuke = [nukepos] execvm "nuke\nuke.sqf";

nul = [] execvm "mataSobreviventesRefugio.sqf";