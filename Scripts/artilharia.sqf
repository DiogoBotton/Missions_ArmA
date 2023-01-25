/*

fatty's ambient artillery tool (faat) version 1.0

by fatty


Forces an AI gun (e.g. cannon or rocket artillery) to fire at regular intervals at a defined target. Gunners will persist until out of ammo or dead.

CAUTION: the guns fire live ammo, so be careful where you aim!

Required Parameters:
Artillery Piece (object) - object to begin firing.
Target (object) - target at which the artillery piece will fire. Suggested target is an invisible H setPos'd several hundred metres above the gun.

Optional Parameters:
Delay (number) - delay between shots in seconds (default is 10 seconds).
Disable aiming AI (boolean) - prevents AI gunners from engaging other targets (default is true).
Enable auto-rearm (boolean) - enables automatic rearming of gun after every shot (default is false).

Examples:
nul = [big_gun, gun_target] execVM "faat.sqf";
nul = [rocket_artillery, house, 20, false, true] execVM "faat.sqf";


*/

private ["_gun","_target","_delay","_disableaim","_autorearm"];

_gun = _this select 0;
_target = _this select 1;
_delay = if (count _this > 2) then {_this select 2} else {2};
_disableaim = if (count _this > 3) then {_this select 3} else {true};
_autorearm = if (count _this > 4) then {_this select 4} else {false};


if (_disableaim) then {
	{_gun disableAI _x;} foreach ["move","target","autotarget","anim"];
	_gun setCombatMode "BLUE";
};

_targetPos = getPos _target;

_newTarget = "HeliHEmpty" createVehicle (_targetPos);
_newTarget setPosASL [_targetPos select 0, _targetPos select 1, 500];

(gunner _gun) lookAt _newTarget;

sleep 5;

while {alive (gunner _gun)} do
{
	_delay = (random 2);
	sleep _delay;
	_gun fire (weapons _gun select 0);
	if (_autorearm) then {
		_gun setVehicleAmmo 1
	};
};