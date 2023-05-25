Config = {}

-- Which translation you wish to use ?
Config.Locale = "en"

-- Key settings
Config.keyToOpenTicketMenu = "E"
Config.keyToOpenComputer = "E"

-- Marker for buying ticket
Config.Arcade = {
    {
        NPC = {
            position = vector3(-1083.19, -245.78, 36.75),
            heading = 205.11,
            model = "ig_claypain",
        },
        blip = {
            position = vector3(-1082.12, -247.57, 36.8),
            blipId = 521,
            scale = 1.0,
            color = 0,
            name = "Arcade house",
            shortRange = true,
            enable = true,
        },
    },
}

-- "single use" prices to be used on non-gamehouse machines (e.g., props in houses, etc., via qb-target. check readme.md)
Config.singleUsePrice = 500

-- Arcade machine model hashes
Config.ArcadeModels = {
    815879628,
    1301167921,
    -1502319666,
    1876055757,
    -1501557515,
    568464183,
    -395173800,
    -88750881,
    -538006270,
    398786301,
    -1991361770,
}

-- Ticket price and time in arcade.
Config.ticketPrice = {
    [_U("bronze")] = {
        price = 2000,
        time = 30, -- in minutes
    },
    [_U("silver")] = {
        price = 2500,
        time = 60, -- in minutes
    },
    [_U("gold")] = {
        price = 5000,
        time = 120, -- in minutes
    },
}

-- Is arcade paid?
Config.enableGameHouse = true

-- Do not change unless you know what you're doing
Config.GPUList = {
    [1] = "ETX2080",
    [2] = "ETX1050",
    [3] = "ETX660",
}

-- Do not change unless you know what you're doing
Config.CPUList = {
    [1] = "U9_9900",
    [2] = "U7_8700",
    [3] = "U3_6300",
    [4] = "BENTIUM",
}

Config.RetroMachine = {
    {
        name = "Pokemon Red",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Red%20Version%20(U)%20(V1.1)%20[C][!].zip", "gbc", "PokemonRed-gbc", "4201"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Blue",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Blue%20Version%20(U)%20(V1.1)%20[C][!].zip", "gbc", "PokemonBlue-gbc", "4202"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Yellow",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Yellow%20Version%20(U)%20[V1.1].zip", "gbc", "PokemonYellow-gbc", "4203"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Gold",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Gold%20Version%20(U)%20(V1.1)%20[S].zip", "gbc", "PokemonGold-gbc", "4204"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Silver",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Silver%20Version%20(U)%20(V1.1)%20[S].zip", "gbc", "PokemonSilver-gbc", "4205"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Crystal",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Crystal%20Version%20(V1.1)%20(U)%20[C][!].zip", "gbc", "PokemonCrystal-gbc", "4206"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Ruby",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-advance/Pokemon%20-%20Ruby%20Version%20(V1.1)%20(U)%20[M].zip", "gba", "PokemonRuby-gba", "4207"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Sapphire",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-advance/Pokemon%20-%20Sapphire%20Version%20(V1.1)%20(U)%20[M].zip", "gba", "PokemonSapphire-gba", "4208"),
        saveEnabled = true,
    },
    {
        name = "Pokemon Emerald",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-advance/Pokemon%20-%20Emerald%20Version%20(U)%20[Xenophobia].zip", "gba", "PokemonEmerald-gba", "4209"),
        saveEnabled = true,
    },
    {
        name = "Pokemon FireRed",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-advance/Pokemon%20-%20FireRed%20Version%20(U)%20(V1.1)%20[C][!].zip", "gba", "PokemonFireRed-gba", "4210"),
        saveEnabled = true,
    },
    {
        name = "Pokemon LeafGreen",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-advance/Pokemon%20-%20LeafGreen%20Version%20(U)%20(V1.1)%20[C][!].zip", "gba", "PokemonLeafGreen-gba", "4211"),
        saveEnabled = true,
    },
}

-- Computer list in the world
Config.computerList = {
    -- Gaming computers
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1063.7, -246.7, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1060.2, -244.85, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1055.7, -246.12, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1053.96, -241.8, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1056.14, -243.42, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1050.76, -240.9, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1050.03, -243.51, 44.5),
        seatHash = 536071214,
    },
    {
        isInGamingHouse = true, -- If false, players don't need a ticket to play on this computer.
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1062.44, -248.98, 44.5),
        seatHash = 536071214,
    },
}

