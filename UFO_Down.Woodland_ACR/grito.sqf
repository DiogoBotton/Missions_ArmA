_target = _this select 0;

if(isServer) then {
	somGritoMasculino = ["grito1", "grito2"];
	sleep 10;

	for [{_i=1}, {_i <= 5}, {_i=_I+1}] do {
		somGrito = somGritoMasculino call BIS_fnc_selectRandom;
		if(_target == "civil1") then {
			nul = [(civilFujao), (somGrito)] call fn_netSay3D;
		};

		if(_target == "civil2") then {
			nul = [(civilFujao2), (somGrito)] call fn_netSay3D;
		};
		sleep 10;
	};
};