{
if (side _x == civilian && (_x != wifeFarmer && _x != civilFujao2)) then
	{
	_x addEventHandler ["FiredNear",{civisHostis setDamage 1;}];
	_x addEventHandler ["IncomingMissile",{civisHostis setDamage 1;}];
	};
} forEach allUnits;