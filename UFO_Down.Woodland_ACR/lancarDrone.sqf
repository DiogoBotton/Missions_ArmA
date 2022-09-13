if(dronesDisponiveis <= 0) exitWith {hint "Não há drones para lançar.";};
if(droneEmLancamento) exitWith {hint "Aguarde o drone ser lançado.";};

droneEmLancamento = true;
publicVariable "droneEmLancamento";

_aviso = "Lançando drone...";
nul = [(_aviso)] execVM "hintGlobal.sqf";
sleep 5;

switch (dronesDisponiveis) do {
	case 1: { triggerNameDrone = "triggerDrone1"; };
	case 2: { triggerNameDrone = "triggerDrone2"; };
	case 3: { triggerNameDrone = "triggerDrone3"; };
};
publicVariable "triggerNameDrone";

lancarDrone = true;
publicVariable "lancarDrone";

dronesDisponiveis = dronesDisponiveis -1;
publicVariable "dronesDisponiveis";

_aviso = "Drone lançado. Drones restantes: " + str dronesDisponiveis + ".";
nul = [(_aviso)] execVM "hintGlobal.sqf";

sleep 1;
lancarDrone = false;
publicVariable "lancarDrone";

droneEmLancamento = false;
publicVariable "droneEmLancamento";