# Superliminal Auto-splitter

Here goes some documentation about the auto-splitter.

## Version detection

To detect the running game version, we start by checking the size of the 4th module of the game process (usually UnityPlayer.dll, which reflects the game engine version), then if needed, we also check the size of Assembly-CSharp.dll through the file system.

The game versions are split into **four main groups - 2019, 2020 pre-IGT, 2020, 2021/2**.

### 2019

Compatible game versions:
- 1.0.2019.11.12 (modded)
- 1.0.2019.11.15 (modded)
- (possibly a few other versions)

Condition: the size of UnityPlayer.dll is **25 210 880**

The auto-splitter works by reading the level number and the "is loading" state using specific **static** addresses. This requires the Hot Coffee Mod to be installed in order for the game to write the expected values to these addresses.

### 2020 (Pre-IGT)

Compatible game versions:
- 1.10.2020.7.6

Condition: the size of UnityPlayer.dll is **25 579 520**

The auto-splitter works by reading the level number and the paused state using specific addresses, without requiring the Hot Coffee Mod to be installed. It also uses the x position for starting at the same point as the IGT does in newer versions.

### 2020

Compatible game versions:
- 1.10.2020.11.4
- 1.10.2020.11.11
- 1.10.2020.11.20
- 1.10.2020.11.24
- 1.10.2020.12.03

Condition: the size of UnityPlayer.dll is **25 563 136**

The auto-splitter works by reading from the in-game timer. It splits depending on the position of the player (for example, the player is at position [0, 0, 0] during loading screens).

### 2021

Compatible game versions:
- 1.10.2020.12.10
- 1.10.2021.4.18
- 1.10.2021.4.19
- 1.10.2021.5.10

Conditions: the size of UnityPlayer.dll is neither of the ones above, and the size of Assembly-CSharp.dll must be one of the following:
- **1 831 936** (Steam v1.10.2020.12.10)
- **1 744 384** (Steam v1.10.2021.4.18 & v1.10.2021.5.10)
- **2 381 312** (EGS v1.10.2020.12.10)
- **2 293 760** (EGS v1.10.2021.4.19 & v1.10.2021.5.10)

The auto-splitter works by reading from the in-game timer. It splits by reading the current scene filename.

### 2021 (multiplayer update)

The auto-splitter works the same as above, but the pointers are slightly different.

Compatible game versions:
- 1.10.2021.11.5
- 1.10.2021.11.12
- 1.10.2021.12.16

Conditions: the size of UnityPlayer.dll is neither of the ones above or below, and the size of Assembly-CSharp.dll must be one of the following:
- **1 790 464** (Steam v1.10.2021.11.5)
- **1 799 680** (Steam v1.10.2021.11.12-858.39b)
- **1 800 704** (Steam v1.10.2021.11.12-858.39c)
- **1 830 912** (Steam v1.10.2021.12.16)
- **2 350 080** (EGS v1.10.2021.11.12-858.39b & v1.10.2021.11.12-858.39c)

### 2022

The auto-splitter works the same as above, but the pointers are slightly different.

Compatible game versions:
- 1.10.2022.2.20

Conditions: the size of UnityPlayer.dll is **27 074 560**.
