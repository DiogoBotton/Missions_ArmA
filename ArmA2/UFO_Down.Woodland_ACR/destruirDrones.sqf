if(!isNil "drone_1" || !isNil "drone_2" || !isNil "drone_3") then {
	if(!alive drone_1 && !alive drone_2 && !alive drone_3) exitWith {
		_aviso = "Não há drones para destruir.";
		nul = [(_aviso)] execVM "hintGlobal.sqf";
	};
	
	if(!isNil "drone_1") then {drone_1 setDamage 1;};
	if(!isNil "drone_2") then {drone_2 setDamage 1;};
	if(!isNil "drone_3") then {drone_3 setDamage 1;};
};