
	//CRIA E CONFIGURAR OS TRIGGER
	Posicao = getPosATL suv1;	
	TriggerSUV1 = createTrigger ["EmptyDetector", Posicao];
	TriggerSUV1  setTriggerActivation ["ANY", "PRESENT", true];
	TriggerSUV1  setTriggerArea [5, 3, 100, true];
	TriggerSUV1  setTriggerStatements [ "this && {vehicle _x iskindof 'bloodsucker'} count thislist > 0", "papacu = (thislist select 0); _nil = [papacu,suv1] execVM 'EmpurrarCarro.sqf';",""];
	TriggerSUV1 attachTo [suv1,[0,0,0]];

	Posicao = getPosATL suv2;	
	TriggerSUV2 = createTrigger ["EmptyDetector", Posicao];
	TriggerSUV2  setTriggerActivation ["ANY", "PRESENT", true];
	TriggerSUV2  setTriggerArea [5, 3, 100, true];
	TriggerSUV2  setTriggerStatements [ "this && {vehicle _x iskindof 'bloodsucker'} count thislist > 0", "papacu = (thislist select 0); _nil = [papacu,suv2] execVM 'EmpurrarCarro.sqf';",""];
	TriggerSUV2 attachTo [suv2,[0,0,0]];

	Posicao = getPosATL suv3;	
	TriggerSUV3 = createTrigger ["EmptyDetector", Posicao];
	TriggerSUV3  setTriggerActivation ["ANY", "PRESENT", true];
	TriggerSUV3  setTriggerArea [5, 3, 100, true];
	TriggerSUV3  setTriggerStatements [ "this && {vehicle _x iskindof 'bloodsucker'} count thislist > 0", "papacu = (thislist select 0); _nil = [papacu,suv3] execVM 'EmpurrarCarro.sqf';",""];
	TriggerSUV3 attachTo [suv3,[0,0,0]];