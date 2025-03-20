--- Useable Items
  
QBCore.Functions.CreateUseableItem(Config.Inventory['BowlofLettuce'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
 
------------------------------- Lettuce Farming ----------------------------

RegisterServerEvent('qb-simplefarming:lettucepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local lettucefarming = 1
    Player.Functions.AddItem(Config.Inventory['Lettuce'].db_obj, lettucefarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Lettuce'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_picked'].. " " ..lettucefarming.. " " ..Config.Alerts['lettuce_name'])
end)

RegisterServerEvent('qb-simplefarming:lettuceprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local lettuce = Player.Functions.GetItemByName(Config.Inventory['Lettuce'].db_obj)
    if not lettuce then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_lettuceslicing'])
        return false
    end

    local amount = lettuce.amount
    if amount >= 1 then
        amount = Config.LettuceProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Lettuce'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Lettuce'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['lettuce_processing'])
    local Lettuces = Config.LettuceJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['BowlofLettuce'].db_obj, Lettuces)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['BowlofLettuce'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['bowloflettuce_trader'])
end)

RegisterServerEvent('qb-simplefarming:greeksaladprocess', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local lettuce = Player.Functions.GetItemByName(Config.Inventory['BowlofLettuce'].db_obj)
    if not lettuce then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_lettuceslicing'])
        return false
    end
    local amount = lettuce.amount
    if amount >= 1 then
        amount = Config.SaladProcessing
    else
      return false
    end

    local onion = Player.Functions.GetItemByName(Config.Inventory['SlicedOnions'].db_obj)
    if not onion then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_onionslicing'])
        return false
    end
    local amount = onion.amount
    if amount >= 1 then
        amount = Config.SaladProcessing
    else
      return false
    end

    local tomatoe = Player.Functions.GetItemByName(Config.Inventory['SlicedTomatoes'].db_obj)
    if not tomatoe then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_tomatoeslicing'])
        return false
    end
    local amount = tomatoe.amount
    if amount >= 1 then
        amount = Config.SaladProcessing
    else
      return false
    end    
    
    local greenpeppers = Player.Functions.GetItemByName(Config.Inventory['SlicedGreenPeppers'].db_obj)
    if not greenpeppers then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_greenpepperslicing'])
        return false
    end
    local amount = greenpeppers.amount
    if amount >= 1 then
        amount = Config.SaladProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Lettuce'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['BowlofLettuce'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['salad_processing'])
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedOnions'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['salad_processing'])
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedTomatoes'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['salad_processing'])
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedGreenPeppers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['salad_processing'])
    local SaladBowl = Config.HouseSalad
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['BowlofLettuce'].db_obj, SaladBowl)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['HouseSalad'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['salad_trader'])
end)


QBCore.Functions.CreateCallback('qb-simplefarming:lettucecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lettuce'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:bowloflettucecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lettuce'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:housesaladcheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lettuce'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:greeksaladcheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Lettuce'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

-- TODO 

-- ❓ lettuce - language config.lua
--[[ 
-- ❓ lettuce
    Config.Inventory['Lettuce'] = {}
        Config.Inventory['Lettuce'].db_obj = "Lettuce"
        Config.Inventory['Lettuce'].in_game_obj = "Lettuce"   
    Config.Inventory['BowlofLettuce'] = {}
        Config.Inventory['BowlofLettuce'].db_obj = "BowlofLettuce"
        Config.Inventory['BowlofLettuce'].in_game_obj = "BowlofLettuce"   
    Config.Inventory['HouseSalad'] = {}
        Config.Inventory['HouseSalad'].db_obj = "HouseSalad"
        Config.Inventory['HouseSalad'].in_game_obj = "HouseSalad"   
    Config.Inventory['GreekSalad'] = {}
        Config.Inventory['GreekSalad'].db_obj = "GreekSalad"
        Config.Inventory['GreekSalad'].in_game_obj = "GreekSalad"  

-- ❓ lettuce
    ['lettuce_fields'] = 'Lettuce Farm',
    ['lettuce_name'] = 'Lettuce',      
    ['BowlofLettuce'] = 'Bowl of Lettuce',     
    ['picking_lettuce'] = 'Picking Up Lettuce',
    ['lettuce_processingbar'] = 'Slicing Lettuces',
    ['lettuce_processing'] = 'Sliced ' ..Config.LettuceProcessing,
    ['lettuce_trader'] = 'Made ' ..Config.LettuceBowl.. ' bowl of lettuce',
    ['error_lettuceslicing'] = 'You don\'t have any lettuce heads to slice',
--]]