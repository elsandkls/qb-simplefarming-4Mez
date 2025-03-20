  

RegisterNetEvent('qb-simplefarming:relievestress', function ()
  TriggerServerEvent('hud:server:RelieveStress', math.random(2, 5))
end)
 

RegisterNetEvent('qb-simplefarming:menuprocessor', function()
  local Processor = {
    {
      header = "Farming Processor",
      isMenuHeader = true,
    },
    {
        header = '< Go Back',
    },
    {
        header = 'Make Apple Juice',
        params = {
            event = 'qb-simplefarming:processapples',
        }
    },
    {
        header = 'Make Pumpkin Pies',
        params = {
            event = 'qb-simplefarming:pumpkinpie',
        }
    },
    {
        header = 'Make Grape Juice',
        params = {
            event = 'qb-simplefarming:makinggrapejuice',
        }
    },
    {
        header = 'Make Caned Corn',
        params = {
            event = 'qb-simplefarming:makecancorn',
        }
    },
    {
        header = 'Make HotSauce',
        params = {
            event = 'qb-simplefarming:makingchillysauce',
        }
    },
    {
        header = 'Make TomatoPaste',
        params = {
            event = 'qb-simplefarming:makingtomatoepaste',
        }
    },
}
exports['qb-menu']:openMenu(Processor)
end)
 


exports['qb-target']:AddBoxZone("grammahouse", vector3(2438.07, 4975.82, 46.81), 1.0, 1.0, {
	name = "grammahouse",
	heading = 315,
	debugPoly = false,
  minZ = 46.76,
  maxZ = 47.16,
}, {
	options = {
    {
      type = "client",
      event = "qb-simplefarming:menufcow",
      icon = "Fas Fa-hands",
      label = "Start Cooking",
    },
	},
	distance = 1.0
})

exports['qb-target']:AddBoxZone("processingped", FoodProcessor.targetZone, 1, 1, {
	name = "processingtrader",
	heading = FoodProcessor.targetHeading,
	debugPoly = false,
	minZ = FoodProcessor.minZ,
	maxZ = FoodProcessor.maxZ,
}, {
	options = {
    {
      type = "client",
      event = "qb-simplefarming:menuprocessor",
      icon = "Fas Fa-hands",
      label = "Talk to farmer",
    },
	},
	distance = 1.0
})

exports['qb-target']:AddBoxZone("sellerped", Seller.targetZone, 1, 1, {
	name = "seller",
	heading = Seller.targetHeading,
	debugPoly = false,
	minZ = Seller.minZ,
	maxZ = Seller.maxZ,
}, {
	options = {
    {
      type = "server",
      event = "qb-simpefarming:sellItems",
      icon = "Fas Fa-hands",
      label = "Talk to farmer",
    },
	},
	distance = 1.0
})




-- added to make fixing labels for language support easier.
--- comment this out if you want to manually name each farm. 
function fix_lables_tree_farms()
  CreateThread(function()
      
-- ❓ pecan
      for index, v in pairs(PecansTreeField) do
          PecansTreeField[index].label = Config.Alerts['pecan_farm']
          PecansTreeField[index].fruit = Config.Alerts['pecan_name'] 
      end

-- ❓ lemons
      for index, v in pairs(LemonsTreeField) do
          LemonsTreeField[index].label = Config.Alerts['lemon_farm']
          LemonsTreeField[index].fruit = Config.Alerts['lemon_name'] 
      end

-- ❓ limes
      for index, v in pairs(LimesTreeField) do
          LimesTreeField[index].label = Config.Alerts['lime_farm']
          LimesTreeField[index].fruit = Config.Alerts['lime_name'] 
      end

-- ❓ peaches
      for index, v in pairs(PeachesTreeField) do
          PeachesTreeField[index].label = Config.Alerts['peach_farm']
          PeachesTreeField[index].fruit = Config.Alerts['peach_name'] 
      end

-- ❓ avacado
      for index, v in pairs(AvacadoTreeField) do
          AvacadoTreeField[index].label = Config.Alerts['avacado_farm']
          AvacadoTreeField[index].fruit = Config.Alerts['avacado_name'] 
      end

-- add support for apples
-- ❓ apples
      for index, v in pairs(AppleTreeField) do
          AppleTreeField[index].label = Config.Alerts['apple_farm']
          AppleTreeField[index].fruit = Config.Alerts['apple_name'] 
      end 


  end)
end



-- 2/24/2025
-- added to make fixing labels for language support easier.
--- comment this out if you want to manually name each farm. 
function fix_lables_plant_farms()
  CreateThread(function()
      
-- ❓ wheat
      for index, v in pairs(WheatFields) do
          WheatFields[index].label = Config.Alerts['wheat_fields']
          WheatFields[index].fruit = Config.Alerts['wheat_name'] 
      end

-- ❓ barley
      for index, v in pairs(BarleyFields) do
          BarleyFields[index].label = Config.Alerts['barley_fields']
          BarleyFields[index].fruit = Config.Alerts['barley_name'] 
      end

-- ❓ cucumber
      for index, v in pairs(CucumberFields) do
          CucumberFields[index].label = Config.Alerts['cucumber_fields']
          CucumberFields[index].fruit = Config.Alerts['cucumber_name'] 
      end

-- ❓ onions
      for index, v in pairs(OnionFields) do
          OnionFields[index].label = Config.Alerts['onion_fields']
          OnionFields[index].fruit = Config.Alerts['onion_name'] 
      end

-- ❓ lettuce
      for index, v in pairs(LettuceField) do
          LettuceField[index].label = Config.Alerts['lettuce_fields']
          LettuceField[index].fruit = Config.Alerts['lettuce_name'] 
      end
-- ❓ rice
      for index, v in pairs(RiceField) do
          RiceField[index].label = Config.Alerts['rice_fields']
          RiceField[index].fruit = Config.Alerts['rice_name'] 
      end

-- add support for pumpkin, corn
-- ❓ pumpkin
      for index, v in pairs(PumpkinField) do
          PumpkinField[index].label = Config.Alerts['pumpkin_fields']
          PumpkinField[index].fruit = Config.Alerts['pumpkin_name'] 
      end 
-- ❓ corn
      for index, v in pairs(CornFields) do
          CornFields[index].label = Config.Alerts['corn_fields']
          CornFields[index].fruit = Config.Alerts['corn_name'] 
      end 
-- ❓ tomatoe
    for index, v in pairs(TomatoesFields1) do
        CornFields[index].label = Config.Alerts['tomatoe_fields']
        CornFields[index].fruit = Config.Alerts['tomatoe_name'] 
    end 
    for index, v in pairs(TomatoesFields2) do
        CornFields[index].label = Config.Alerts['tomatoe_fields']
        CornFields[index].fruit = Config.Alerts['tomatoe_name'] 
    end 

  end)
end

 