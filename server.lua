QBCore = exports['qb-core']:GetCoreObject()

local supercomputer = {
    isInGamingHouse = false,
    computerType = Config.SuperMachine,
    computerGPU = Config.GPUList[1],
    computerCPU = Config.CPUList[1],
}
local retrocomputer = {
    isInGamingHouse = false,
    computerType = Config.RetroMachine,
    computerGPU = Config.GPUList[2],
    computerCPU = Config.CPUList[2],
}

QBCore.Commands.Add('testgames', 'Opens an arcade supercomputer for testing purposes', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-pokearcade:check:ticket', src, supercomputer)
end, 'admin')

RegisterNetEvent('qb-pokearcade:singleUse', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local price = Config.singleUsePrice
    if not Config.enableGameHouse or Player.Functions.RemoveMoney("cash", price, "arcade") then
        TriggerClientEvent('qb-pokearcade:check:ticket', src, retrocomputer)
    else
        TriggerClientEvent("qb-pokearcade:nomoney", source);
    end
end)

RegisterNetEvent("qb-pokearcade:buyTicket")
AddEventHandler("qb-pokearcade:buyTicket", function(ticket)
    local data = Config.ticketPrice[ticket]
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveMoney("cash", data.price, "arcade") then
        TriggerClientEvent("qb-pokearcade:ticketResult", source, ticket);
    else
        TriggerClientEvent("qb-pokearcade:nomoney", source);
    end
end)
