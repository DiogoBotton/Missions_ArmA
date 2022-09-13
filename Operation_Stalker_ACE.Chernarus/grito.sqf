_alvoGrito = _this select 0;
_genero = _this select 1;

somGritoFeminino = ["gritoFeminino1", "gritoFeminino2", "gritoFeminino3"];
somGritoMasculino = ["scream1", "scream2", "scream3"];

if(_genero == "F") then {
	somGrito = somGritoFeminino call BIS_fnc_selectRandom;
}
else {
	somGrito = somGritoMasculino call BIS_fnc_selectRandom;
};

nul = [(_alvoGrito), (somGrito)] call fn_netSay3D;

sleep 5;
_alvoGrito setDamage 1;