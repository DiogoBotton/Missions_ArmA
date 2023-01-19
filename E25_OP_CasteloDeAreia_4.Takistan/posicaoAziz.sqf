_intRandom = [1, 3] call BIS_fnc_randomInt;

_spawnMarker = "aziz" + str _intRandom;

coronel_aziz setPos (getMarkerPos _spawnMarker);