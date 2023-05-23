# qb-pokearcade

This script allows you to create an arcade in your FiveM GTA server using the QBcore framework. Players can interact with the arcade machines and play different games.

Features:
- Create arcade games with customizable positions, rotations, and game data
- Support for DOS games and emulator games
- Trigger events for playing specific games

Installation:
1. Copy the "qb-arcade" folder into your FiveM server's resources directory.
2. Add "start qb-arcade" to your server.cfg file to ensure the script starts when the server launches.

Usage:
1. Customize the arcade games by editing the "arcadeGames" table in the `client.lua` file.
2. Specify the model, position, rotation, and game data for each arcade game. You can add more arcade games by following the provided examples.
3. Run your FiveM server and ensure the `qb-arcade` resource is started.
4. Players can interact with the arcade games by approaching them and pressing the context key (default: E).
5. Implement your desired functionality for each game by handling the corresponding events in the script.

Notes:
- Ensure that the required game files (DOS executables or emulator ROMs) are placed in the appropriate location.
- Make sure that the necessary dependencies (such as the QBcore framework) are properly installed and set up in your server environment.

Credits:
This script was created by [KEYS] and is based on the QBcore framework.

For any issues or questions, please contact me via DISCORD $²#6666.

Enjoy the arcade gaming experience in your FiveM GTA server!

