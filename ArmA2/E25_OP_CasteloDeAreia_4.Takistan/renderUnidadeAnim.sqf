if(!alive coronel_aziz) exitWith {};

coronel_aziz setCaptive true;

if(isServer && (coronel_aziz hasWeapon "revolver_gold_EP1")) then {
	coronel_aziz action ["surrender", coronel_aziz];
	coronel_aziz action ["DropWeapon", coronel_aziz, "revolver_gold_EP1"];
};

while {renderUnidade} do {
	sleep 1;
	coronel_aziz playaction "surrender";
};

coronel_aziz playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"; // Sair da animação