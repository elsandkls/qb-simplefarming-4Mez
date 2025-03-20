--- Useable Items

QBCore.Functions.CreateUseableItem(Config.Inventory['Pecan'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
 
------------------------------- Apple Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:pecanpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Pecan'].db_obj, amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pecan_pickingfront'] ..amount.. Config.Alerts['pecan_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:pecanprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pecan = Player.Functions.GetItemByName(Config.Inventory['Pecan'].db_obj)
    if not pecan then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_pecanprocessor'])
        return false
    end

    local amount = pecan.amount
    if amount >= 1 then
        amount = Config.AppleProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Pecan'].db_obj, amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Pecan'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pecan_processing'])
    print(Config.Alerts['pecan_processing'])
    local AppleJuice = Config.AppleJuice
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['PecanHarvest'].db_obj, AppleJuice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PecanHarvest'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pecan_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:pecans', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Pecan'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)



--[[


-- ❓ pecans
    Config.Inventory['Pecan'] = {}
        Config.Inventory['Pecan'].db_obj = "Pecan"
        Config.Inventory['Pecan'].in_game_obj = "Pecan"  
    Config.Inventory['PecanHarvest'] = {}
        Config.Inventory['PecanHarvest'].db_obj = "PecanHarvest"
        Config.Inventory['PecanHarvest'].in_game_obj = "PecanHarvest"  

--]]