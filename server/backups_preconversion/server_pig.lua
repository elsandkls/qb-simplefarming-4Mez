
--- Useable Items
 
QBCore.Functions.CreateUseableItem("cooked_bacon", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_sausage", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_pork", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_ham", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- Pig

QBCore.Functions.CreateCallback('qb-simplefarming:soybeancheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("soybeans") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawbacon', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_bacon") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawham', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_ham") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawpork', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_pork") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:rawsausage', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_sausage") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:baconprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local bacon = Player.Functions.GetItemByName('raw_bacon')
    if not bacon then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_bacon'])
        return false
    end

    local amount = bacon.amount
    if amount >= 1 then
        amount = Config.BaconProcesing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_bacon', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_bacon'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['bacon_processing'])
    local Bacon = Config.BaconProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_bacon', Bacon)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_bacon'], "add")
end)

RegisterServerEvent('qb-simplefarming:hamprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local ham = Player.Functions.GetItemByName('raw_ham')
    if not ham then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_ham'])
        return false
    end

    local amount = ham.amount
    if amount >= 1 then
        amount = Config.HamProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_ham', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_ham'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['ham_processing'])
    local Ham = Config.HamProcessing
    Wait(750)
    Player.Functions.AddItem('cooked_ham', Ham)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_ham'], "add")
end)

RegisterServerEvent('qb-simplefarming:porkprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pork = Player.Functions.GetItemByName('raw_pork')
    if not pork then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_pork'])
        return false
    end

    local amount = pork.amount
    if amount >= 1 then
        amount = Config.PorkProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_pork', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_pork'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pork_cooking'])
    local Pork = Config.PorkProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_pork', Pork)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_pork'], "add")
end)

RegisterServerEvent('qb-simplefarming:sausageprocessed', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local sausage = Player.Functions.GetItemByName('raw_sausage')
    if not sausage then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_sausage'])
        return false
    end

    local amount = sausage.amount
    if amount >= 1 then
        amount = Config.SausageProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('raw_sausage', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_sausage'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['sausage_processing'])
    local Sausage = Config.SausageProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_sausage', Sausage)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cooked_sausage'], "add")
end)

RegisterServerEvent('qb-simplefarming:pigfood', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local price = Config.FoodPrice
    local pigfoodamount = Config.PigFood
    Player.Functions.RemoveMoney("cash", price)
    TriggerClientEvent('QBCore:Notify', source, "Bought pig food for $" ..price.. " Enjoy!")
    Player.Functions.AddItem('soybeans', pigfoodamount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['soybeans'], "add")
    TriggerClientEvent('QBCore:Notify', source, "The farmer gave you " ..pigfoodamount.. " of Soy Beans", "success")
end)

RegisterServerEvent('qb-simplefarming:feedingpiglit', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local soybean = Player.Functions.GetItemByName('soybeans')
    if not soybean then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_soybean'])
        return false
    end

    local amount = soybean.amount
    if amount >= 1 then
        amount = 1
    else
      return false
    end

    if not Player.Functions.RemoveItem('soybeans', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error.soybean'])
        return false
    end
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['soybeans'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['stress'])
    TriggerClientEvent('qb-simplefarming:relievestress', source)
end)

RegisterNetEvent('qb-simplefarming:slayreward', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local rawbacon = math.random(1, 6)
    local rawham = math.random(1, 4)
    local rawpork = math.random(2, 3)
    local rawsausage = math.random(1, 10)
    Player.Functions.AddItem('raw_bacon', rawbacon)
    Player.Functions.AddItem('raw_ham', rawham)
    Player.Functions.AddItem('raw_porkroast', rawporkroast)
    Player.Functions.AddItem('raw_porkchops', rawporkchops)
    Player.Functions.AddItem('raw_porktenderloin', rawporktenderloin)
    Player.Functions.AddItem('raw_sausage', rawsausage)
    Player.Functions.AddItem('pig_leather', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_bacon'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_ham'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_pork'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_sausage'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pig_leather'], "add")
    TriggerClientEvent('QBCore:Notify', source, "You gathered " ..rawbacon.. " raw bacon " ..rawham.. " raw ham " ..rawpork.. " raw pork " ..rawsausage.. " raw sausage with some leather")
end)


 