RegisterNetEvent("qb-pokearcade:ticketResult")
AddEventHandler("qb-pokearcade:ticketResult", function(ticket)
    showNotification(_U("bought_ticket", ticket, Config.ticketPrice[ticket].time))

    -- Will set time player can be in arcade from Config
    seconds = 1
    minutes = Config.ticketPrice[ticket].time

    -- Tell the script that player has Ticket and can enter.
    gotTicket = true
    CreateThread(TimerThread)
end)

RegisterNetEvent("qb-pokearcade:nomoney")
AddEventHandler("qb-pokearcade:nomoney", function()
    showNotification(_U("not_enough_money"))
end)

RegisterNetEvent('qb-pokearcade:exit', function()
    if usingComputer then
        SendNUIMessage({
            type = "off",
            game = "",
        })
        SetNuiFocus(false, false)
        local ped = PlayerPedId()
        EnableAllControlActions(0)
        EnableAllControlActions(1)
        EnableAllControlActions(2)
        FreezeEntityPosition(ped, false)
        ClearPedTasks(ped)
        usingComputer = false
    end
end)

RegisterNUICallback('exit', function()
    TriggerEvent('qb-pokearcade:exit')
end)
