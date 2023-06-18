_anyPlayersAround = true;
_distanceMinToStartAttack = 1000;

if (isServer) then {
	// Função que verifica se há algum player por perto do local de ataque e espera até que fique distante
	fnc_verifyPlayerAround = {
		_anyPlayersAround = false;
		_localAttack = _this select 0;
		{
			if (side _x == west && alive _x && isPlayer _x && _x distance _localAttack < _distanceMinToStartAttack) then
			{
				_anyPlayersAround = true;
				break;
			};
		} forEach allUnits;
		_anyPlayersAround;
	};

	if(debugar == 1) then {
		sleep 5;
	} else {
		sleep TempoIniciarAtaque; // Variavel adquirida dos paramêtros
	};
	
	_localJilavur =  getMarkerPos "attackMarker_jilavur";
	_localFeruzabad =  getMarkerPos "attackMarker_feruzabad";

	// Retorna o atual líder de blufor
	{
		if (side _x == west && alive _x && isPlayer _x && (leader group _x == leader _x)) then
			{
				liderBlufor = _x;
			};
	} forEach allUnits;

	_distanciaJilavur = liderBlufor distance _localJilavur;
	_distanciaFeruzabad = liderBlufor distance _localFeruzabad;

	// Define o ataque baseado no local mais distante
	if(_distanciaJilavur > _distanciaFeruzabad) then {
		while {_anyPlayersAround} do {
			[_localJilavur] call fnc_verifyPlayerAround;
			sleep 5;
		};
		soundHelp = "help_jilavur";

		// Lança texto na tela
		txtRsc = "Help_Jilavur";
		publicVariable "txtRsc";
		txtRscActive = true;
		publicVariable "txtRscActive";
		
		localAlvo = "jilavur";
		publicVariable "localAlvo";


		unitsInTrigger = list trigger_jilavur_kill;
		car_jilavur_1 setDamage 1;
		car_jilavur_2 setDamage 1;
		car_jilavur_3 setDamage 1;
	} else {
		while {_anyPlayersAround} do {
			[_localFeruzabad] call fnc_verifyPlayerAround;
			sleep 5;
		};

		soundHelp = "help_feruzabad";

		// Lança texto na tela
		txtRsc = "Help_Feruzabad";
		publicVariable "txtRsc";
		txtRscActive = true;
		publicVariable "txtRscActive";

		localAlvo = "feruzabad";
		publicVariable "localAlvo";


		unitsInTrigger = list trigger_feruzabad_kill;
		car_feruzabad_1 setDamage 1;
		car_feruzabad_2 setDamage 1;
	};

	// Emite som pedido de socorro
	nul = [hmmw_1, soundHelp, 300] call fn_netSay3D;
	nul = [hmmw_2, soundHelp, 250] call fn_netSay3D;
	nul = [hmmw_3, soundHelp, 250] call fn_netSay3D;

	for [{i=0}, {i < 3}, {i=i+1}] do {
		{
			if (side _x == west && alive _x && !isPlayer _x) then {
				_x setDamage 1;
			};
		} foreach unitsInTrigger;
		sleep 10;
	};

	if(debugar == 1) then {
		sleep 15;
	} else {
		sleep 60;
	};

	// Lança texto na tela
	if (localAlvo == "jilavur") then {
		txtRsc = "new_order_jilavur";
	} else {
		txtRsc = "new_order_feruzabad";
	};

	_soundName = txtRsc + "_sound";

	// Emite som novas ordens
	nul = [hmmw_1, _soundName, 300] call fn_netSay3D;
	nul = [hmmw_2, _soundName, 250] call fn_netSay3D;
	nul = [hmmw_3, _soundName, 250] call fn_netSay3D;

	publicVariable "txtRsc";
	txtRscActive = true;
	publicVariable "txtRscActive";
};