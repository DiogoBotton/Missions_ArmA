_object = _this select 0;

if(isServer) then {
	_blowup = false;
	_explodiu = false;
	while {alive _object && !_explodiu} do
	{
		_targetArray = nearestObjects [(getPos _object), ["MAN", "LandVehicle"], 4];
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
			_boom = "B_23mm_HE" createVehicle (position _object);
			sleep 2;
			_boom2 = "B_23mm_HE" createVehicle (position caixa4);
			sleep 0.5;
			_boom2 = "B_23mm_HE" createVehicle (position caixa4);
			sleep 0.8;
			_boom2 = "B_23mm_HE" createVehicle (position caixa4);
			sleep 0.5;
			_boom2 = "B_23mm_HE" createVehicle (position caixa4);
			sleep 0.6;
			_boom2 = "B_23mm_HE" createVehicle (position caixa4);
			caixa4 setDamage 1;
			_explodiu = true;
			_object setDamage 1;
			deleteVehicle _object;
			deleteVehicle cano;
			fogo = true;
			publicVariable "fogo";
		}
		else
		{
			sleep 1;
		};
	};
};