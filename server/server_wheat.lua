
--- Useable Items

QBCore.Functions.CreateUseableItem("corncob", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("canofcorn", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


------------------------------- Corn Farming ----------------------------

QBCore.Functions.CreateCallback('qb-simplefarming:corncheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("corncob") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('qb-simplefarming:cornpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cornfarming = math.random(1,3)
    Player.Functions.AddItem('corncob', cornfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['corncob'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..cornfarming.. " Corn Cobs")
end)

RegisterServerEvent('qb-simplefarming:cornprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local corn = Player.Functions.GetItemByName('corncob')
    if not corn then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_corncob'])
        return false
    end

    local amount = corn.amount
    if amount >= 1 then
        amount = Config.CornProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('corncob', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['corncob'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['corn_processing'])
    local Corn = Config.CornProcessed
    Wait(750)
    Player.Functions.AddItem('canofcorn', Corn)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['canofcorn'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['corn_processed'])
end)
 

--[[


-- ❓ wheat
Config.Alerts 
    ['wheat_fields'] = 'Wheat Farm',
    ['wheat_name'] = 'Wheat',  
    ['GroundWheat'] = 'Ground Wheat Flour',     
    ['picking_wheat'] = 'Picking Up Bundle of Wheat',
    ['wheat_processingbar'] = 'Grinding Wheat',
    ['wheat_processing'] = 'Ground ' ..Config.WheatProcessing,
    ['wheat_trader'] = 'Ground ' ..Config.WheatSack.. ' sack of wheat flour',
    ['error_wheatgrinding'] = 'You don\'t have a wheat bundle to grind.',

    
    Config.Inventory['Wheat'] = {}
        Config.Inventory['Wheat'].db_obj = "Wheat"
        Config.Inventory['Wheat'].in_game_obj = "Wheat"   

    Config.Inventory['GroundWheat'] = {}
        Config.Inventory['GroundWheat'].db_obj = "GroundWheat"
        Config.Inventory['GroundWheat'].in_game_obj = "GroundWheat"           
--]]