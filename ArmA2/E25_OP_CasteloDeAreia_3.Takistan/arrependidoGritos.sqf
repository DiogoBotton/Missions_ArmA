_contador = 1;
_texto = "Fala";
_som = "arab";

while {alive hbA && !(bombaDesarmada || bombaExplodiu)} do {
	_textoGrito = _texto + str _contador;
	_somGrito = _som + str _contador;

	if(bombaExplodiu) exitWith {};

	if(isServer) then {
		nul = [(hbA), (_somGrito)] call fn_netSay3D;
	};

	sleep 0.25;

	titleRsc [_textoGrito, "plain down"];
	sleep 15;
	
	if(_contador >= 4) then {
		_contador = 1;
	}
	else {
		_contador = _contador + 1;
	};
};