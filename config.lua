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

-- "single use" prices to be used on non gamehouse machines (e,g props in houses, etc, via qb-target. check readme.md)
Config.singleUsePrice = 500
-- arcade machine model hashes
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
-- ticket price, and time in arcade.
Config.ticketPrice = {
    [_U("bronz")] = {
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

-- is arcade payed ?
Config.enableGameHouse = true
-- do not change unless you know what you're doing
Config.GPUList = {
    [1] = "ETX2080",
    [2] = "ETX1050",
    [3] = "ETX660",
}

-- do not change unless you know what you're doing
Config.CPUList = {
    [1] = "U9_9900",
    [2] = "U7_8700",
    [3] = "U3_6300",
    [4] = "BENTIUM",
}

Config.MyList = {
    {
        name = "name",
        link = "bleh",
    },
}

-- game list for retro machine
   -- emulatorjs powers this second page, it takes in a rom url, a "core" type (eg nes, snes, etc) a game name, and an id for network play (yep! some cores support network play!)
    -- for more info see : 
    -- https://github.com/ethanaobrien/emulatorjs/tree/main/docs
Config.RetroMachine = {
    {
        name = "Pokemon Red",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Red%20Version%20(U)%20(V1.1)%20[C][!].zip", "gbc", "PokemonRed-gbc", "4201"),
    },
    {
        name = "Pokemon Blue",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Blue%20Version%20(U)%20(V1.1)%20[C][!].zip", "gbc", "PokemonBlue-gbc", "4202"),
    },
    {
        name = "Pokemon Yellow",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Yellow%20Version%20(U)%20[V1.1].zip", "gbc", "PokemonYellow-gbc", "4203"),
    },
    {
        name = "Pokemon Gold",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Gold%20Version%20(U)%20(V1.1)%20[S].zip", "gbc", "PokemonGold-gbc", "4204"),
    },
    {
        name = "Pokemon Silver",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Silver%20Version%20(U)%20(V1.1)%20[S].zip", "gbc", "PokemonSilver-gbc", "4205"),
    },
    {
        name = "Pokemon Crystal",
        link = string.format("nui://d3-arcade/html/ejs.html?url=%s&params=%s&name=%s&id=%s", "https://static.emulatorgames.net/roms/gameboy-color/Pokemon%20-%20Crystal%20Version%20(V1.1)%20(U)%20[C][!].zip", "gbc", "PokemonCrystal-gbc", "4206"),
    },
}

--game list for super computers
Config.SuperMachine = {}

for i = 1, #Config.RetroMachine do
    table.insert(Config.SuperMachine, Config.RetroMachine[i])
end

for i = 1, #Config.GamingMachine do
    table.insert(Config.SuperMachine, Config.GamingMachine[i])
end

-- computer list in world
Config.computerList = {
    -- Gaming computers
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1063.7, -246.7, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1060.2, -244.85, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1055.7, -246.12, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1053.96, -241.8, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1056.14, -243.42, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1050.76, -240.9, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1050.03, -243.51, 44.5),
        seatHash = 536071214,
    },
    {
        -- if false player dont need a ticket to play on this computer.
        isInGamingHouse = true,
        computerType = Config.GamingMachine,
        computerGPU = Config.GPUList[2],
        computerCPU = Config.CPUList[2],
        position = vector3(-1062.44, -248.98, 44.5),
        seatHash = 536071214,
    },
}
