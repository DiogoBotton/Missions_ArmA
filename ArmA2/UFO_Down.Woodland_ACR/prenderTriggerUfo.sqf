Posicao = getPosATL ufo;	

// Botão vermelho
TriggerUfo = createTrigger ["EmptyDetector", Posicao];
TriggerUfo setTriggerActivation ["ANY", "PRESENT", false];
TriggerUfo setTriggerArea [300, 300, 100, false];
TriggerUfo setTriggerTimeout [40,40,40, false];
TriggerUfo setTriggerStatements [ "!alive civilNuke", "ufo setDamage 1;",""];
TriggerUfo attachTo [ufo,[0,0,0]];

TriggerReparoUfo = createTrigger ["EmptyDetector", Posicao];
TriggerReparoUfo setTriggerActivation ["ANY", "PRESENT", true];
TriggerReparoUfo setTriggerArea [30, 30, 100, false];
TriggerReparoUfo setTriggerStatements [ "this && (vehicle player) in thislist", "",""];
TriggerReparoUfo attachTo [ufo,[0,0,0]];

// Warp Piloto
triggerActionPiloto attachTo [ufo,[0,0,0]];