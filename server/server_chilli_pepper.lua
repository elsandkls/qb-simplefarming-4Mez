
--- Useable Items

QBCore.Functions.CreateUseableItem("chillypepper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hotsauce", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
  

-- Chilly Peppers

RegisterServerEvent('qb-simplefarming:chillipepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local chillipepperpicking = math.random(1,3)
    Player.Functions.AddItem('chillypepper', chillipepperpicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['chillypepper'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..chillipepperpicking.. " Chilly Peppers")
end)

RegisterServerEvent('qb-simplefarming:makinghotsauce', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local pepper = Player.Functions.GetItemByName('chillypepper')
    if not pepper then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_chilly'])
        return false
    end

    local amount = pepper.amount
    if amount >= 1 then
        amount = Config.ChillyProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem('chillypepper', amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['chillypepper'], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processing'])
    local Chilly = Config.ChillyProcessed
    Wait(750)
    Player.Functions.AddItem('hotsauce', Chilly)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['hotsauce'], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['chilly_processed'])
end)
 

QBCore.Functions.CreateCallback('qb-simplefarming:chillycheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("chillypepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

 