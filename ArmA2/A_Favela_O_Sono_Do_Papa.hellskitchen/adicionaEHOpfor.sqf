{
if (side _x == east) then
	{
	_x addEventHandler ["FiredNear",{civilGritos setDamage 1;}];
	_x addEventHandler ["IncomingMissile",{civilGritos setDamage 1;}];
	};
} forEach allUnits;