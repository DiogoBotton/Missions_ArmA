detach player;
player setVariable ["st_mh6_enhance_ffv_active",false];
player allowdamage true;
[31, [true, true, true], {hint "BEEP! You did nothing!"}] call CBA_fnc_addKeyHandler;
reload player;
player moveincargo [SFV_V, 4];