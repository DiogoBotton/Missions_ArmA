_object = _this select 0;

if(isServer) then {
	_blowup = false;
	_explodiu = false;
	while {alive _object && !_explodiu} do
	{
		_targetArray = nearestObjects [(getPos _object), ["MAN", "LandVehicle"], 50];
		if ((count _targetArray) > 0) then
		{
			{
		        if (str(side _x) == "WEST") then
		        {
		        	_blowup = true;
		        };
		    } forEach _targetArray;
		};
		if (_blowup) then
		{
			_boom = "Sh_105_HE" createVehicle (position _object);
			_explodiu = true;
		}
		else
		{
			sleep 1;
		};
	};
};