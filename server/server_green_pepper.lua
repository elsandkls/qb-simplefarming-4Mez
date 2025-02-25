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

-- Green Peppers
RegisterServerEvent('qb-simplefarming:greenpepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local greenpepperpicking = math.random(1,3)
    Player.Functions.AddItem('greenpepper', greenpepperpicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['greenpepper'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_grab'] ..greenpepperpicking.. " Green Peppers")
end)

QBCore.Functions.CreateCallback('qb-simplefarming:greenpeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("greenpepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
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
    Player.Functions.AddItem(Config.Inventory['PickledGreenPeppers'].db_obj, GreenPeppers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PickledGreenPeppers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['greenpepper_trader'])
end)

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

-- TODO 

-- ❓ greenpepper - language config.lua
--[[ 
 
    Config.Inventory['GreenPeppers'] = {}
        Config.Inventory['GreenPeppers'].db_obj = "GreenPeppers"
        Config.Inventory['GreenPeppers'].in_game_obj = "GreenPeppers"  
    Config.Inventory['PickledGreenPeppers'] = {} 
        Config.Inventory['PickledGreenPeppers'].db_obj = "PickledGreenPeppers"
        Config.Inventory['PickledGreenPeppers'].in_game_obj = "PickledGreenPeppers"  

-- ❓ greenpeppers
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