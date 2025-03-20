--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['ChilliPeppers'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem(Config.Inventory['HotSauce'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end) 
QBCore.Functions.CreateUseableItem(Config.Inventory['SlicedChilliPeppers'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem(Config.Inventory['PickledChilliPeppers'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

---- Does it exists  --- 
QBCore.Functions.CreateCallback('qb-simplefarming:chillycheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory[Config.Inventory['ChilliPeppers'].db_obj].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:hotsaucecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['HotSauce'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:slicedchillipeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['SlicedChilliPeppers'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:pickledchillipeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['PickledChilliPeppers'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

-- Chilly Peppers Farming

RegisterServerEvent('qb-simplefarming:chillipepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local chillipepperpicking = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['ChilliPeppers'].db_obj, chillipepperpicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['ChilliPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_grab'] .." ".. chillipepperpicking .." ".. Config.Alerts['ChilliPeppers'])
end)



-- Chilly Peppers Processing
RegisterServerEvent('qb-simplefarming:makinghotsauce', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pepper = Player.Functions.GetItemByName(Config.Inventory['SlicedChilliPeppers'].db_obj)
    if not pepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_chilly'])
        return false
    end

    local amount = pepper.amount
    if amount >= 1 then
        amount = Config.ChillyProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedChilliPeppers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedChilliPeppers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processing'])
    local Chilly = Config.ChillyProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['HotSauce'].db_obj, Chilly)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['HotSauce'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processed'])
end)
 
 


-- Chilly Peppers Processing
RegisterServerEvent('qb-simplefarming:makingpickledpeppers', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pepper = Player.Functions.GetItemByName(Config.Inventory['SlicedChilliPeppers'].db_obj)
    if not pepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_chilly'])
        return false
    end

    local amount = pepper.amount
    if amount >= 1 then
        amount = Config.ChillyProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedChilliPeppers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedChilliPeppers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processing'])
    local Chilly = Config.ChillyProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['PickledChilliPeppers'].db_obj, Chilly)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PickledChilliPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processed'])
end)
 


-- Chilly Peppers Processing
RegisterServerEvent('qb-simplefarming:makingslicedpeppers', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pepper = Player.Functions.GetItemByName(Config.Inventory['ChilliPeppers'].db_obj)
    if not pepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_chilly'])
        return false
    end

    local amount = pepper.amount
    if amount >= 1 then
        amount = Config.ChillyProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['ChilliPeppers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['ChilliPeppers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processing'])
    local Chilly = Config.ChillyProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['SlicedChilliPeppers'].db_obj, Chilly)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedChilliPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processed'])
end)
 

--[[
-- ❓ chillipeppers    
Config.Alerts['farm_picked'] = 'Picked Up ',
Config.Alerts['farm_grab'] = 'Grabbed ',

Config.Inventory['ChilliPeppers'] = {}
Config.Inventory['ChilliPeppers'].db_obj = "ChilliPeppers"
Config.Inventory['ChilliPeppers'].in_game_obj = "ChilliPeppers" 
Config.Inventory['SlicedChilliPeppers'] = {}
Config.Inventory['SlicedChilliPeppers'].db_obj = "SlicedChilliPeppers"
Config.Inventory['SlicedChilliPeppers'].in_game_obj = "SlicedChilliPeppers" 
Config.Inventory['PickledChilliPeppers'] = {}
Config.Inventory['PickledChilliPeppers'].db_obj = "PickledChilliPeppers"
Config.Inventory['PickledChilliPeppers'].in_game_obj = "PickledChilliPeppers" 
Config.Inventory['HotSauce'] = {}
Config.Inventory['HotSauce'].db_obj = "HotSauce"
Config.Inventory['HotSauce'].in_game_obj = "HotSauce" 


-- ❓ chilli pepper
['ChilliPeppers'] = 'Chilli Peppers',
['chillypepper_picking'] = 'Picking ChillyPeppers',
['chilly_hotsauce'] = 'Making Hot Sauce',
['chilly_processing'] = 'Crushed ' ..Config.ChillyProcessing.. ' chilly Peppers',
['chilly_processed'] = 'Made ' ..Config.ChillyProcessed.. ' hot sauce bottle\'s',
['error_chilly'] = 'Hm, It seems like you don\'t have any chilly peppers to process... Come back later!',

--]]
 