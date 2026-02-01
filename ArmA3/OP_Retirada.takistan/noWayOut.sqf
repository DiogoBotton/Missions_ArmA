isUnit = true;

if(isServer) then {
	while {isUnit} do {
		if(localAlvo == "jilavur") then {
			unitsTrigger = list trigger_jilavur;
		} else {
			unitsTrigger = list trigger_feruzabad;
		};

		isUnit = false;
		{
			if (side _x == west && alive _x && isPlayer _x) then {
				isUnit = true;
				break;
			};
		} foreach unitsTrigger;


		if(debugar == 1) then {
			sleep 10;
			_hintStr = format["Há unidades? %1 | %2", isUnit, unitsTrigger];
			_hintStr remoteExec["hint"];
		} else {
			sleep 60;
		};
	};
	
	if(localAlvo == "jilavur") then {
		newAttack = "feruzabad";
	} else {
		newAttack = "jilavur";
	};

	civil_rastreadores setDamage 1;
	nul = [newAttack, 1, 1, 4, 360, 60] execVM "attack.sqf";
};