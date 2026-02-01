if (isServer) then {
	// Adquire a lista das unidades em cada trigger, seleciona o primeiro índice e envia o grupo da unidade para os scripts
	if ((count (list triggerStartA)) > 0) then {
		_listGroupA = group ((list triggerStartA) select 0);
		[(_listGroupA)] execVM "attack.sqf"; 
		[(_listGroupA)] execVM "arty.sqf";
		if(Esturro == 1) then {[(_listGroupA)] execVM "rastreadoresCarros.sqf";};
	};
	if ((count (list triggerStartB)) > 0) then {
		_listGroupB = group ((list triggerStartB) select 0);
		[(_listGroupB)] execVM "attack.sqf"; 
		[(_listGroupB)] execVM "arty.sqf";
		if(Esturro == 1) then {[(_listGroupB)] execVM "rastreadoresCarros.sqf";};
	};

	if ((count (list triggerStartC)) > 0) then {
		_listGroupC = group ((list triggerStartC) select 0); 
		[(_listGroupC)] execVM "attack.sqf";
		[(_listGroupC)] execVM "arty.sqf";
		if(Esturro == 1) then {[(_listGroupC)] execVM "rastreadoresCarros.sqf";};
	};

	if ((count (list triggerStartD)) > 0) then {
		_listGroupD = group ((list triggerStartD) select 0); 
		[(_listGroupD)] execVM "attack.sqf"; 
		[(_listGroupD)] execVM "arty.sqf";
		if(Esturro == 1) then {[(_listGroupD)] execVM "rastreadoresCarros.sqf";};
	};

	if ((count (list triggerStartE)) > 0) then {
		_listGroupE = group ((list triggerStartE) select 0);
		[(_listGroupE)] execVM "attackM113.sqf";
	};
	if ((count (list triggerStartF)) > 0) then {
		_listGroupF = group ((list triggerStartF) select 0);
		[(_listGroupF)] execVM "attackM113.sqf";
	};
	if ((count (list triggerStartG)) > 0) then {
		_listGroupG = group ((list triggerStartG) select 0);
		[(_listGroupG)] execVM "attackM113.sqf";
	};
};