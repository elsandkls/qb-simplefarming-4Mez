--- Useable Items

QBCore.Functions.CreateUseableItem(Config.Inventory['Lemon'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['LemonJuice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
   
QBCore.Functions.CreateUseableItem(Config.Inventory['LemonPieSlice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:lemonscheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lemon'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:lemonjuicecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lemon'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:lemonpieslicecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lemon'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
------------------------------- Lemon Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:lemonpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Lemon'].db_obj, amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lemon_pickingfront'] ..amount.. Config.Alerts['lemon_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:lemonprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local lemon = Player.Functions.GetItemByName(Config.Inventory['Lemon'].db_obj)
    if not lemon then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_lemonprocessor'])
        return false
    end

    local amount = lemon.amount
    if amount >= 1 then
        amount = Config.LemonProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Lemon'].db_obj, amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Lemon'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lemon_processing'])
    print(Config.Alerts['lemon_processing'])
    local LemonJuice = Config.LemonJuice
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['LemonJuice'].db_obj, LemonJuice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['LemonJuice'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lemon_trader'])
end)
 