// note: versions prior to v1.10.2020.11.4 require Hot Coffee Mod to work
state("Superliminal", "2019")
{
    // the current level number (1 for induction, 9 for retrospect, 255 for main menu and loading screens)
    byte levelID : 0xb00b1e5;

    // the pointer to the name of the checkpoint
    // Note: the pointer might be null in main menu / loading screen
    //       hence we use a pointer instead.
    long checkpointNamePtr : "UnityPlayer.dll", 0x163d080, 0x8, 0xb0, 0x28, 0x60;

    // true during loading screens
    bool isLoading : 0xb00b1e6;

    // true whenever any alarm clock is clicked, set back to false when entering a level
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0xe8, 0x28, 0x80, 0x18;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam", "2019")
{
    byte levelID : 0xb00b1e5;
    long checkpointNamePtr : "UnityPlayer.dll", 0x163d080, 0x8, 0xb0, 0x28, 0x60;
    bool isLoading : 0xb00b1e6;
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0xe8, 0x28, 0x80, 0x18;
}

// starting from v1.10.2020.11.4, the game has a speedrun timer, so we can read it directly
state("Superliminal", "2020")
{
    // the number of seconds elapsed after entering induction
    double timer : "UnityPlayer.dll", 0x168ee90, 0x8, 0xa0, 0x188, 0x118;

    // the pointer to the name of the checkpoint
    long checkpointNamePtr : "UnityPlayer.dll", 0x168ee90, 0x8, 0xb0, 0x28, 0xa0;

    // true whenever any alarm clock is clicked, set back to false when entering a level
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0x100, 0x28, 0x80, 0x18;

    // the camera position
    uint xPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xd8;
    uint yPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xdc;
    uint zPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xe0;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam", "2020")
{
    double timer : "UnityPlayer.dll", 0x168ee90, 0x8, 0xa0, 0x188, 0x118;
    long checkpointNamePtr : "UnityPlayer.dll", 0x168ee90, 0x8, 0xb0, 0x28, 0xa0;
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0x100, 0x28, 0x80, 0x18;
    uint xPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xd8;
    uint yPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xdc;
    uint zPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xe0;
}

// updated for version 1.10.2020.12.10
state("Superliminal", "2021")
{
    // the number of seconds elapsed after entering induction
    double timer : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x128;

    // the pointer to the name of the checkpoint
    long checkpointNamePtr : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0xb0;

    // true whenever any alarm clock is clicked, set back to false when entering a level
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0x100, 0x28, 0x80, 0x18;

    // the active scene filename
    string255 scene : "UnityPlayer.dll", 0x180b4f8, 0x48, 0x10, 0x0;

    // status arrays for each of the 7 types of player actions.
    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam", "2021")
{
    double timer : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x128;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0xb0;
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0x100, 0x28, 0x80, 0x18;
    string255 scene : "UnityPlayer.dll", 0x180b4f8, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// Game Pass PC .6.8.25.1006
state("Superliminal", "GamePassPC2021")
{
    double timer : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0x60;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xe8;
    bool alarmStopped : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0x80;
    string255 scene : "UnityPlayer.dll", 0x1823d68, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17e0bd8, 0x8, 0xb0, 0x28, 0xb0, 0x10, 0x18, 0xc0, 0x20;
}

// updated for version 1.10.2021.11.5 and later
state("Superliminal", "2021mp")
{
    double timer : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x130;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0xb8;
    bool alarmStopped : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x141;
    string255 scene : "UnityPlayer.dll", 0x180b4f8, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam", "2021mp")
{
    double timer : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x130;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0xb8;
    bool alarmStopped : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x141;
    string255 scene : "UnityPlayer.dll", 0x180b4f8, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// duplicate state matching the GOG process name
state("SuperliminalGOG", "2021mp")
{
    double timer : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x130;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0xb8;
    bool alarmStopped : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x141;
    string255 scene : "UnityPlayer.dll", 0x180b4f8, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17c8588, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// updated for version 1.10.2022.2.20 and later
state("Superliminal", "2022")
{
    double timer : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x130;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0xb8;
    bool alarmStopped : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x141;
    string255 scene : "UnityPlayer.dll", 0x183cf10, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam", "2022")
{
    double timer : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x130;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0xb8;
    bool alarmStopped : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x141;
    string255 scene : "UnityPlayer.dll", 0x183cf10, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

// duplicate state matching the GOG process name
state("SuperliminalGOG", "2022")
{
    double timer : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x130;
    long checkpointNamePtr : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0xb8;
    bool alarmStopped : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x141;
    string255 scene : "UnityPlayer.dll", 0x183cf10, 0x48, 0x10, 0x0;

    byte67 statusFireAlarm     : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x30, 0x20;
    byte94 statusExtinguisher  : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x48, 0x20;
    byte7  statusConstellation : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x60, 0x20;
    byte15 statusChessPiece    : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x78, 0x20;
    byte15 statusBlueprint     : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0x90, 0x20;
    byte7  statusSodaType      : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xa8, 0x20;
    byte8  statusActualEggs    : "UnityPlayer.dll", 0x17f9d28, 0x8, 0xb0, 0x28, 0x78, 0x10, 0x18, 0xc0, 0x20;
}

startup
{
    settings.Add("il", false, "Individual Level");
    settings.SetToolTip("il", "Only works with game version 2021 and beyond");

    settings.Add("split_on_cp", false, "Split on checkpoints");
    settings.SetToolTip("split_on_cp", "Use this with a split file that supports checkpoints.");

    settings.Add("split_ParkingLot", false, "Split on checkpoint \"_ParkingLot\"", "split_on_cp");
    settings.SetToolTip("split_ParkingLot", "This CP is ignored by default to avoid an inconsistent CP skip.\nEnable this with caution.");
    settings.Add("split_WalkThroughShadow", false, "Split on checkpoint \"_WalkThroughShadow\"", "split_on_cp");
    settings.SetToolTip("split_WalkThroughShadow", "This CP is ignored by default to avoid an inconsistent CP skip.\nEnable this with caution.");

    settings.Add("split_on_collectibles", false, "Enabling splitting on collectibles");
    settings.Add("split_on_FireAlarm", false, "Split on fire alarms", "split_on_collectibles");
    settings.Add("split_on_Extinguisher", false, "Split on fire extinguishers", "split_on_collectibles");
    settings.Add("split_on_Constellation", false, "Split on seeing constellations", "split_on_collectibles");
    settings.Add("split_on_ChessPiece", false, "Split on clicking collectible chess pieces", "split_on_collectibles");
    settings.Add("split_on_Blueprint", false, "Split on clicking blueprints", "split_on_collectibles");
    settings.Add("split_on_SodaType", false, "Split on getting each of the 7 soda types", "split_on_collectibles");
    settings.Add("split_on_ActualEggs", false, "Split on collecting literal Easter eggs", "split_on_collectibles");
    settings.SetToolTip("split_on_collectibles", "Only works in game ver 2021 and beyond");
}

init
{
    // check size of UnityPlayer.dll to determine version
    var unitySize = Array.Find(modules, m => m.ModuleName == "UnityPlayer.dll").ModuleMemorySize;
    vars.since_2021 = false;

    if (unitySize == 25210880)
    {
        print("Using Hot Coffee Mod");
        version = "2019";
    }
    else if (unitySize == 25563136 ||
             unitySize == 24654280) // gog v1.10.2020.11.4
    {
        print("Using in-game speedrun timer");
        version = "2020";
    }
    else if (unitySize == 26968064)
    {
        print("Game Pass PC: Using scene filename and in-game speedrun timer");
        version = "GamePassPC2021";
        vars.since_2021 = true;

        vars.inLevel = false;
    }
    else
    {
        print("Using scene filename and in-game speedrun timer");
        vars.since_2021 = true;

        if (unitySize != 27074560)
        {
            version = "2021";

            // we still need to check the size of Assembly-CSharp.dll to determine the exact version
            // because the pointers have changed with the multiplayer update
            if (game.ProcessName == "Superliminal")
            {
                string dllPath = modules.First().FileName + "\\..\\Superliminal_Data\\Managed\\Assembly-CSharp.dll";
                long dllSize = new System.IO.FileInfo(dllPath).Length;
                if (dllSize != 2381312 && // egs v1.10.2020.12.10
                    dllSize != 2293760)   // egs v1.10.2021.4.19 & v1.10.2021.5.10
                    version = "2021mp";
            }
            else if (game.ProcessName == "SuperliminalSteam")
            {
                string dllPath = modules.First().FileName + "\\..\\SuperliminalSteam_Data\\Managed\\Assembly-CSharp.dll";
                long dllSize = new System.IO.FileInfo(dllPath).Length;
                if (dllSize != 1831936 && // steam v1.10.2020.12.10
                    dllSize != 1744384)   // steam v1.10.2021.4.18 & v1.10.2021.5.10
                    version = "2021mp";
            }
            else if (game.ProcessName == "SuperliminalGOG")
            {
                string dllPath = modules.First().FileName + "\\..\\SuperliminalGOG_Data\\Managed\\Assembly-CSharp.dll";
                long dllSize = new System.IO.FileInfo(dllPath).Length;
                if (dllSize != 1824768 && // gog v1.10.2020.12.10
                    dllSize != 1736704)   // gog v1.10.2021.5.10
                    version = "2021mp";
            }

            if (version == "2021mp")
                print("Multiplayer update detected");
        }
        else
        {
            // unitySize == 27074560: 2022.2
            version = "2022";
            print("2022.2 detected");
        }

        // true when the active scene is a level
        // this is required because the 'scene' pointer seems to
        // be invalid for a few frames when entering a new scene
        vars.inLevel = false;
    }

    // the name of the checkpoint,
    //   corresponding to current.checkpointNamePtr
    //                    and old.checkpointNamePtr
    vars.cp_name = "";
    vars.old_cp_name = "";

    if (settings["split_on_cp"])
    {
        vars.split_on_cp = true;
        print("Splitting on checkpoints");
    }

    if (vars.il = settings["il"])
        print("Timing individual level");
}

update
{
    if (version == "2019")
    {
        current.levelID = memory.ReadValue<byte>(new IntPtr(0xb00b1e5));
        current.isLoading = memory.ReadValue<bool>(new IntPtr(0xb00b1e6));
    }
    else if (vars.since_2021)
    {
        const string LevelPrefix = "Assets/_Levels/_LiveFolder/ACT";
        if (!vars.inLevel && current.scene != null && current.scene.StartsWith(LevelPrefix))
            vars.inLevel = true;
    }

    vars.split_on_cp = settings["split_on_cp"];

    vars.old_cp_name = vars.cp_name;
    if (current.checkpointNamePtr != 0 && current.checkpointNamePtr != old.checkpointNamePtr)
        vars.cp_name = memory.ReadString((IntPtr)(current.checkpointNamePtr + 0x14), 256);

    if (settings["il"])
    {
        // use regular timing method for Induction and for older game versions
        const string Induction = "Assets/_Levels/_LiveFolder/ACT01/TestChamber/TestChamber_Live.unity";
        vars.il =
            (vars.since_2021)
            && current.scene != Induction;
    }
}

gameTime
{
    if (version != "2019" && !vars.il)
        return TimeSpan.FromSeconds(current.timer);

    return null;
}

isLoading
{
    bool loading = false;

    if (vars.il)
        loading = false;

    else if (version == "2019")
        loading = current.isLoading;

    else
        loading = old.timer == current.timer;

    return loading;
}

start
{
    bool startedInduction = false;

    if (vars.il)
    {
        const string LevelPrefix = "Assets/_Levels/_LiveFolder/ACT";
        bool inLevel = current.scene != null && current.scene.StartsWith(LevelPrefix);
        startedInduction = inLevel && current.scene != old.scene;
    }

    else if (version == "2019")
        startedInduction = current.levelID == 1 && current.levelID != old.levelID;

    else
        startedInduction = current.timer > 0 && old.timer != current.timer;

    return startedInduction;
}

reset
{
    bool inMainMenu = false;
    bool enteredInduction = false;

    if (version == "2019")
        enteredInduction = current.levelID == 1 && current.levelID != old.levelID;

    else
    {
        enteredInduction = old.timer != current.timer && (current.timer < old.timer || old.timer == 0);

        if (version == "2020")
        {
            // pos = [0.04, 1, -10] in main menu
            inMainMenu =
                current.xPos == old.xPos && current.xPos == 0x3d23d70a
                && current.yPos == old.yPos && current.yPos == 0x3f800000
                && current.zPos == old.zPos && current.zPos == 0xc1200000;
        }
        else
        {
            const string Menu = "Assets/_Levels/_LiveFolder/Misc/StartScreen_Live.unity";
            inMainMenu = current.scene != old.scene && current.scene == Menu;
        }
    }

    return inMainMenu || enteredInduction;
}

split
{
    bool enteredNextLevel = false;
    bool finalAlarmClicked = false;
    bool checkpointUpdated = false;
    bool collectibleUpdated = false;

    if (version == "2019")
    {
        enteredNextLevel = !current.isLoading
            && current.levelID != old.levelID
            && current.levelID != 255;

        finalAlarmClicked = !current.isLoading
            && current.levelID == 9 && current.alarmStopped;
    }

    else if (version == "2020")
    {
        // pos = [0, 0, 0] during loading screens
        enteredNextLevel =
               current.xPos != old.xPos && current.xPos == 0
            && current.yPos != old.yPos && current.yPos == 0
            && current.zPos != old.zPos && current.zPos == 0;
        finalAlarmClicked = timer.CurrentSplitIndex == 8 && current.alarmStopped;
    }

    else if (vars.since_2021)
    {
        if (current.scene != null)
        {
            const string LoadingScenesPrefix = "Assets/_Levels/_LiveFolder/Misc/LoadingScenes/";
            if (vars.inLevel && current.scene.StartsWith(LoadingScenesPrefix))
            {
                vars.inLevel = false;
                enteredNextLevel = true;
            }

            const string Retrospect = "Assets/_Levels/_LiveFolder/ACT03/EndingMontage/EndingMontage_Live.unity";
            finalAlarmClicked = current.scene == Retrospect && current.alarmStopped;

            bool diffFireAlarm = settings["split_on_FireAlarm"] && !Enumerable.SequenceEqual(current.statusFireAlarm, old.statusFireAlarm);
            bool diffExtinguisher = settings["split_on_Extinguisher"] && !Enumerable.SequenceEqual(current.statusExtinguisher, old.statusExtinguisher);
            bool diffConstellation = settings["split_on_Constellation"] && !Enumerable.SequenceEqual(current.statusConstellation, old.statusConstellation);
            bool diffChessPiece = settings["split_on_ChessPiece"] && !Enumerable.SequenceEqual(current.statusChessPiece, old.statusChessPiece);
            bool diffBlueprint = settings["split_on_Blueprint"] && !Enumerable.SequenceEqual(current.statusBlueprint, old.statusBlueprint);
            bool diffSodaType = settings["split_on_SodaType"] && !Enumerable.SequenceEqual(current.statusSodaType, old.statusSodaType);
            bool diffActualEggs = settings["split_on_ActualEggs"] && !Enumerable.SequenceEqual(current.statusActualEggs, old.statusActualEggs);

            collectibleUpdated |= diffFireAlarm;
            collectibleUpdated |= diffExtinguisher;
            collectibleUpdated |= diffConstellation;
            collectibleUpdated |= diffChessPiece;
            collectibleUpdated |= diffBlueprint;
            collectibleUpdated |= diffSodaType;
            collectibleUpdated |= diffActualEggs;
        }
    }

    if (vars.split_on_cp)
        checkpointUpdated = current.checkpointNamePtr != 0
            && !vars.cp_name.Equals(vars.old_cp_name)
            && !vars.cp_name.Equals("")
            && (settings["split_ParkingLot"] || !vars.cp_name.Equals("_ParkingLot"))
            && (settings["split_WalkThroughShadow"] || !vars.cp_name.Equals("_WalkThroughShadow"));

    return enteredNextLevel || finalAlarmClicked || checkpointUpdated || collectibleUpdated;
}
