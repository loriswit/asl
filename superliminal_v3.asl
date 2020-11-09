state("Superliminal") {
	// These are based off of offsets, but Hot Coffee just uses them directly.
	byte levelID : 0xB00B1E5;
	bool isLoading : 0xB00B1E6;

	bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0xE8, 0x28, 0x80, 0x18;
}

state("SuperliminalSteam") {
	byte levelID : 0xB00B1E5;
	bool isLoading : 0xB00B1E6;

	bool alarmStopped : "fmodstudio.dll", 0x2b3cf0, 0x28, 0x18, 0x170, 0xE8, 0x28, 0x80, 0x18;
}

startup {
	print("hot coffee v3");
}

isLoading {
	return current.isLoading;
}

update {
	current.levelID = memory.ReadValue<byte>(new IntPtr(0xB00B1E5));
	current.isLoading = memory.ReadValue<bool>(new IntPtr(0xB00B1E6));
}

start {
	return current.levelID == 1 && current.levelID != old.levelID;
}

reset {
	return current.levelID == 1 && current.levelID != old.levelID;
}

split {
	if(current.isLoading)
		return false;

	if (current.levelID == 9 && current.alarmStopped)
		return true;

	return current.levelID != old.levelID && current.levelID != 255;
}
