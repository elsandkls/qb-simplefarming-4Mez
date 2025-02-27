--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['Barley'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['BarleyFlour'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

------------------------------- Barley Farming ----------------------------
QBCore.Functions.CreateCallback('qb-simplefarming:barleycheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Barley'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:barleypicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local barleyfarming = math.random(1,3)
    Player.Functions.AddItem(Config.Inventory['Barley'].db_obj, barleyfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Barley'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_grab'].. " " ...barleyfarming.. " " ..Config.Alerts['GroundBarleys'])
end)

RegisterServerEvent('qb-simplefarming:barleyprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local barley = Player.Functions.GetItemByName(Config.Inventory['Barley'].db_obj)
    if not barley then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_barleygrinding'])
        return false
    end

    local amount = barley.amount
    if amount >= 1 then
        amount = Config.BarleyProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Barley'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Barley'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['barley_processing'])
    local Barley = Config.BarleyProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['BarleyFlour'].db_obj, Barley)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['BarleyFlour'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['barley_processed'])
end)
 

--[[


-- ❓ barley
Config.Alerts 
    ['barley_fields'] = 'Barley Farm',
    ['barley_name'] = 'Barley',  
    ['GroundBarley'] = 'Ground Barley Flour',     
    ['picking_barley'] = 'Picking Up Bundle of Barley',
    ['barley_processingbar'] = 'Grinding Barley',
    ['barley_processed'] = 'Finished Grinding Barley',
    ['barley_processing'] = 'Ground ' ..Config.BarleyProcessing,
    ['barley_trader'] = 'Ground ' ..Config.BarleySack.. ' sack of barley flour',
    ['error_barleygrinding'] = 'You don\'t have a barley bundle to grind.',

    
    Config.Inventory['Barley'] = {}
        Config.Inventory['Barley'].db_obj = "Barley"
        Config.Inventory['Barley'].in_game_obj = "Barley"   

    Config.Inventory['BarleyFlour'] = {}
        Config.Inventory['BarleyFlour'].db_obj = "BarleyFlour"
        Config.Inventory['BarleyFlour'].in_game_obj = "BarleyFlour"           
--]]