-------------------
-- Exports
-------------------
MenuAPI = exports.MenuAPI
-------------------
-- variables for arcade and time left
-------------------
gotTicket = false
usingComputer = false

minutes = 0
seconds = 0
-------------------
function doesPlayerHaveTicket()
    return gotTicket
end

exports('doesPlayerHaveTicket', doesPlayerHaveTicket)

--count time
function TimerThread()
    while true do
        Citizen.Wait(1000)
        if gotTicket then
            if hasPlayerRunOutOfTime() then
                showNotification(_U("ticket_expired"))
                gotTicket = false
                TriggerEvent('d3-arcade:exit')                
            end

            countTime()
            displayTime()
        end
    end
end

local retrocomputer = {
    isInGamingHouse = true,
    computerType = Config.RetroMachine,
    computerGPU = Config.GPUList[2],
    computerCPU = Config.CPUList[2],
}
--create npc, blip, marker
Citizen.CreateThread(function()
    if Config.ArcadeModels ~= nil then
        local optionLabel = "Play Arcade"
        if Config.enableGameHouse then
            optionLabel = "Play Arcade for $" .. Config.singleUsePrice
        end
        exports['qb-target']:AddTargetModel(Config.ArcadeModels, {
            options = {
                {
                    type = "server",
                    event = "d3-arcade:singleUse",
                    icon = "fas fa-gamepad",
                    label = optionLabel,
                    canInteract = function() return not gotTicket end
                },
                {
                    icon = "fas fa-gamepad",
                    label = "Play Arcade (Ticket)",
                    action = function() openComputerMenu(retrocomputer.computerType, retrocomputer) end,
                    canInteract = function() return gotTicket end,
                },
            },
            distance = 2.5,
        })
    end
    for k, v in pairs(Config.Arcade) do
        local npcId = "ComputerNPC-" .. k
        exports['qb-target']:AddBoxZone(npcId, v.NPC.position, 1, 1, {
            name = npcId,
            heading = v.NPC.heading,
            debugPoly = false,
            minZ = v.NPC.position.z,
            maxZ = v.NPC.position.z + 2,
        }, {
            options = {
                {
                    action = playerBuyTicketMenu,
                    canInteract = function() return Config.enableGameHouse and not gotTicket end,
                    icon = "fas fa-dollar-sign",
                    label = "Buy Ticket",
                },
                {
                    action = returnTicketMenu,
                    canInteract = function() return Config.enableGameHouse and gotTicket end,
                    icon = "fas fa-dollar-sign",
                    label = "Return Ticket",
                },
            },
            distance = 2.5
        })

        if v.blip and v.blip.enable then
            createBlip(v.blip.name, v.blip.blipId, v.blip.position, v.blip)
        end

        createLocalPed(4, v.NPC.model, v.NPC.position, v.NPC.heading, function(ped)
            SetEntityAsMissionEntity(ped)
            SetBlockingOfNonTemporaryEvents(ped, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
        end)
    end
end)

--create targets for computers
Citizen.CreateThread(function()
    for k, v in pairs(Config.computerList) do
        local computerName = "Computer-" .. k
        exports['qb-target']:AddBoxZone(computerName, v.position, 1, 1, {
            name = computerName,
            debugPoly = false,
            minZ = v.position.z - 1.5,
            maxZ = v.position.z + 1,
        }, {
            options = {
                {
                    action = function() openComputerMenu(v.computerType, v) end,
                    canInteract = function() return not v.isInGamingHouse or not Config.enableGameHouse or gotTicket end,
                    icon = "fas fa-gamepad",
                    label = "Play Games",
                },
            },
            distance = 2.5
        })
    end
end)

RegisterNetEvent('qb-pokearcade:check:ticket', function(computer)
    openComputerMenu(computer.computerType, computer)
end) 
