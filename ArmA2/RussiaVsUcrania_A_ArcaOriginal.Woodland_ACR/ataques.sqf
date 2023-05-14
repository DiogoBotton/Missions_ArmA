_arrayTempoInicio = [180, 300, 600, 900, 1200, 1800];
_arrayTempoOndas = [180, 300, 480, 600, 780];

fnc_tempo_ondas = {
	_tempoOndas = TempoOndas;

	if(_tempoOndas == -1) then {
		_tempoOndas = _arrayTempoOndas call BIS_fnc_selectRandom;
	};

	_intervalo = _tempoOndas + 120;
	_timeSleep = [_tempoOndas, _intervalo] call BIS_fnc_randomInt;

	sleep _timeSleep;
};

if(debugar == 0) then {
	_tempoInicio = TempoInicio;

	if(_tempoInicio == -1) then {
		_tempoInicio = _arrayTempoInicio call BIS_fnc_selectRandom;
	};
	
	sleep _tempoInicio;
} else {
	sleep 5;
};

civilPrimeiraOnda setDamage 1;

if(debugar == 0) then {
	call fnc_tempo_ondas;
} else {
	sleep 5;
};

civilSegundaOnda setDamage 1;

if(debugar == 0) then {
	call fnc_tempo_ondas;
} else {
	sleep 5;
};

civilTerceiraOnda setDamage 1;

if(debugar == 0) then {
	call fnc_tempo_ondas;
} else {
	sleep 5;
};

civilQuartaOnda setDamage 1;

if(debugar == 0) then {
	call fnc_tempo_ondas;
} else {
	sleep 5;
};

civilQuintaOnda setDamage 1;

if(debugar == 0) then {
	call fnc_tempo_ondas;
} else {
	sleep 5;
};

civilSextaOnda setDamage 1;

if(debugar == 0) then {
	call fnc_tempo_ondas;
} else {
	sleep 5;
};

civilSetimaOnda setDamage 1;