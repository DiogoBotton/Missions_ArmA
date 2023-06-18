_arrayBombas = ["M_Mo_82mm_AT_LG", "M_Mo_82mm_AT_LG", "M_Mo_82mm_AT_LG", "Bo_GBU12_LGB"];
_carsDestroy = [hmmw_1, hmmw_2, hmmw_3];

if (isServer) then {
	if(localAlvo == "jilavur") then {
		localSpeaker = speaker_jilavur;
		localCivil = civil_ataque_jilavur;
	} else {
		localSpeaker = speaker_feruzabad;
		localCivil = civil_ataque_feruzabad;
	};
	
	nul = [localSpeaker, "one", 400] call fn_netSay3D;
	
	if(debugar == 1) then {
		sleep 5;
	} else {
		sleep 200; // Minuto 3:20 one
	};

	// Inicia ataque
	localCivil setDamage 1;

	if(debugar == 1) then {
		sleep 30;
	} else {
		sleep 60;
	};

	// Destroi hmmw's
	{
		[_x, ["hitEngine", 1]] remoteExec ["setHitPointDamage", _x];
		sleep 15;
	} forEach _carsDestroy;
};

execVM "noWayOut.sqf";