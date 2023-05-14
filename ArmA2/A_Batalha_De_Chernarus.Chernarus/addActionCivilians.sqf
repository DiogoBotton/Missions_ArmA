{
	if(side _x == civilian) then {
		_x addAction ["Mandar entrar no caminhão", "civilEntrarCaminhao.sqf"];
	};	
} forEach allUnits;