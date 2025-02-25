
--- Useable Items
  
QBCore.Functions.CreateUseableItem(Config.Inventory['PumpkinPieSlice'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
 
------------------------------- Pumpkin Farming ----------------------------

RegisterServerEvent('qb-simplefarming:pumpkinpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pumpkinfarming = 1
    Player.Functions.AddItem(Config.Inventory['Pumpkin'].db_obj, pumpkinfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Pumpkin'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_picked'].. " " ..pumpkinfarming.. " " ..Config.Alerts['pumpkin_name'])
end)

RegisterServerEvent('qb-simplefarming:pumpkinprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pumpkin = Player.Functions.GetItemByName(Config.Inventory['Pumpkin'].db_obj)
    if not pumpkin then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_pumpkinsmashing'])
        return false
    end

    local amount = pumpkin.amount
    if amount >= 1 then
        amount = Config.PumpkinProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Pumpkin'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Pumpkin'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pumpkin_processing'])
    local Pumpkins = Config.PumpkinBoxes
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['PumpkinPie'].db_obj, Pumpkins)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['PumpkinPie'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pumpkin_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:pumpkincheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Pumpkin'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

-- TODO
-- convert pie to pumpkin pie slices. instead of eating a whole pie?

-- ❓ pumpkin - language config.lua
--[[ 
  Config.Alerts['pumpkin_fields'] = 'Pumpkin Farm',
  Config.Alerts['pumpkin_name'] = 'Pumpkin', 
  Config.Alerts['sliceofpumpkinpie'] = 'Slice of Pumpkin Pie',        
  Config.Alerts['pumpkinpie'] = 'Pumpkin Pie',
  Config.Alerts['picking_pumpkins'] = 'Picking Up Pumpkin',
  Config.Alerts['pumpkin_processingbar'] = 'Smashing Pumpkins',
  Config.Alerts['pumpkin_processing'] = 'Smashed ' ..Config.PumpkinProcessing,
  Config.Alerts['pumpkin_trader'] = 'Made ' ..Config.PumpkinBoxes.. ' Boxes of pumpkin pie',
  Config.Alerts['error_pumpkinsmashing'] = 'You don\'t have any pumpkins to smash',
 
 Config.Inventory['Pumpkin'] = {}
 Config.Inventory['Pumpkin'].db_obj = "Pumpkin"
 Config.Inventory['Pumpkin'].in_game_obj = "Pumpkin"  
 Config.Inventory['PumpkinPie'] = {}
 Config.Inventory['PumpkinPie'].db_obj = "PumpkinPie"
 Config.Inventory['PumpkinPie'].in_game_obj = "PumpkinPie"  
 Config.Inventory['PumpkinPieSlice'] = {}
 Config.Inventory['PumpkinPieSlice'].db_obj = "PumpkinPieSlice"
 Config.Inventory['PumpkinPieSlice'].in_game_obj = "PumpkinPieSlice"
--]]