ufo removeAction 0;
if(isServer) then {
	nul = [(hpUfo), "timeBomb"] call fn_netSay3D;
};
sleep 40;

// Efeito visual nuke
nuke = [hpUfo] execvm "nuke.sqf";