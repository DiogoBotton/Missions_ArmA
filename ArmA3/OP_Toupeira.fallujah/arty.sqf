_arrayBombas = ["Bo_GBU12_LGB_MI10", "Bo_GBU12_LGB", "Bo_Mk82", "M_Mo_82mm_AT_LG", "HelicopterExploBig", "HelicopterExploBig"];
_salvos = QtdMorteiros;
_dist = DistMorteiros;
_interSleepMort = InterMorteiros;
_morteiros = Morteiros;

// Adquire todas as unidades blufor presentes dentro do trigger
_groupOriginal = _this select 0;

_anyBluforAlive = 1;

// Executar somente no servidor
if (isServer && _morteiros == 1) then {
	_tempoBasico = _interSleepMort * 30;
	_tempoRandom = floor random (_interSleepMort * 15);
	_tempoTotal = _tempoBasico + _tempoRandom;
	
	if(debugar == 1) then {
		sleep 10;
	} else {
		sleep _tempoTotal;
	};

	while {_anyBluforAlive > 0} do {
		// Atualiza o grupo
		_group = group (leader _groupOriginal);

		for [{_i=0}, {_i <= _salvos}, {_i=_I+1}] do {
    		//gera valor aleatório de 0 a 7
    		_tempo          = floor (random 7);
    		_tempo          = _tempo + 2;
    		_ArrayMortSound = ["mort1","mort2","mort3","mort4"];
    		_ArrayMortSound = _ArrayMortSound call BIS_fnc_selectRandom;

    		_detonarPos = position (leader _group);
			_alvoMort = createVehicle ["HeliHEmpty", _detonarPos,[],_dist, "NONE"];

    		_delaySom = _tempo - 2;
    		sleep _delaySom;

    		nul = [_alvoMort, _ArrayMortSound, 500] call fn_netSay3D;

    		_delayBomba = _tempo - _delaySom;
    		sleep _delayBomba;

			_tipoBomba = _arrayBombas call BIS_fnc_selectRandom;
    		_bomb = _tipoBomba createVehicle (position _alvoMort);
			deleteVehicle _alvoMort;
		};

		_anyBluforAlive = { alive _x } count (units _group);

		_tempoBasico = _interSleepMort * 60;
		_tempoRandom = floor random (_interSleepMort * 30);
		_tempoTotal = _tempoBasico + _tempoRandom;

		//hint format ["Proxima barragem em %1 minutos",_tempoTotal];

		if(debugar == 1) then {
			sleep 10;
		} else {
			sleep _tempoTotal;
		};

		// Atualiza o grupo
		_group = group (leader _groupOriginal);

		// Verifica se está longe o suficiente da cidade para pausar o ataque de morteiros, mas despausa caso voltar a cidade
		_nearCity = true;
		while {_nearCity} do {
			if ((leader _group) distance (getMarkerPos "center_city") > 2400) then {
				if(debugar == 1) then {
					sleep 5;
				} else {
					sleep _tempoTotal;
				};
			} else {
				_nearCity = false;
			};
		};
	};
};
