--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['Tomatoes'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['Tomatoes'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- Tomatoes
RegisterServerEvent('qb-simplefarming:tomatoespicking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local tompicking = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Tomatoes'].db_obj, tompicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomato'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..tompicking.. Config.Alerts['tomatoes_color'])
end)    

RegisterServerEvent('qb-simplefarming:tomatoesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local tomatoe = Player.Functions.GetItemByName(Config.Inventory['Tomatoes'].db_obj)
    if not tomatoe then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_tomatoes'])
        return false
    end

    local amount = tomatoe.amount
    if amount >= 1 then
        amount = Config.TomatoesProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Tomatoes'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Tomatoes'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['tomatoes_processing'])
    local tomatoe = Config.TomatoesProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['TomatoPaste'].db_obj, tomatoe)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['TomatoPaste'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['tomatoes_processed'])
end)


QBCore.Functions.CreateCallback('qb-simplefarming:tomatoescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Tomatoes'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

--- note to self not sure about 
-- QBCore.Shared.Items['tomatopaste']
-- QBCore.Shared.Items['tomato']
-- can I replace them with _ ???
-- Config.Inventory['Tomatoes'].db_obj
-- Config.Inventory['TomatoPaste'].db_obj
-- question answered in server.lua, yes I can.
-- little harder to read, but you don't have to edit this file anymore, just edit the config file.