if(!isNil "piloto") then {
	if(player == piloto) then{
		ufo addAction ["Dobra Espacial", "warp.sqf"];
	};
};
if(!isNil "copiloto") then {
	if(player == copiloto) then{
		ufo addAction ["Dobra Espacial", "warp.sqf"];
	};
};