if(isServer) then {
	_numSorteado = [1, 100] call BIS_fnc_randomInt;

	numDado = _numSorteado;
	publicVariable "numDado";

	rolarDado = false;
	publicVariable "rolarDado";
};