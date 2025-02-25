--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['Rice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['Rice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- Rice
RegisterServerEvent('qb-simplefarming:ricepicking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local tompicking = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Rice'].db_obj, tompicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Rice'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_grab'].." "..tompicking.." "..Config.Alerts['rice_name'])
end)    

RegisterServerEvent('qb-simplefarming:riceprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local rice = Player.Functions.GetItemByName(Config.Inventory['Rice'].db_obj)
    if not rice then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_ricemashing'])
        return false
    end

    local amount = rice.amount
    if amount >= 1 then
        amount = Config.RiceProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Rice'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Rice'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['riceflour_processing'])
    local rice = Config.RiceProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['RiceFlour'].db_obj, rice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['RiceFlour'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['riceflour_processed'])
end)


RegisterServerEvent('qb-simplefarming:riceballsprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local rice = Player.Functions.GetItemByName(Config.Inventory['Rice'].db_obj)
    if not rice then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_riceballmashing'])
        return false
    end

    local amount = rice.amount
    if amount >= 1 then
        amount = Config.RiceProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Rice'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Rice'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['rice_processing'])
    local rice = Config.RiceProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['RiceBalls'].db_obj, rice)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['RiceBalls'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['riceball_processed'])
end)


QBCore.Functions.CreateCallback('qb-simplefarming:ricecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Rice'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
 
--[[
-- ❓ rice
Config.Alerts
-- ❓ rice
    ['rice_fields'] = 'Rice Farm',
    ['rice_name'] = 'Rice',  
    ['GroundRice'] = 'Sack of Rice Flour',  
    ['RiceBalls'] = 'Balls of Rice',   
    ['picking_rice'] = 'Picking Up Sack of Rice',
    ['riceflour_processingbar'] = 'Grinding Rice',
    ['riceflour_processing'] = 'Grinding ' ..Config.RiceProcessing,
    ['rice_processed'] = 'Finished Cooking Rice',
    ['riceball_processed'] = 'Finished Rolling Balls of Rice', 
    ['riceflour_processed'] = 'Finished Grinding Rice',  
    ['riceflour_trader'] = 'Ground ' ..Config.RiceSack.. ' sack of rice flour',
    ['riceball_trader'] = 'Ground ' ..Config.RiceBalls.. ' balls of rice',
    ['error_ricemashing'] = 'You don\'t have a rice sack to grind.', 
    ['error_riceballmashing'] = 'You don\'t have a rice sack to cook.', 

    
-- ❓ rice
    Config.Inventory['Rice'] = {}
        Config.Inventory['Rice'].db_obj = "Rice"
        Config.Inventory['Rice'].in_game_obj = "Rice"   
    Config.Inventory['RiceBalls'] = {}
        Config.Inventory['RiceBalls'].db_obj = "RiceBalls"
        Config.Inventory['RiceBalls'].in_game_obj = "RiceBalls"   
    Config.Inventory['RiceFlour'] = {}
        Config.Inventory['RiceFlour'].db_obj = "RiceFlour"
        Config.Inventory['RiceFlour'].in_game_obj = "RiceFlour"  
--]]