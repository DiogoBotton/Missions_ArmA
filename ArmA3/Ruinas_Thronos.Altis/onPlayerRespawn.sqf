if (playerSide == west && wasKilled) then {
	[player] join createGroup civilian;
	
	oldUnit = player;
	"DSA_Vampire" createUnit [position player, group player, "vampire = this"];
	selectPlayer vampire;
	deleteVehicle oldUnit;

	newPos = getMarkerPos(selectRandom ["respawn_civilian_1", "respawn_civilian_2", "respawn_civilian_3", "respawn_civilian_4"]);
	player setPos newPos;
};

if (playerSide == civilian && isPapacu && wasKilled) then {
	oldUnit = player;
	"DSA_Wendigo" createUnit [position player, group player, "papacu = this"];
	selectPlayer papacu;
	deleteVehicle oldUnit;
	player addAction ["Farejar presa", "farejar.sqf"];
};

if(isPapacu) exitWith{};

if (playerSide == civilian && wasKilled) then {
	oldUnit = player;
	"DSA_Vampire" createUnit [position player, group player, "vampire = this"];
	selectPlayer vampire;
	deleteVehicle oldUnit;
	player addAction ["Farejar presa", "farejar.sqf"];
};