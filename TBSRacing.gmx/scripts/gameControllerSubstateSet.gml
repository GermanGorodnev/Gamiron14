///gameControllerSubstateSet(SUBSTATES new)
var so = substate;
with (oGameController)
{
    substate = argument[0];
    systemCursorSet(sCursorPointer);
    // resets
    arrowBuild = 0;
    with (oEngineArrow)
        instance_destroy();
    with (oButtonCarGUIBrake)
        instance_destroy();
    with (oButtonCarGUIEditPoints)
        instance_destroy();
    with (oButtonCarGUIDeletePoints)
        instance_destroy();
    with (oButtonCarGUIDeletePath)
        instance_destroy();
    with (oButtonCarGUIWeaponCarMode)
        instance_destroy();
    with (oButtonCarGUIWeapon)
        instance_destroy();

    if (substate == SUBSTATES.__NONE)
    {
        selectedSignXscale = 1;
        selectedSignXpath = 0;
    }

    gameControllerGuistateSet(GUI_STATES.__GUI);
        
    switch (substate)
    {
    case SUBSTATES.__NONE:
        break;
    case SUBSTATES.__CAR_WEAPONS:
        break;
    case SUBSTATES.__CAR_MOVE:
        instance_create(0, 0, oEngineArrow);
        instance_create(0, 0, oButtonCarGUIBrake);
        //instance_create(0, 0, oButtonCarGUIWeaponCarMode);
        gameControllerCarWeaponButtonsInit();
        if (selectedCar.control == CONTROL_TYPES.POINTS)
        {
            instance_create(0, 0, oButtonCarGUIEditPoints);
            instance_create(0, 0, oButtonCarGUIDeletePoints);
            instance_create(0, 0, oButtonCarGUIDeletePath);
        }
        break;
    }
}
