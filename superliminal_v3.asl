// note: versions prior to v1.10.2020.11.4 require Hot Coffee Mod to work
state("Superliminal")
{
    // the current level number (1 for induction, 9 for retrospect, 255 for main menu and loading screens)
    byte levelID : 0xb00b1e5;

    // true during loading screens
    bool isLoading : 0xb00b1e6;

    // true whenever any alarm clock is clicked, set back to false when entering a level
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0xE8, 0x28, 0x80, 0x18;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam")
{
    byte levelID : 0xb00b1e5;
    bool isLoading : 0xb00b1e6;
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0xE8, 0x28, 0x80, 0x18;
}

// starting from v1.10.2020.11.4, the game has a speedrun timer, so we can read it directly
state("Superliminal", "srt")
{
    // the number of seconds elapsed after entering induction
    double timer : "mono-2.0-bdwgc.dll", 0x490a90, 0x2760, 0x118;

    // true whenever any alarm clock is clicked, set back to false when entering a level
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0x100, 0x28, 0x80, 0x18;

    // the camera position
    uint xPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xd8;
    uint yPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xdc;
    uint zPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xe0;
}

// duplicate state matching the Steam process name
state("SuperliminalSteam", "srt")
{
    double timer : "mono-2.0-bdwgc.dll", 0x490A90, 0x2760, 0x118;
    bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0x100, 0x28, 0x80, 0x18;
    uint xPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xd8;
    uint yPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xdc;
    uint zPos : "UnityPlayer.dll", 0x168ec88, 0x78, 0x78, 0x60, 0x30, 0x8, 0x840, 0xe0;
}

init
{
    // check size of UnityPlayer.dll to determine version
    if (modules[4].ModuleMemorySize == 25563136)
    {
        print("Using in-game speedrun timer");
        version = "srt";
    }

    else
        print("Using Hot Coffee Mod");
}

update
{
    if (version != "srt")
    {
        current.levelID = memory.ReadValue<byte>(new IntPtr(0xb00b1e5));
        current.isLoading = memory.ReadValue<bool>(new IntPtr(0xb00b1e6));
    }
}

gameTime
{
    if (version == "srt")
        return TimeSpan.FromSeconds(current.timer);

    return null;
}

isLoading
{
    bool loading;

    if (version == "srt")
        loading = old.timer == current.timer;

    else
        loading = current.isLoading;
    
    return loading;
}

start
{
    bool startedInduction;

    if (version == "srt")
        startedInduction = current.timer > 0 && old.timer != current.timer;

    else
        startedInduction = current.levelID == 1 && current.levelID != old.levelID;
    
    return startedInduction;
}

reset
{
    bool inMainMenu;
    bool enteredInduction;

    if (version == "srt")
    {
        // pos = [0.04, 1, -10] in main menu
        inMainMenu =
               current.xPos == old.xPos && current.xPos == 0x3D23D70A
            && current.yPos == old.yPos && current.yPos == 0x3F800000
            && current.zPos == old.zPos && current.zPos == 0xC1200000;

        enteredInduction = old.timer != current.timer
            && (current.timer < old.timer || old.timer == 0);
    }
    else
    {
        inMainMenu = false;
        enteredInduction = current.levelID == 1 && current.levelID != old.levelID;
    }

    return inMainMenu || enteredInduction;
}

split
{
    bool enteredNextLevel;
    bool finalAlarmClicked;

    if (version == "srt")
    {
        // pos = [0, 0, 0] during loading screens
        enteredNextLevel = old.timer == current.timer
            && current.xPos != old.xPos && current.xPos == 0
            && current.yPos != old.yPos && current.yPos == 0
            && current.zPos != old.zPos && current.zPos == 0;

        finalAlarmClicked = timer.CurrentSplitIndex == 8 && current.alarmStopped;
    }
    else
    {
        enteredNextLevel = !current.isLoading
            && current.levelID != old.levelID
            && current.levelID != 255;

        finalAlarmClicked = !current.isLoading
            && current.levelID == 9 && current.alarmStopped;
    }

    return enteredNextLevel || finalAlarmClicked;
}
