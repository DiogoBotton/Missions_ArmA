_object = _this select 0;
_value = [1, 100] call BIS_fnc_randomInt;

if(isServer) then {
	if (_value > nivelResistencia) then {
		_blowup = false;
		_explodiu = false;
		while {alive _object && !_explodiu} do
	   	{
	   		_targetArray = nearestObjects [(getPos _object), ["MAN", "LandVehicle"], 20];
	   		if ((count _targetArray) > 0) then
	   		{
	   			{
	   		        if (str(side _x) == "WEST" || str(side _x) == "CIVILIAN") then
	   		        {
	   		        	_blowup = true;
	   		        };
	   		    } forEach _targetArray;
	   		};

	   		if (_blowup) then
	   		{
	   			_boom = "R_57mm_HE" createVehicle (position _object);
				_explodiu = true;
	   		}
	   		else
	   		{
	   			sleep 1;
	   		};
	   	};
	};
};

// if (_value < 25) then {
// 	_trg=createTrigger["EmptyDetector", position _object];
// 	_trg setTriggerArea[8,8,0,false];
// 	_trg setTriggerActivation["WEST","PRESENT",false];
// 	_trg setTriggerStatements["this", "_bomb = nearestObject [getPos (thislist select 0), 'Car']; boom = 'R_57mm_HE' createVehicle position _bomb", ""];
// 	_trg attachTo [_object,[0,0,0]];
// };