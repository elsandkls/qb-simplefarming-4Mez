--- Useable Items

QBCore.Functions.CreateUseableItem(Config.Inventory['Lime'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['LimeJuice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
   
QBCore.Functions.CreateUseableItem(Config.Inventory['LimePieSlice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:limescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lime'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:limejuicecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lime'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:limepiecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lime'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
------------------------------- Lime Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:limepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Lime'].db_obj, amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lime_pickingfront'] ..amount.. Config.Alerts['lime_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:limeprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local lime = Player.Functions.GetItemByName(Config.Inventory['Lime'].db_obj)
    if not lime then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_limeprocessor'])
        return false
    end

    local amount = lime.amount
    if amount >= 1 then
        amount = Config.LimeProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Lime'].db_obj, amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Lime'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lime_processing'])
    print(Config.Alerts['lime_processing'])
    local LimeJuice = Config.LimeJuice
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['LimeJuice'].db_obj, LimeJuice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['LimeJuice'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lime_trader'])
end)
 