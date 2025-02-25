
--- Useable Items
  
QBCore.Functions.CreateUseableItem("slicedpumpkinpie", function(source, item)
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
    Player.Functions.AddItem('rawpumpkin', pumpkinfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rawpumpkin'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Picked up " ..pumpkinfarming.. " Pumpkin")
end)

RegisterServerEvent('qb-simplefarming:pumpkinprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pumpkin = Player.Functions.GetItemByName('rawpumpkin')
    if not pumpkin then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_milkprocessor'])
        return false
    end

    local amount = pumpkin.amount
    if amount >= 1 then
        amount = Config.PumpkinProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('rawpumpkin', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rawpumpkin'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pumpkin_processing'])
    local Pumpkins = Config.PumpkinBoxes
    Wait(750)
    Player.Functions.AddItem('pumpkinpiebox', Pumpkins)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pumpkinpiebox'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['pumpkin_trader'])
end)

QBCore.Functions.CreateCallback('qb-simplefarming:pumpkincheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("rawpumpkin") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)