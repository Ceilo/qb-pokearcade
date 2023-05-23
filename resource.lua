-- Define arcade games with their positions, rotations, and game data
local arcadeGames = {
    {
        model = "prop_arcade_01",
        position = vector3(123.456, 456.789, 78.9),
        rotation = vector3(0.0, 0.0, 180.0),
        gameData = {
            gameType = "dos",
            gameFile = "game1.exe"
        }
    },
    {
        model = "prop_arcade_02",
        position = vector3(234.567, 567.890, 98.7),
        rotation = vector3(0.0, 0.0, 270.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_red.gbc"
        }
    },
    {
        model = "prop_arcade_03",
        position = vector3(345.678, 678.901, 108.0),
        rotation = vector3(0.0, 0.0, 90.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_crystal.gbc"
        }
    },
    {
        model = "prop_arcade_04",
        position = vector3(456.789, 789.012, 117.3),
        rotation = vector3(0.0, 0.0, 0.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_ruby.gba"
        }
    },
    {
        model = "prop_arcade_05",
        position = vector3(567.890, 890.123, 126.6),
        rotation = vector3(0.0, 0.0, 45.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_sapphire.gba"
        }
    },
    {
        model = "prop_arcade_06",
        position = vector3(678.901, 901.234, 135.9),
        rotation = vector3(0.0, 0.0, 135.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_emerald.gba"
        }
    },
    {
        model = "prop_arcade_07",
        position = vector3(789.012, 912.345, 145.2),
        rotation = vector3(0.0, 0.0, 225.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_firered.gba"
        }
    },
    {
        model = "prop_arcade_08",
        position = vector3(890.123, 923.456, 154.5),
        rotation = vector3(0.0, 0.0, 315.0),
        gameData = {
            gameType = "emulator",
            gameFile = "pokemon_leafgreen.gba"
        }
    },
    -- Add more arcade games here as needed
}

-- Function to create arcade games
function CreateArcadeGames()
    for _, game in ipairs(arcadeGames) do
        local model = GetHashKey(game.model)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(10)
        end

        local arcadeGame = CreateObject(model, game.position, false, false, false)
