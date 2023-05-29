if (isServer) then {
	tocarAlarme = true;
	publicVariable "tocarAlarme";

	speaker_alarm addAction ["Desligar Alarme", "alarmOff.sqf", [],1,false,true,"","_this distance _target < 6"];
};