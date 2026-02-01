_timeMessage = 10;
_timeSleep = 300;

if (isServer) then {
	while {true} do {
		sleep _timeMessage;
		"Seja bem vindo ao servidor dos Espartanos 25." remoteExec ["systemChat"];
		sleep _timeMessage;
		"Siga sempre as orientações e ordens do líder da missão atual." remoteExec ["systemChat"];
		sleep _timeMessage;
		"Respeito para ser respeitado." remoteExec ["systemChat"];
		sleep _timeMessage;
		"Utilizamos o mod ACRE para comunicação, portanto, entre no nosso Team Speak 3" remoteExec ["systemChat"];
		sleep _timeMessage;
		"Team Speak 3 IP: 177.55.57.117" remoteExec ["systemChat"];
		sleep _timeMessage;
		"Deseja fazer parte dos Espartanos 25? Fale com algum representante:" remoteExec ["systemChat"];
		sleep _timeMessage;
		"Roberto Nascimento, Lucchesi, Luis Claudio, Eduardo MC" remoteExec ["systemChat"];
		sleep _timeSleep;
	};
};