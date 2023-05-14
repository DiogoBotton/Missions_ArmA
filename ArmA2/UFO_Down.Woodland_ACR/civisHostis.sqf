{civil_1 addMagazine "7Rnd_45ACP_1911"} forEach [1,2,3,4,5];
civil_1 addWeapon "Colt1911";
civil_1 setCaptive 0;

{civil_2 addMagazine "8Rnd_B_Beneli_74Slug"} forEach [1,2,3,4,5];
civil_2 addWeapon "M1014";
civil_2 setCaptive 0;

{civil_3 addMagazine "8Rnd_B_Beneli_Pellets"} forEach [1,2,3,4,5];
civil_3 addWeapon "M1014";
civil_3 setCaptive 0;

// Remove Event Handlers
{
if (side _x == civilian) then
    {
    _x removeAllEventHandlers "FiredNear";
    _x removeAllEventHandlers "IncomingMissile";
    };
} forEach AllUnits