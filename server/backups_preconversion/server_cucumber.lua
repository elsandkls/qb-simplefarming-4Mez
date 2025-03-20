--- Useable Items
  
QBCore.Functions.CreateUseableItem(Config.Inventory['Cucumber'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['SlicedCucumber'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['SweetPickles'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['DillPickles'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['SpicyPickles'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem(Config.Inventory['BreadAndButterPickles'].db_obj, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

------------------------------- Cucumber Farming ----------------------------

RegisterServerEvent('qb-simplefarming:cucumberpicking', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cucumberfarming = 1
    Player.Functions.AddItem(Config.Inventory['Cucumber'].db_obj, cucumberfarming)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Cucumber'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['farm_picked'].. " " ..cucumberfarming.. " " ..Config.Alerts['cucumber_name'])
end)


------------------------------- Cucumber Checking ----------------------------

QBCore.Functions.CreateCallback('qb-simplefarming:cucumbercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['Cucumber'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:slicedcucumbercheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['SlicedCucumber'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:sweetpicklescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['SweetPickles'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:dillpicklescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['DillPickles'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:spicypicklescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['SpicyPickles'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

QBCore.Functions.CreateCallback('qb-simplefarming:breadandbutterpicklescheck', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.Inventory['BreadAndButterPickles'].db_obj) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


------------------------------- Cucumber Processing ----------------------------
RegisterServerEvent('qb-simplefarming:breadandbutterpicklesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cucumber = Player.Functions.GetItemByName(Config.Inventory['SlicedCucumbers'].db_obj)
    if not cucumber then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_cucumberpickling'])
        return false
    end

    local amount = cucumber.amount
    if amount >= 1 then
        amount = Config.CucumberPicklingProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedCucumbers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedCucumbers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cucumberpickling_processing'])
    local Cucumbers = Config.BreadAndButterPickleJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['BreadAndButterPickles'].db_obj, Cucumbers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['BreadAndButterPickles'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['breadandbutterpickles_trader'])
end)

RegisterServerEvent('qb-simplefarming:spicypicklesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cucumber = Player.Functions.GetItemByName(Config.Inventory['SlicedCucumbers'].db_obj)
    if not cucumber then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_cucumberpickling'])
        return false
    end

    local amount = cucumber.amount
    if amount >= 1 then
        amount = Config.CucumberPicklingProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedCucumbers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedCucumbers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cucumberpickling_processing'])
    local Cucumbers = Config.SpicyPicklesJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['SpicyPickles'].db_obj, Cucumbers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SpicyPickles'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['spicypickles_trader'])
end)

RegisterServerEvent('qb-simplefarming:dillpicklesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cucumber = Player.Functions.GetItemByName(Config.Inventory['SlicedCucumbers'].db_obj)
    if not cucumber then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_cucumberpickling'])
        return false
    end

    local amount = cucumber.amount
    if amount >= 1 then
        amount = Config.CucumberPicklingProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedCucumbers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedCucumbers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cucumberpickling_processing'])
    local Cucumbers = Config.DillPicklesJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['DillPickles'].db_obj, Cucumbers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['DillPickles'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['dillpickles_trader'])
end)

RegisterServerEvent('qb-simplefarming:sweetpicklesprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cucumber = Player.Functions.GetItemByName(Config.Inventory['SlicedCucumbers'].db_obj)
    if not cucumber then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_cucumberpickling'])
        return false
    end

    local amount = cucumber.amount
    if amount >= 1 then
        amount = Config.CucumberProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['SlicedCucumbers'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedCucumbers'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cucumber_processing'])
    local Cucumbers = Config.CucumberJars
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['SweetPickles'].db_obj, Cucumbers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SweetPickles'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['cucumber_trader'])
end)

RegisterServerEvent('qb-simplefarming:cucumberprocessing', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local cucumber = Player.Functions.GetItemByName(Config.Inventory['Cucumber'].db_obj)
    if not cucumber then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['error_cucumberslicing'])
        return false
    end

    local amount = cucumber.amount
    if amount >= 1 then
        amount = Config.CucumberSlicingProcessing
    else
      return false
    end

    if not Player.Functions.RemoveItem(Config.Inventory['Cucumber'].db_obj, amount) then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts['itemamount'])
        return false
    end

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['Cucumber'].db_obj], "remove")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['slicingcucumber_processing'])
    local Cucumbers = Config.Cucumbers
    Wait(750)
    Player.Functions.AddItem(Config.Inventory['SlicedCucumbers'].db_obj, Cucumbers)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Inventory['SlicedCucumbers'].db_obj], "add")
    TriggerClientEvent('QBCore:Notify', source, Config.Alerts['slicedcucumber_trader'])
end)


--[[
-- ❓ cucumber
Config.Inventory['Cucumber'] = {}
    Config.Inventory['Cucumber'].db_obj = "Cucumber"
    Config.Inventory['Cucumber'].in_game_obj = "Cucumber" 
Config.Inventory['SlicedCucumber'] = {}
    Config.Inventory['SlicedCucumber'].db_obj = "SlicedCucumber"
    Config.Inventory['SlicedCucumber'].in_game_obj = "SlicedCucumber" 
Config.Inventory['SweetPickles'] = {}
    Config.Inventory['SweetPickles'].db_obj = "SweetPickles"
    Config.Inventory['SweetPickles'].in_game_obj = "SweetPickles" 
Config.Inventory['DillPickles'] = {}
    Config.Inventory['DillPickles'].db_obj = "DillPickles"
    Config.Inventory['DillPickles'].in_game_obj = "DillPickles" 
Config.Inventory['SpicyPickles'] = {}
    Config.Inventory['SpicyPickles'].db_obj = "SpicyPickles"
    Config.Inventory['SpicyPickles'].in_game_obj = "SpicyPickles" 
Config.Inventory['BreadAndButterPickles'] = {}
    Config.Inventory['BreadAndButterPickles'].db_obj = "BreadAndButterPickles"
    Config.Inventory['BreadAndButterPickles'].in_game_obj = "BreadAndButterPickles" 


-- ❓ cucumber
['cucumber_fields'] = 'Cucumber Farm',
['cucumber_name'] = 'Cucumber', 
['Cucumber'] = 'Cucumber',
['SlicedCucumber'] = 'Sliced Cucumbers',
['SweetPickles'] = 'Sweet Pickles',
['DillPickles'] = 'Dill Pickles',
['SpicyPickles'] = 'Spicy Pickles', 
['BreadAndButterPickles'] = 'Bread And Butter Pickles Pickles', 

['picking_cucumbers'] = 'Picking Up Cucumber',
['slicingcucumbers_processingbar'] = 'Slicing Cucumbers',
['picklingcucumbers_processingbar'] = 'Pickling Cucumbers',
['slicingcucumbers_processing'] = 'Sliced ' ..Config.CucumberProcessing,
['picklingcucumbers_processing'] = 'Sliced ' ..Config.CucumberProcessing,
['slicedcucumber_trader'] = 'Made ' ..Config.SlicedCucumber.. ' sliced cucumbers',
['sweetpickles_trader'] = 'Made ' ..Config.SweetPickles.. ' Jar(s) of Sweet Pickles',
['dillpickles_trader'] = 'Made ' ..Config.DillPickles.. ' Jar(s) of Dill Pickles',
['spicypickles_trader'] = 'Made ' ..Config.SpicyPickles.. ' Jar(s) of Spicy Pickles',
['breadandbutterpickles_trader'] = 'Made ' ..Config.BreadAndButterPickles.. ' Jar(s) of Bread And Butter Pickles',
['cucumber_trader'] = 'Made ' ..Config.Cucumbers.. ' cucumbers',
['error_cucumberslicing'] = 'You don\'t have any cucumbers to slice',
['error_picklingcucumbers'] = 'You don\'t have any sliced cucumbers to pickle',

--]]