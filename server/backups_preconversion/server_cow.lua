
--- Useable Items
 
QBCore.Functions.CreateUseableItem("beef", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("milk", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)


------------------------------- Cow Farming Stuff ----------------------------

QBCore.Functions.CreateCallback('qb-simplefarming:weapon_knife', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("weapon_knife") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:cowmeat', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_beef") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:emptycowbucket', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("emptycowbucket") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


QBCore.Functions.CreateCallback('qb-simplefarming:milkbucketfull', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("milkbucket") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:cowmilking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cow_milkbucket = math.random(1,3)
    Player.Functions.RemoveItem('emptycowbucket', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milkbucket'], "remove")
    Wait(1000)
    Player.Functions.AddItem('milkbucket', cow_milkbucket)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milkbucket'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Gathered  " ..cow_milkbucket.. " buckets of milk.")
end)


RegisterServerEvent('qb-simplefarming:cowkilling', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cowraw_meat1 = math.random(2,4)
    Player.Functions.AddItem('raw_beef', cowraw_meat1, false)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_beef'], "add")
    Player.Functions.AddItem('cow_leather', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cow_leather'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Gathered  " ..cowraw_meat1.. " amount of raw meat. You Also skinned the cow for 1 leather")
end)

RegisterServerEvent('qb-simplefarming:beefprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local rawbeef = Player.Functions.GetItemByName('raw_beef')
    if not rawbeef then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_rawmeat'])
        return false
    end

    local amount = rawbeef.amount
    if amount >= 1 then
        amount = Config.BeefProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_beef', amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_beef'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cow_processing'])
    local Cowmeat = Config.CowMeat
    Wait(750)
    Player.Functions.AddItem('beef', Cowmeat)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['beef'], "add")
end)

RegisterServerEvent('qb-simplefarming:getcowbucket', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    Player.Functions.AddItem('emptycowbucket', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['emptycowbucket'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed A Bucket")
end)

RegisterServerEvent('qb-simplefarming:dairymilk', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local milkbucket = Player.Functions.GetItemByName('milkbucket')
    if not milkbucket then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_milkprocessor'])
        return false
    end

    local amount = milkbucket.amount
    if amount >= 1 then
        amount = Config.MilkProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('milkbucket', amount) then
        print('couldnt remove item',amount)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milkbucket'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['milk_processing'])
    local Milk = Config.Milk
    Wait(750)
    Player.Functions.AddItem('milk', Milk)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['milk_trader'])
end)
 