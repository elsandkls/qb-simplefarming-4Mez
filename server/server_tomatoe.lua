

--- Useable Items


QBCore.Functions.CreateUseableItem("tomato", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tomatopaste", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- Tomatoes

RegisterServerEvent('qb-simplefarming:tomatoespicking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local tompicking = math.random(1,3)
    Player.Functions.AddItem('tomato', tompicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomato'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..tompicking.. " Red Tomatoes")
end)

RegisterServerEvent('qb-simplefarming:tomatoesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local tom = Player.Functions.GetItemByName('tomato')
    if not tom then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_tomatoes'])
        return false
    end

    local amount = tom.amount
    if amount >= 1 then
        amount = Config.TomatoesProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('tomato', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomato'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['tomatoes_processing'])
    local Tom = Config.TomatoesProcessed
    Wait(750)
    Player.Functions.AddItem('tomatopaste', Tom)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomatopaste'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['tomatoes_processed'])
end)


QBCore.Functions.CreateCallback('qb-simplefarming:tomatoescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("tomato") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)