if(isServer)then {
	// Som de sirene e bomba
	nul = [nukepos, "nuke"] call fn_netSay3D;
	nul = [nukepos2, "nuke"] call fn_netSay3D;
	nul = [nukepos3, "nuke"] call fn_netSay3D;
};

sleep 8;
// Efeito visual nuke
nuke = [nukepos] execvm "nuke.sqf";
nuke = [nukepos2] execvm "nuke.sqf";
nuke = [nukepos3] execvm "nuke.sqf";