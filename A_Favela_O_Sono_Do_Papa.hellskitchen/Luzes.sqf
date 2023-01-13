_objHouse = nearestObjects [player, ["House"], 1500];

{
	for "_i" from 1 to 5 do {
					
					_x animate [format ["Lights_%1",_i],1];
	};
} forEach _objHouse;