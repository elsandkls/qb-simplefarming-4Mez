--- Useable Items

QBCore.Functions.CreateUseableItem(Config.Inventory['Peach'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['PeachJuice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
   
QBCore.Functions.CreateUseableItem(Config.Inventory['PeachPieSlice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:peachcheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Peach'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

------------------------------- Peach Stuff ----------------------------

RegisterServerEvent('qb-simplefarming:peachpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Peach'].db_obj, amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['peach_pickingfront'] ..amount.. Config.Alerts['peach_pickingend'])
end)


RegisterServerEvent('qb-simplefarming:peachprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local peach = Player.Functions.GetItemByName(Config.Inventory['Peach'].db_obj)
    if not peach then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_peachprocessor'])
        return false
    end

    local amount = peach.amount
    if amount >= 1 then
        amount = Config.PeachProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Peach'].db_obj, amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Peach'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['peach_processing'])
    print(Config.Alerts['peach_processing'])
    local PeachJuice = Config.PeachJuice
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['PeachJuice'].db_obj, PeachJuice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PeachJuice'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['peach_trader'])
end)
 