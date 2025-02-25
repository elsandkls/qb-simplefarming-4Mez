--- Useable Items

QBCore.Functions.CreateUseableItem("apple", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("apple_juice", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
   
QBCore.Functions.CreateUseableItem("slicedapplepie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

------------------------------- Apple Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:applepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem('apple', amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_pickingfront'] ..amount.. Config.Alerts['apple_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:appleprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local apple = Player.Functions.GetItemByName('apple')
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

    if not Player.Functions.RemoveItem('apple', amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['apple'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_processing'])
    print(Config.Alerts['apple_processing'])
    local AppleJuice = Config.AppleJuice
    Wait(750)
    Player.Functions.AddItem('apple_juice', AppleJuice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['apple_juice'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['apple_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:apples', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("apple") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)