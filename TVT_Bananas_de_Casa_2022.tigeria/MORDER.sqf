_quem = _this select 1;
_MORDER = ["morder1","morder2","morder3"];
_MORDER = _MORDER call BIS_fnc_selectRandom;
nul = [_quem, _MORDER] call fn_netSay3D;
DANO = 0; 

MORDIDA = createTrigger ["EmptyDetector", (getPos _quem)];
MORDIDA setTriggerArea [1, 1, 0, false];
MORDIDA setTriggerActivation ["WEST", "PRESENT", true];
MORDIDA setTriggerStatements ["this","MORDIDO = (list MORDIDA) select 0; DANO = getDammage MORDIDO; DANOATUAL = DANO + 0.25; MORDIDO setdamage DANOATUAL;",""];
MORDIDA attachTo [_quem, [0, 1.5, 0] ];

MORDIDA2 = createTrigger ["EmptyDetector", (getPos _quem)];
MORDIDA2 setTriggerArea [0.4, 0.4, 0, false];
MORDIDA2 setTriggerActivation ["EAST", "PRESENT", true];
MORDIDA2 setTriggerStatements ["this","MORDIDO2 = (list MORDIDA2) select 0; DANO = getDammage MORDIDO2; DANOATUAL = DANO + 0.25; MORDIDO2 setdamage DANOATUAL;",""];
MORDIDA2 attachTo [_quem, [0, 1.5, 0] ];

MORDIDA3 = createTrigger ["EmptyDetector", (getPos _quem)];
MORDIDA3 setTriggerArea [1, 1, 0, false];
MORDIDA3 setTriggerActivation ["GUER", "PRESENT", true];
MORDIDA3 setTriggerStatements ["this","MORDIDO3 = (list MORDIDA3) select 0; DANO = getDammage MORDIDO3; DANOATUAL = DANO + 0.25; MORDIDO3 setdamage DANOATUAL;",""];
MORDIDA3 attachTo [_quem, [0, 1.5, 0] ];



sleep 2;

deleteVehicle MORDIDA;
deleteVehicle MORDIDA2;
deleteVehicle MORDIDA3;