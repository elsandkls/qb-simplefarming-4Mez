
--- Useable Items

QBCore.Functions.CreateUseableItem("grapes", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("grapejuice", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)


RegisterServerEvent('qb-simplefarming:grapepicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapepicking = math.random(1,2)
    Player.Functions.AddItem('grapes', grapepicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapes'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..grapepicking.. " Grapes")
end)

RegisterServerEvent('qb-simplefarming:grapeprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName('grapes')
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

    if not Player.Functions.RemoveItem('grapes', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapes'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processing'])
    local Grape = Config.GrapeProcessed
    Wait(750)
    Player.Functions.AddItem('grapejuice', Grape)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapejuice'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['grape_processed'])
end)


QBCore.Functions.CreateCallback('qb-simplefarming:grapecheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("grapes") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
 