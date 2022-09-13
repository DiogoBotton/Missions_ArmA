detach player;
player setVariable ["st_mh6_enhance_ffv_active",false];
player removeeventhandler ["fired", 0];
[31, [true, true, true], {hint "BEEP! You did nothing!"}] call CBA_fnc_addKeyHandler;
reload player;
player moveingunner SFV_V;
SFV_V = nil;