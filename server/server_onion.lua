
--- Useable Items
  
QBCore.Functions.CreateUseableItem(Config.Inventory['PickledOnions'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
 
------------------------------- Onion Farming ----------------------------

RegisterServerEvent('qb-simplefarming:onionpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local onionfarming = 1
    Player.Functions.AddItem(Config.Inventory['Onion'].db_obj, onionfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Onion'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_picked'].. " " ..onionfarming.. " " ..Config.Alerts['onion_name'])
end)

RegisterServerEvent('qb-simplefarming:onionprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local onion = Player.Functions.GetItemByName(Config.Inventory['Onion'].db_obj)
    if not onion then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_onionslicing'])
        return false
    end

    local amount = onion.amount
    if amount >= 1 then
        amount = Config.OnionProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Onion'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Onion'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['onion_processing'])
    local Onions = Config.OnionJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['PickledOnions'].db_obj, Onions)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PickledOnions'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['onion_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:onioncheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Onion'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

-- TODO 

-- ❓ onion - language config.lua
--[[ 
    Config.Inventory['Onion'] = {}
        Config.Inventory['Onion'].db_obj = "Onion"
        Config.Inventory['Onion'].in_game_obj = "Onion"  
    Config.Inventory['PickledOnions'] = {} 
        Config.Inventory['PickledOnions'].db_obj = "PickledOnions"
        Config.Inventory['PickledOnions'].in_game_obj = "PickledOnions"  

-- ❓ onions
    ['onion_fields'] = 'Onion Farm',
    ['onion_name'] = 'Onion',      
    ['PickledOnions'] = 'Pickled Onions',     
    ['picking_onions'] = 'Picking Up Onion',
    ['onion_processingbar'] = 'Slicing Onions',
    ['onion_processing'] = 'Sliced ' ..Config.OnionProcessing,
    ['onion_trader'] = 'Made ' ..Config.OnionJars.. ' Jar of pickled onion',
    ['error_onionslicing'] = 'You don\'t have any onions to slice',
--]]