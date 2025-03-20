--- Useable Items
QBCore.Functions.CreateUseableItem(Config.Inventory['Grapes'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem(Config.Inventory['GrapeJuice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem(Config.Inventory['SlicedGrapes'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem(Config.Inventory['GrapeJelly'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem(Config.Inventory['Whine'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)



-- check for item exists and player has it.
QBCore.Functions.CreateCallback('qb-simplefarming:grapescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Grapes'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:slicedgrapescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['SlicedGrapes'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end) 
QBCore.Functions.CreateCallback('qb-simplefarming:whinecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Whine'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:grapejuicecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['GrapeJuice'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
QBCore.Functions.CreateCallback('qb-simplefarming:grapejellycheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['GrapeJelly'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


--- collecting or foraging actions...
RegisterServerEvent('qb-simplefarming:grapepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapepicking = math.random(1,2)
    Player.Functions.AddItem(Config.Inventory['Grapes'].db_obj, grapepicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Grapes'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..grapepicking.. " Grapes")
end)


--- processing or crafting, or cooking actions...
RegisterServerEvent('qb-simplefarming:grapeprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName(Config.Inventory['Grapes'].db_obj)
    if not grapes then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_grape'])
        return false
    end

    local amount = grapes.amount
    if amount >= 1 then
        amount = Config.GrapeProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Grapes'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Grapes'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processing'])
    local Grape = Config.GrapeJuiceProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['GrapeJuice'].db_obj, Grape)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['GrapeJuice'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grapejuice_processed'])
end)


RegisterServerEvent('qb-simplefarming:slicedgrapeprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName(Config.Inventory['Grapes'].db_obj)
    if not grapes then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_grape'])
        return false
    end

    local amount = grapes.amount
    if amount >= 1 then
        amount = Config.GrapeProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Grapes'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Grapes'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processing'])
    local Grape = Config.SlicedGrapesProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['SlicedGrapes'].db_obj, Grape)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedGrapes'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['slicedgrapes_processed'])
end)

--- processing or crafting, or cooking actions...
RegisterServerEvent('qb-simplefarming:grapejellyprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName(Config.Inventory['GrapeJuice'].db_obj)
    if not grapes then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_grape'])
        return false
    end

    local amount = grapes.amount
    if amount >= 1 then
        amount = Config.GrapeJuiceProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['GrapeJuice'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['GrapeJuice'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processing'])
    local Grape = Config.GrapeJellyProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['GrapeJelly'].db_obj, Grape)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['GrapeJelly'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grapejelly_processed'])
end)


RegisterServerEvent('qb-simplefarming:whineprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName(Config.Inventory['GrapeJuice'].db_obj)
    if not grapes then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_grape'])
        return false
    end

    local amount = grapes.amount
    if amount >= 1 then
        amount = Config.GrapeJuiceProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['GrapeJuice'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['GrapeJuice'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processing'])
    local Grape = Config.WhineProcessed
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['Whine'].db_obj, Grape)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Whine'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['whine_processed'])
end)
 
--[[
-- ❓ grape
['grape_fields'] = 'Grape Farm',
['grape_name'] = 'Grapes',  
['grape_picking'] = 'Picking Grapes',
['grape_processingbar'] = 'Straining Grapes',
['grape_processing'] = 'Strained ' ..Config.GrapeProcessing.. ' grapes',
['grape_processed'] = 'Made ' ..Config.GrapeProcessed.. ' bottles of juice',
['error_grape'] = 'Hm, It seems like you don\'t have any grapes to process... Come back later!',

-- ❓ grapes
    Config.Inventory['Grapes'] = {}
        Config.Inventory['Grapes'].db_obj = "Grapes"
        Config.Inventory['Grapes'].in_game_obj = "Grapes"  
    Config.Inventory['SlicedGrapes'] = {}
        Config.Inventory['SlicedGrapes'].db_obj = "SlicedGrapes"
        Config.Inventory['SlicedGrapes'].in_game_obj = "SlicedGrapes"  
    Config.Inventory['Whine'] = {}
        Config.Inventory['Whine'].db_obj = "Whine"
        Config.Inventory['Whine'].in_game_obj = "Whine"  
    Config.Inventory['GrapeJuice'] = {}
        Config.Inventory['GrapeJuice'].db_obj = "GrapeJuice"
        Config.Inventory['GrapeJuice'].in_game_obj = "GrapeJuice"  
    Config.Inventory['GrapeJelly'] = {}
        Config.Inventory['GrapeJelly'].db_obj = "GrapeJelly"
        Config.Inventory['GrapeJelly'].in_game_obj = "GrapeJelly"  


--]]