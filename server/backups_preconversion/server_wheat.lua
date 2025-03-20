--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['Wheat'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['WheatFlour'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

------------------------------- Wheat Farming ----------------------------
QBCore.Functions.CreateCallback('qb-simplefarming:wheatcheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Wheat'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:wheatpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local wheatfarming = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Wheat'].db_obj, wheatfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Wheat'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_grab'].. " " ...wheatfarming.. " " ..Config.Alerts['GroundWheats'])
end)

RegisterServerEvent('qb-simplefarming:wheatprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local wheat = Player.Functions.GetItemByName(Config.Inventory['Wheat'].db_obj)
    if not wheat then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_wheatgrinding'])
        return false
    end

    local amount = wheat.amount
    if amount >= 1 then
        amount = Config.WheatProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Wheat'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Wheat'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['wheat_processing'])
    local Wheat = Config.WheatProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['WheatFlour'].db_obj, Wheat)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['WheatFlour'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['wheat_processed'])
end)
 

--[[


-- ❓ wheat
Config.Alerts 
    ['wheat_fields'] = 'Wheat Farm',
    ['wheat_name'] = 'Wheat',  
    ['GroundWheat'] = 'Ground Wheat Flour',     
    ['picking_wheat'] = 'Picking Up Bundle of Wheat',
    ['wheat_processingbar'] = 'Grinding Wheat',
    ['wheat_processed'] = 'Finished Grinding Wheat',
    ['wheat_processing'] = 'Ground ' ..Config.WheatProcessing,
    ['wheat_trader'] = 'Ground ' ..Config.WheatSack.. ' sack of wheat flour',
    ['error_wheatgrinding'] = 'You don\'t have a wheat bundle to grind.',

    
    Config.Inventory['Wheat'] = {}
        Config.Inventory['Wheat'].db_obj = "Wheat"
        Config.Inventory['Wheat'].in_game_obj = "Wheat"   

    Config.Inventory['WheatFlour'] = {}
        Config.Inventory['WheatFlour'].db_obj = "WheatFlour"
        Config.Inventory['WheatFlour'].in_game_obj = "WheatFlour"           
--]]