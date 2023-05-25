# QBCore POKEArcade System

### HEAVYILY BASED ON RCORE_ARCADE AND GABZ_ARCADE, d3_ARCADE AND OTHER QB-CORE ARCADE SYSTEMS FORMATTED INTO A POKEMON ARCADE with bonus PACMAN+UNO FOR MY FRIEND @GRANNY <3


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

## CPU/GPU, what do they do?

## the cpu determines how long the initial loading bar lasts
## the gpu determines the resolution of the screen
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

# EXTRA INFO ON THE #LUA TABLE

```
Config.Locale: Specifies the translation/locale to be used (set to "en" for English).
Config.keyToOpenTicketMenu and Config.keyToOpenComputer: Define the key bindings to open the ticket menu and computer, respectively.
Config.Arcade: Contains information about the arcade house, including the position, heading, and model of the NPC and the blip settings.
Config.singleUsePrice: Specifies the price for single-use items.
Config.ArcadeModels: Defines a list of arcade machine model hashes.
Config.ticketPrice: Sets the prices and times for different ticket types (bronze, silver, and gold).
Config.enableGameHouse: Determines if the arcade is paid or not.
Config.GPUList and Config.CPUList: Lists of GPU and CPU options for the arcade machines.
Config.RetroMachine: Contains information about retro arcade machines, including their names, links to ROMs, and save file settings.
Config.SaveFileDirectory: Specifies the directory where save files are stored.
GetSaveFilePath, DoesSaveFileExist, SaveGame, LoadGame, and DeleteSaveFile: Helper functions to manage save files for the arcade games.
Config.SuperMachine: A combination of all the different types of arcade machines (retro, gaming, sports, and arcade).
Config.computerList: Defines the list of computer positions in the world, including their types, GPU and CPU specifications, and seat hashes.


OTHERS: 
Ensure that you have imported the required language file or defined the _U function used for localization in the Config table.

Make sure that you have defined the following machine types: Config.GamingMachine, Config.SportsMachine, and Config.ArcadeMachine. These configurations are missing from the provided code.

Double-check that you have set the correct IDs for each game in the Config.RetroMachine table. The id values should be unique for each game.

Verify that you have specified the correct path to the save file directory in the Config.SaveFileDirectory variable. This path should point to the directory where you want to store the save files.

Confirm that you have defined the functions GetSaveFilePath, DoesSaveFileExist, SaveGame, LoadGame, and DeleteSaveFile correctly. These functions are used for managing save files and require proper implementation.

Ensure that you have defined the machine types for the super computers in the Config.SuperMachine table. It seems that you are trying to combine all machine types, so make sure you have defined the appropriate tables before populating Config.SuperMachine.

Check the Config.computerList table and make sure you have defined the correct values for each computer. Verify that the isInGamingHouse flag is set correctly for each computer, and ensure that the computerType, computerGPU, and computerCPU values are valid.
```

# ADD PVP BATTLELINK TO YOUR QB-CORE SERVER (WIP)

> 1. Add a new configuration option to enable or disable PvP battles:
 ```lua
-- Configurable option to enable PvP battles
Config.enablePvP = true
```
> 2. Create a new server-side event for handling PvP battles:
```lua
RegisterServerEvent('qb-arcade:pvpBattle')
AddEventHandler('qb-arcade:pvpBattle', function(opponentId)
    -- Validate the opponent ID and initiate the battle logic
    -- Perform necessary checks and calculations for the battle
    -- Send battle results to the players involved
    -- Update player statistics, experience, etc.
end)
```
> 3. Modify the client-side script to include a function for initiating PvP battles:
```lua
function InitiatePvPBattle(opponentId)
    -- Trigger the server event to initiate the battle
    TriggerServerEvent('qb-arcade:pvpBattle', opponentId)
end
```
> 4. Update the HTML/JavaScript interface for the Pokemon games to include a PvP battle button or UI element. When the button is clicked, call the InitiatePvPBattle function and pass the opponent's ID as a parameter.

> 5. In the server-side event handler for qb-arcade:pvpBattle, implement the necessary logic for the PvP battle. This can include validating the players' Pokemon teams, calculating battle outcomes based on moves and stats, updating player statistics, etc. You may need to leverage existing libraries or implement your own battle system depending on the complexity of the PvP battles you want to support.

### Remember to test and iterate on your implementation to ensure it works as expected and handles various scenarios, such as invalid inputs, synchronization, and fairness in battles.
> Note: The code provided above assumes you are using the QB-Arcade script as a base and have the necessary knowledge and understanding of Lua, JavaScript, and FiveM development to implement the PvP battle feature effectively. I will eventually finish writing a full incorporated PVP battle function script once I figure out how to do it more client-server side than networkprotocol sided.

