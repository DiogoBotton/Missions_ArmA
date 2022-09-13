_this addaction ["Fire From Gunner Seat","SFV\CH47\startG.sqf", "", 0, false, true, "MoveForward", "_this == gunner _target"];
_this addaction ["Fire From Back Left Seat","SFV\CH47\startBL.sqf", "", 0, false, true, "", "_this in assignedCargo _target"];
_this addaction ["Fire From Back Right Seat","SFV\CH47\startBR.sqf", "", 0, false, true, "", "_this in assignedCargo _target"];