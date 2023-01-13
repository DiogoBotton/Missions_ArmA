// Remove Event Handlers
{
if (side _x == civilian) then
    {
    _x removeAllEventHandlers "FiredNear";
    _x removeAllEventHandlers "IncomingMissile";
    };
} forEach AllUnits