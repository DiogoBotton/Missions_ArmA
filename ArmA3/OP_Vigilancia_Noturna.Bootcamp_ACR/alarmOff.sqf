_object = _this select 0;
_actionId = _this select 2;

_object removeAction _actionId;

deleteVehicle triggerAlarm_Sound;