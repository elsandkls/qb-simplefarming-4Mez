QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-simpefarming:sellItems', function()
    local source = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Sell[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Sell[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['soldit'] )
    else
		TriggerClientEvent('QBCore:Notify', source, Config.Alerts['nosale'])
	end
end) 


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("------------------------------------------------------------------------------------------------------------------------------")
    print("^1")
    print("\n  ██████╗ ██████╗       ███████╗██╗███╗   ███╗██████╗ ██╗     ███████╗███████╗ █████╗ ██████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗ \t \n ██╔═══██╗██╔══██╗      ██╔════╝██║████╗ ████║██╔══██╗██║     ██╔════╝██╔════╝██╔══██╗██╔══██╗████╗ ████║██║████╗  ██║██╔════╝ \r \n ██║   ██║██████╔╝█████╗███████╗██║██╔████╔██║██████╔╝██║     █████╗  █████╗  ███████║██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ███╗\t \n ██║▄▄ ██║██╔══██╗╚════╝╚════██║██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝  ██╔══╝  ██╔══██║██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║   ██║\t \n ╚██████╔╝██████╔╝      ███████║██║██║ ╚═╝ ██║██║     ███████╗███████╗██║     ██║  ██║██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝\t \n ╚══▀▀═╝ ╚═════╝       ╚══════╝╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ \t")
    print("^0")
    print("       ^1Discord ^5 --> ^0https://discord.gg/vTCUWCnQSD         ",   "           ^1Author^5: ^0TRClassic#0001")
    print("------------------------------------------------------------------------------------------------------------------------------")
end)
