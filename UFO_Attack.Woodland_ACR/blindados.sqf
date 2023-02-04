private ["_gun","_target","_delay","_disableaim","_autorearm"];

_gun = _this select 0;
_target = _this select 1;
_delay = if (count _this > 2) then {_this select 2} else {2};
_disableaim = if (count _this > 3) then {_this select 3} else {false};
_autorearm = if (count _this > 4) then {_this select 4} else {false};

if(isServer) then {
	if (_disableaim) then {
		{_gun disableAI _x;} foreach ["move","target","autotarget","anim"];
		_gun setCombatMode "BLUE";
	};

	_targetPos = getPos _target;

	_newTarget = "HeliHEmpty" createVehicle (_targetPos);
	_newTarget setPosASL [_targetPos select 0, _targetPos select 1, 50];

	while {_gun distance _target > 950} do {
		sleep 1;
	};

	{_gun enableAI _x;} foreach ["move","target","autotarget","anim"];
	
	_contador = 1;
	while {alive (gunner _gun) && _contador < 20 && alive _target} do
	{
		(gunner _gun) lookAt _target;
		_gun fire (weapons _gun select 0);
		sleep 5;
		if (_autorearm) then {
			_gun setVehicleAmmo 1;
		};
		_contador = _contador + 1;
	};
};