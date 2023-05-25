function showSubtitle(message, time)
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(time, 1)
end

function playerBuyTicketMenu()
    local elements = {}
    local index = 0
    local ticketMenu = MenuAPI:CreateMenu("ticket_menu")

    ticketMenu.SetMenuTitle(_U("ticket_menu"))

    ticketMenu.SetProperties({
        float = "right",
        position = "middle",
    })

    for k, v in pairs(Config.ticketPrice) do
        index = index + 1
        ticketMenu.AddItem(index, _U("ticket_label", k) .. " <span style='color: green;'>$" .. v.price .. "</span>", function()
            TriggerServerEvent("qb-pokearcade:buyTicket", k)
            ticketMenu.Destroy()
        end)
    end

    ticketMenu.On("selectitem", function(index)
    end)

    ticketMenu.On("close", function()
    end)

    ticketMenu.Open()
end

function returnTicketMenu()
    local returnMenu = MenuAPI:CreateMenu("returnMenu")

    returnMenu.SetMenuTitle(_U("give_back_ticket"))

    returnMenu.SetProperties({
        float = "right",
        position = "middle",
    })

    returnMenu.AddItem(1, _U("yes"), function()
        minutes = 0
        seconds = 0
        gotTicket = false
        returnMenu.Close()
    end)

    returnMenu.AddItem(2, _U("no"), function()
        returnMenu.Close()
    end)

    returnMenu.Open()
end

function showNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

function createBlip(name, blip, coords, options)
    local x, y, z = table.unpack(coords)
    local ourBlip = AddBlipForCoord(x, y, z)
    SetBlipSprite(ourBlip, blip)
    if options.type then SetBlipDisplay(ourBlip, options.type) end
    if options.scale then SetBlipScale(ourBlip, options.scale) end
    if options.color then SetBlipColour(ourBlip, options.color) end
    if options.shortRange then SetBlipAsShortRange(ourBlip, options.shortRange) end
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(ourBlip)
    return ourBlip
end

function createLocalPed(pedType, model, position, heading, cb)
    requestModel(model, function()
        local ped = CreatePed(pedType, model, position.x, position.y, position.z, heading, false, false)
        SetPedComponentVariation(ped, 0, 0, 0, 0)
        SetPedComponentVariation(ped, 1, 0, 0, 0)
        SetPedComponentVariation(ped, 2, 0, 0, 0)
        SetPedComponentVariation(ped, 3, 0, 0, 0)
        SetPedComponentVariation(ped, 4, 0, 0, 0)
        SetPedComponentVariation(ped, 5, 0, 0, 0)
        SetPedComponentVariation(ped, 6, 0, 0, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 0, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 10, 0, 0, 0)
        SetPedComponentVariation(ped, 11, 0, 0, 0)
        SetPedPropIndex(ped, 0, 1, 0, true)
        SetModelAsNoLongerNeeded(model)
        cb(ped)
    end)
end

function requestModel(modelName, cb)
    if type(modelName) ~= 'number' then
        modelName = GetHashKey(modelName)
    end

    local breaker = 0

    RequestModel(modelName)

    while not HasModelLoaded(modelName) do
        Citizen.Wait(1)
        breaker = breaker + 1
        if breaker >= 100 then
            break
        end
    end

    if breaker >= 100 then
        cb(false)
    else
        cb(true)
    end
end

function openComputerMenu(listGames, computer_)
    local computer = computer_
    local index = 0
    if Config.enableGameHouse and not gotTicket and computer.isInGamingHouse then
        showNotification(_U("need_to_buy_ticket"))
        return
    end
    local gameMenu = MenuAPI:CreateMenu("gamelist")

    gameMenu.SetMenuTitle(_U("computer_menu"))

    gameMenu.SetProperties({
        float = "right",
        position = "middle",
    })

    for key, value in pairs(listGames) do
        index = index + 1
        print(index, value.name)
        gameMenu.AddItem(index, value.name, function()
            gameMenu.Close()
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local rot = GetEntityRotation(ped)
            local closestDistance = 6
            local closestPos = nil
            local closestObj = nil
            if computer.seatHash ~= nil then
                local obj = GetClosestObjectOfType(pos.x, pos.y, pos.z, 10.0, computer.seatHash, false, true, true)
                if obj ~= nil and obj ~= 0 then
                    local objPos = GetEntityCoords(obj)
                    closestPos = objPos
                    closestObj = obj
                    local dict = "amb@prop_human_seat_computer@male@base"
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do 
                        Citizen.Wait(100)
                    end
                    local rotation = GetEntityRotation(closestObj)
                    local targetPos = closestPos + vector3(0,0, 0.5)
                    DisableCamCollisionForEntity(closestObj)
                    FreezeEntityPosition(ped, true)
                    TaskPlayAnimAdvanced(ped, dict, "base", targetPos.x, targetPos.y, targetPos.z, rotation.x, rotation.y, rotation.z + 180, 1.0, 1.0, -1, 1, 0.0, 0, 0)
                    Wait(3000)
                end
            else
                local closestHash = nil
                for i = 1, #Config.ArcadeModels do
                    local hash = Config.ArcadeModels[i]
                    local obj = GetClosestObjectOfType(pos.x, pos.y, pos.z, 10.0, hash, false, true, true)
                    if obj ~= nil and obj ~= 0 then
                        local objPos = GetEntityCoords(obj)
                        local distance = Absf(#(objPos - pos))
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPos = objPos
                            closestObj = obj
                            closestHash = hash
                        end
                    end
                end
                if closestObj ~= nil then
                    local dict = "anim_casino_a@amb@casino@games@arcadecabinet@maleright"
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do 
                        Citizen.Wait(100)
                    end
                    local heading = GetEntityHeading(closestObj)
                    local forward, right, _, _ = GetEntityMatrix(closestObj)
                    local targetPos = closestPos + (forward * - 0.8) + (right * - 0.01)
                    if closestHash == -1991361770 then -- (qub3d machine) 2 joysticks instead of 1...
                        targetPos = targetPos + (right * - 0.18)
                    end
                    local sequence = OpenSequenceTask()
                    TaskPedSlideToCoord(0, targetPos.x, targetPos.y, targetPos.z, heading, 1.0)
                    TaskPlayAnim(0, dict, "insert_coins", 8.0, 8.0, -1, 0, 0, false, false, false)
                    TaskPlayAnim(0, dict, "playidle_v2", 8.0, 8.0, -1, 1, 0, false, false, false)
                    CloseSequenceTask(sequence)
                    TaskPerformSequence(ped, sequence)
                    ClearSequenceTask(sequence)
                    Wait(GetAnimDuration(dict, "insert_coins") * 1000)
                end
            end
            usingComputer = true
            CreateThread(function()
                while usingComputer do
                        -- disable all controls while in game
                        -- prevents gamepads from controlling gta character
                        Wait(0)   
                        DisableAllControlActions(0)
                        DisableAllControlActions(1)
                        DisableAllControlActions(2)
                end
            end)
            SendNUIMessage({
                type = "on",
                game = value.link,
                gpu = computer.computerGPU,
                cpu = computer.computerCPU
            })
            SetNuiFocus(true, true)
        end)
    end

    gameMenu.Open()
end

function hasPlayerRunOutOfTime()
    return (minutes == 0 and seconds <= 1)
end

function countTime()
    seconds = seconds - 1
    if seconds == 0 then
        seconds = 59
        minutes = minutes - 1
    end

    if minutes == -1 then
        minutes = 0
        seconds = 0
    end
end

function displayTime()
    showSubtitle(_U("time_left_count", minutes, seconds), 1001)
end
