_numOpfor = 1;
_arrayOpfor = [];
_numMaxScreamsForLoop = 3;
_gritos = ["grito1", "grito2", "grito3", "grito4", "grito5", "grito6"];
_intervaloGritos = [5, 10];

// Verifica se a quantidade de opfor é maior que zero, caso for, escolhe uma qtd aleatória de opfors para gritar em intervalos aleatórios
if(isServer) then {
	while {_numOpfor > 0} do {
		{
		if (side _x == east) then
			{
				_num = 0;
				_num = _num + 1;
				_numOpfor = _num;
				_arrayOpfor = _arrayOpfor + [_x];
			};
		} forEach allUnits;

		_numGritantes = [1, _numMaxScreamsForLoop] call BIS_fnc_randomInt;

		for [{_i=1}, {_i <= _numGritantes}, {_i=_i+1}] do {
			_opforGritante = _arrayOpfor call BIS_fnc_selectRandom;
			_opforSomGrito = _gritos call BIS_fnc_selectRandom;

			nul = [(_opforGritante), (_opforSomGrito)] call fn_netSay3D;

			_intervaloGritinhos = [2, 8] call BIS_fnc_randomInt;
			sleep _intervaloGritinhos;
		};

		_intervalo = [_intervaloGritos select 0, _intervaloGritos select 1] call BIS_fnc_randomInt;

		sleep _intervalo;
	};
};