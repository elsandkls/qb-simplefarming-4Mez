--- Useable Items

QBCore.Functions.CreateUseableItem("greenpepper", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- Green Peppers

RegisterServerEvent('qb-simplefarming:gpepperpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local gpepperpicking = math.random(1,3)
    Player.Functions.AddItem('greenpepper', gpepperpicking)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['greenpepper'], "add")
    TriggerClientEvent('QBCore:Notify', source, "Grabbed " ..gpepperpicking.. " Green Peppers")
end)

QBCore.Functions.CreateCallback('qb-simplefarming:greenpeppercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("greenpepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
