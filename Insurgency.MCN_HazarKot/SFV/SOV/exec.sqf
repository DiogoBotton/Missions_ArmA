_this addaction ["Fire From Front Left Seat","SFV\SOV\startFL.sqf", "", 0, false, true, "", "_this == driver _target"];
_this addaction ["Fire From Front Right Seat","SFV\SOV\startFR.sqf", "", 0, false, true, "MoveForward", "_this == commander _target"];
_this addaction ["Fire From Gunner Seat","SFV\SOV\startG.sqf", "", 0, false, true, "MoveForward", "_this == gunner _target"];
_this addaction ["Fire From Back Left Seat","SFV\SOV\startBL.sqf", "", 0, false, true, "", "_this in assignedCargo _target"];
_this addaction ["Fire From Back Right Seat","SFV\SOV\startBR.sqf", "", 0, false, true, "", "_this in assignedCargo _target"];
_this addaction ["Fire From Far Back Left Seat","SFV\SOV\startFBL.sqf", "", 0, false, true, "", "_this in assignedCargo _target"];
_this addaction ["Fire From Far Back Right Seat","SFV\SOV\startFBR.sqf", "", 0, false, true, "", "_this in assignedCargo _target"];