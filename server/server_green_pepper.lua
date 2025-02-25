--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['GreenPeppers'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end) 

QBCore.Functions.CreateUseableItem(Config.Inventory['PickledGreenPeppers'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
 
QBCore.Functions.CreateUseableItem(Config.Inventory['SlicedGreenPeppers'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
 
------------------------------- GreenPepper Farming ----------------------------

RegisterServerEvent('qb-simplefarming:greenpepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local greenpepperfarming = 1
    Player.Functions.AddItem(Config.Inventory['GreenPeppers'].db_obj, greenpepperfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['GreenPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_picked'].. " " ..greenpepperfarming.. " " ..Config.Alerts['greenpepper_name'])
end)


-- Make Sliced Green Peppers
RegisterServerEvent('qb-simplefarming:greenpepperprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local greenpepper = Player.Functions.GetItemByName(Config.Inventory['GreenPeppers'].db_obj)
    if not greenpepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_greenpepperslicing'])
        return false
    end

    local amount = greenpepper.amount
    if amount >= 1 then
        amount = Config.GreenPepperProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['GreenPeppers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['GreenPeppers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['greenpepper_processing'])
    local GreenPeppers = Config.GreenPepperJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['SlicedGreenPeppers'].db_obj, GreenPeppers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedGreenPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['greenpepper_trader'])
end)

RegisterServerEvent('qb-simplefarming:pickledgreenpepperprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local greenpepper = Player.Functions.GetItemByName(Config.Inventory['SlicedGreenPeppers'].db_obj)
    if not greenpepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_greenpepperslicing'])
        return false
    end

    local amount = greenpepper.amount
    if amount >= 1 then
        amount = Config.GreenPepperProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedGreenPeppers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedGreenPeppers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['greenpepper_processing'])
    local GreenPeppers = Config.GreenPepperJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['PickledGreenPeppers'].db_obj, GreenPeppers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PickledGreenPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['greenpepper_trader'])
end)

-- does item exist in db, and retrieve players inv data for that item.
QBCore.Functions.CreateCallback('qb-simplefarming:greenpeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['GreenPeppers'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:slicedgreenpeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['SlicedGreenPeppers'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:pickledgreenpeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['PickledGreenPeppers'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
-- TODO 

-- ❓ greenpepper - language config.lua
--[[ 
    Config.Inventory['GreenPeppers'] = {}
        Config.Inventory['GreenPeppers'].db_obj = "GreenPeppers"
        Config.Inventory['GreenPeppers'].in_game_obj = "GreenPeppers"  
    Config.Inventory['SlicedGreenPeppers'] = {}
        Config.Inventory['SlicedGreenPeppers'].db_obj = "SlicedGreenPeppers"
        Config.Inventory['SlicedGreenPeppers'].in_game_obj = "SlicedGreenPeppers"  
    Config.Inventory['PickledGreenPeppers'] = {} 
        Config.Inventory['PickledGreenPeppers'].db_obj = "PickledGreenPeppers"
        Config.Inventory['PickledGreenPeppers'].in_game_obj = "PickledGreenPeppers"  


-- ❓ green pepper
    ['greenpepper_picking'] = "Picking GreenPeppers",
    ['greenpepper_fields'] = 'GreenPepper Farm',
    ['greenpepper_name'] = 'GreenPepper',      
    ['PickledGreenPeppers'] = 'Pickled GreenPeppers',     
    ['picking_greenpeppers'] = 'Picking Up GreenPepper',
    ['greenpepper_processingbar'] = 'Slicing GreenPeppers',
    ['greenpepper_processing'] = 'Sliced ' ..Config.GreenPepperProcessing,
    ['greenpepper_trader'] = 'Made ' ..Config.GreenPepperJars.. ' Jar of pickled greenpepper',
    ['error_greenpepperslicing'] = 'You don\'t have any greenpeppers to slice',
--]]