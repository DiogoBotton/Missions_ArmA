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
    	_alvoBomba = _x;
    	//gera valor aleatório de 0 a 60
    	_tempo          = floor (random 7);
    	_tempo          = _tempo + 2;
    	_ArrayMortSound = ["mort1","mort2","mort3","mort4"];
    	_ArrayMortSound = _ArrayMortSound call BIS_fnc_selectRandom;

		_detonarPos = position _alvoBomba;
		alvomort setPos _detonarPos;

    	_delaySom = _tempo - 2;
    	sleep _delaySom;
	
    	nul = [alvomort, _ArrayMortSound, 500] call fn_netSay3D;
	
    	_delayBomba = _tempo - _delaySom;
    	sleep _delayBomba;

		tipoBomba = _arrayBombas call BIS_fnc_selectRandom;
    	_bomb = tipoBomba createVehicle (_detonarPos);
		[_x, ["hitEngine", 1]] remoteExec ["setHitPointDamage", _x];
		sleep 30;
	} forEach _carsDestroy;
};

execVM "noWayOut.sqf";