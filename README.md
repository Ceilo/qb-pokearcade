# QBCore POKEArcade System

### HEAVYILY BASED ON RCORE_ARCADE AND GABZ_ARCADE, AND OTHER QB-CORE ARCADE SYSTEMS FORMATTED INTO A POKEMON ARCADE FOR MY FRIEND @GRANNY <3


![https://preview.redd.it/6k6qpepzgv671.jpg?width=1080&crop=smart&auto=webp&v=enabled&s=cc402d20d51376c3c80f502c5b48a93abdf17aa3](https://preview.redd.it/6k6qpepzgv671.jpg?width=1080&crop=smart&auto=webp&v=enabled&s=cc402d20d51376c3c80f502c5b48a93abdf17aa3)

This custom script features small upgrades and framework dependent changes to improve on the original rcore_arcade/gabz_arcade etc

The emulatorjs integration has been PRd to the original rcore_arcade! I will strive to add to the original wherever possible, however, this is a QBCore specific resource which means some if not most of the incoming changes will not work with the original, which is developed as a standalone/esx script.

I'll add some documentation of the config, however it's pretty straight forward.

There are 3 types of machines, RetroMachine, GamingMachine and SuperMachine. the above mentioned values correspond to lists of games, where supermachine is an aggregate (combination of) RetroMachine and GamingMachine. There are comments on the config on how to add new games, but it boils down to selecting a page (dos or ejs), and filling the appropiate query parameters:

DOSBOX: 
```
    {
        -- this is the name in the menu/ game list
        name = "Duke Nukem 3D", 
        -- link to msdos page, link to rom, and executable (in this zip, there is an EXE called DUKE3D which starts the game. This may be a BAT in some cases)
        link = string.format("nui://d3-arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/duke3d.zip", "./DUKE3D.EXE"),
    }
```

EJS: 

    {
        -- this is the name in the menu/ game list
        name = "Contra III",
        -- link to ejs page, link to rom, core, uniquename, and unique id (for net play)
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/super-nintendo/Contra%20III%20-%20The%20Alien%20Wars%20(U)%20[!].zip", "snes", "Contraiii-snes", "4205"),
    }

CPU/GPU, what do they do?

the cpu determines how long the initial loading bar lasts
the gpu determines the resolution of the screen
```
TODO:

 QB-Target integration to allow all arcade machines to work
 Freeze Player to allow gamepad use without punching and moving in GTA
 Add some animations to show player is using arcade machine / computer

ENABLE BATTLE LINK OPTION BETWEEN ARCADE MACHINES FOR PVP 
```
```
KNOWN ISSUES:

UI button to load state will softlock the game requiring an F8 quit.
Gamepad controls character in GTA and emulator at the same time.
```
```
MISC:

/testgames opens a "super computer" with all games for testing purposes, restricted to admins.
```
```
Dependencies

QB-Target
[https://github.com/d3st1nyh4x/MenuAPI] (fork fixed for large lists)
```

> These are various versions of qb-arcade, rcore_arcade and gabz_arcade mashed into a  #qb-pokearcade for my friend @GRANNY - I AM NEW TO MAKING SCRIPTS SO IF ITS FKED UP PLS FIX IT <3**

## This script allows you to create an arcade in your FiveM GTA server using the QBcore framework. Players can interact with the arcade machines and play different games.

Features:
- Create arcade games with customizable positions, rotations, and game data
- Support for DOS games and emulator games
- Trigger events for playing specific games

Installation:
1. Copy the "qb-pokearcade" folder into your FIVEM's Servers resources directory.
2. Add "start qb-arcade" to your server.cfg file to ensure the script starts when the server launches.

Usage:
1. Customize the arcade games by editing the "arcadeGames" table in the `locales.lua` file.
2. Specify the model, position, rotation, and game data for each arcade game. You can add more arcade games by following the provided examples.
3. Run your FiveM server and ensure the `qb-pokearcade` resource is started.
4. Players can interact with the arcade games by approaching them and pressing the context key (default: E).
5. Implement your desired functionality for each game by handling the corresponding events in the script.

Notes:
- Ensure that the required game files (DOS executables or emulator ROMs) are placed in the appropriate location.
- Make sure that the necessary dependencies (such as the QBcore framework) are properly installed and set up in your server environment.

Credits:
This script was created by [KEYS] and is based on the QBcore framework.

For any issues or questions, please contact me via DISCORD $²#6666.

Enjoy the arcade gaming experience in your FiveM GTA server!

