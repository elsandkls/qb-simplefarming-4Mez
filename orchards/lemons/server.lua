--- Useable Items

local My_Item_Key  = "Lemon"  -- set this to be the key for everything else.
QBCore.Functions.CreateUseableItem(Config.Inventory[My_Item_Key].DB_OGJ, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end) 

------------------------------- Lemon Stuff ----------------------------

local this_action1 = 'picking' 
RegisterServerEvent(Config.ScriptName..':'..My_Item_Key..this_action1, function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local amount = math.random(Config.Inventory[My_Item_Key].min,Config.Inventory[My_Item_Key].max)
    Player.Functions.AddItem(Config.Inventory['Lemon'].db_obj, amount, false)
    TriggerClientEvent('QBCore:Notify', source, Config.Language[Config.My_Item_Key].Messages['picked_start'] ..amount.. Config.Language[Config.My_Item_Key].Messages['picked_end'])
end)
 