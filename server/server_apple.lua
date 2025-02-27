--- Useable Items

QBCore.Functions.CreateUseableItem(Config.Inventory['Apple'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['AppleJuice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
   
QBCore.Functions.CreateUseableItem(Config.Inventory['ApplePieSlice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:applescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Apple'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

------------------------------- Apple Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:applepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Apple'].db_obj, amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_pickingfront'] ..amount.. Config.Alerts['apple_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:appleprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local apple = Player.Functions.GetItemByName(Config.Inventory['Apple'].db_obj)
    if not apple then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_appleprocessor'])
        return false
    end

    local amount = apple.amount
    if amount >= 1 then
        amount = Config.AppleProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Apple'].db_obj, amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Apple'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_processing'])
    print(Config.Alerts['apple_processing'])
    local AppleJuice = Config.AppleJuice
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['AppleJuice'].db_obj, AppleJuice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['AppleJuice'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_trader'])
end)
 