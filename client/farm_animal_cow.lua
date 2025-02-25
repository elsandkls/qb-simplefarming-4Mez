
CowFarmingZone1 = {
  {
      Name = math.random(1,99999999999999999999999),
      Coords = vector3(433.94, 6472.54, 28.77),
      length = 4.0,
      width = 6.4,
      heading = 320,
      minZ=28.37,
      maxZ=29.37,
      distance = 1.2,
  },
}
CowFarmingZone2 = {
  {
      Name = math.random(1,99999999999999999999999),
      Coords = vector3(425.9, 6463.02, 28.78),
      length = 4.0,
      width = 6.4,
      heading = 320,
      minZ=28.37,
      maxZ=29.37,
      distance = 1.2,
  },
}
CowFarmingZone3 = {
  {
      Name = math.random(1,99999999999999999999999),
      Coords = vector3(431.09, 6458.64, 28.76),
      length = 4.0,
      width = 6.4,
      heading = 320,
      minZ=28.37,
      maxZ=29.37,
      distance = 1.2,
  },
}

CowFarmingZone4 = {
  {
      Name = math.random(1,99999999999999999999999),
      Coords = vector3(436.39, 6454.36, 28.75),
      length = 4.0,
      width = 6.4,
      heading = 320,
      minZ=28.37,
      maxZ=29.37,
      distance = 1.2,
  },
}

RegisterNetEvent('qb-simplefarming:menufcow', function()
    local MeatCooking = {
      {
        header = "Cooking Food",
        isMenuHeader = true,
      },
      {
          header = '< Go Back',
      },
      {
          header = 'Cook Beef',
          params = {
              event = 'qb-simplefarming:beefprocessing',
          }
      },
      {
          header = 'Cook Roast',
          params = {
              event = 'qb-simplefarming:roastprocessing',
          }
      },
      {
          header = 'Cook Steak',
          params = {
              event = 'qb-simplefarming:steakprocessing',
          }
      },
      {
          header = 'Cook Ribs',
          params = {
              event = 'qb-simplefarming:ribsprocessing',
          }
      },
      {
          header = 'Cook Hamburger',
          params = {
              event = 'qb-simplefarming:hamburgerprocessing',
          }
      },
  }
  exports['qb-menu']:openMenu(MeatCooking)
  end)

  
exports['qb-target']:AddBoxZone("dairyfarmer", DairyProcessor.targetZone, 1, 1, {
	name = "dairyfarmer",
	heading = DairyProcessor.targetHeading,
	debugPoly = false,
	minZ = DairyProcessor.minZ,
	maxZ = DairyProcessor.maxZ,
}, {
	options = {
    {
      type = "client",
      event = "qb-simplefarming:dairyprocessor",
      icon = "fab fa-rocketchat",
      label = "Talk to dairy farmer",
    },
	},
	distance = 1.0
})

exports['qb-target']:AddBoxZone("GetCowBucket", vector3(419.13, 6470.74, 28.82), 1.4, 0.5, {
    name = "GetCowBucket",
    heading=315,
    debugPoly = false,
    minZ=24.37,
      maxZ=28.77,
    }, {
      options = {
        {
          type = "client",
          event = "qb-getcowbucket",
          icon = "fas fa-sign-in-alt",
          label = "Grab A Bucket",
        },
      },
    distance = 1.2
  })
     
RegisterNetEvent('AnimalCowFarming4', function()
    for _, v in pairs(CowFarmingZone4) do
      exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
        name=v.Name,
        heading= v.heading,
        debugPoly=false,
        minZ = v.minZ,
        maxZ = v.maxZ,
      },{
        options = {
          {
            type = "client",
            event = "qb-simplefarming:milkcow",
            icon = "fa fa-tint",
            label = "Milk Cow",
          },
          {
            type = "client",
            event = "qb-simplefarming:slaughtercow4",
            icon = "fa fa-cutlery",
            label = "Kill Cow",
          },
        },
        distance = v.distance,
      })
    end
  end)


  
RegisterNetEvent('AnimalCowFarming3', function()
    for _, v in pairs(CowFarmingZone3) do
      exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
        name=v.Name,
        heading= v.heading,
        debugPoly=false,
        minZ = v.minZ,
        maxZ = v.maxZ,
      },{
        options = {
          {
            type = "client",
            event = "qb-simplefarming:milkcow",
            icon = "fa fa-tint",
            label = "Milk Cow",
          },
          {
            type = "client",
            event = "qb-simplefarming:slaughtercow3",
            icon = "fa fa-cutlery",
            label = "Kill Cow",
          },
        },
        distance = v.distance,
      })
    end
  end)
  

  RegisterNetEvent('AnimalCowFarming1', function()
    for _, v in pairs(CowFarmingZone1) do
      exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
        name=v.Name,
        heading= v.heading,
        debugPoly=false,
        minZ = v.minZ,
        maxZ = v.maxZ,
      },{
        options = {
          {
            type = "client",
            event = "qb-simplefarming:milkcow",
            icon = "fa fa-tint",
            label = "Milk Cow",
          },
          {
            type = "client",
            event = "qb-simplefarming:slaughtercow1",
            icon = "fa fa-cutlery",
            label = "Kill Cow",
          },
        },
        distance = v.distance,
      })
    end
  end)
  
  RegisterNetEvent('AnimalCowFarming2', function()
    for _, v in pairs(CowFarmingZone2) do
      exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
        name=v.Name,
        heading= v.heading,
        debugPoly=false,
        minZ = v.minZ,
        maxZ = v.maxZ,
      },{
        options = {
          {
            type = "client",
            event = "qb-simplefarming:milkcow",
            icon = "fa fa-tint",
            label = "Milk Cow",
          },
          {
            type = "client",
            event = "qb-simplefarming:slaughtercow2",
            icon = "fa fa-cutlery",
            label = "Kill Cow",
          },
        },
        distance = v.distance,
      })
    end
  end)
   

  
RegisterNetEvent('qb-getcowbucket', function()
	local ped = PlayerPedId()
  RequestAnimDict("anim@heists@box_carry@")
	Wait(100)
  local milkprop
  milkprop = CreateObject(GetHashKey("prop_old_churn_01"), 0, 0, 0, true, true, true)
  AttachEntityToEntity(milkprop, ped, GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
  TaskPlayAnim(ped, "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
  Wait(2500)
  DetachEntity(milkprop, 1, true)
  DeleteEntity(milkprop)
  DeleteObject(milkprop)
  TriggerServerEvent('qb-simplefarming:getcowbucket')
end)



RegisterNetEvent('qb-simplefarming:milkcow', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:emptycowbucket', function(emptybucket)
      if emptybucket then
        local playerPed = PlayerPedId()
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_BUM_WASH', 0, false)
        QBCore.Functions.Progressbar('cow_milking', Config.Alerts['cow_milking'], 12000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
      }, {}, {}, function()
          ClearPedTasks(PlayerPedId())
          TriggerServerEvent("qb-simplefarming:cowmilking")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
      elseif not emptybucket then
        Wait(500)
        QBCore.Functions.Notify(Config.Alerts['emptybucket'], "error", 3000)
      end
    end)
  end)
   
  RegisterNetEvent('qb-simplefarming:steakprocessing', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:cowmeat', function(rawbeef)
      if rawbeef then
        TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
        QBCore.Functions.Progressbar('beef_processing', Config.Alerts['cow_processbar'], Config.ProcessingTime['beef_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("qb-simplefarming:beefprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not rawbeef then
        QBCore.Functions.Notify(Config.Alerts['error_rawmeat'], "error", 3000)
      end
    end)
  end)
  

RegisterNetEvent('qb-simplefarming:roastprocessing', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:cowmeat', function(rawbeef)
      if rawbeef then
        TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
        QBCore.Functions.Progressbar('beef_processing', Config.Alerts['cow_processbar'], Config.ProcessingTime['beef_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("qb-simplefarming:beefprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not rawbeef then
        QBCore.Functions.Notify(Config.Alerts['error_rawmeat'], "error", 3000)
      end
    end)
  end)

  
RegisterNetEvent('qb-simplefarming:beefprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:cowmeat', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['cow_processbar'], Config.ProcessingTime['beef_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:beefprocess")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_rawmeat'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:hamburgerprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:cowmeat', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['cow_processbar'], Config.ProcessingTime['beef_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:beefprocess")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_rawmeat'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:ribsprocessing', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:cowmeat', function(rawbeef)
    if rawbeef then
      TriggerEvent('animations:client:EmoteCommandStart', {"BBQ"})
      QBCore.Functions.Progressbar('beef_processing', Config.Alerts['cow_processbar'], Config.ProcessingTime['beef_processingtime'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:beefprocess")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rawbeef then
      QBCore.Functions.Notify(Config.Alerts['error_rawmeat'], "error", 3000)
    end
  end)
end)
  
  RegisterNetEvent('qb-simplefarming:dairyprocessor', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:milkbucketfull', function(milkbucket)
      if milkbucket then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('dairy_processing', Config.Alerts['cow_dairyprocessorbar'], Config.ProcessingTime['dairy_processing'] , false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:dairymilk")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not milkbucket then
        QBCore.Functions.Notify(Config.Alerts['error_milkprocessor'], "error", 3000)
        Wait(750)
        QBCore.Functions.Notify(Config.Alerts['error_milklocation'])
      end
    end)
  end)
   
 
----------------------------------- Cow Farming Stuff -----------------------------------

-- Animals
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(Barns) do
        local BarnBlip = AddBlipForCoord(Barns[k].BlipCoord)
          SetBlipSprite(BarnBlip, Barns[k].Blip)
          SetBlipAsShortRange(BarnBlip, true)
          SetBlipScale(BarnBlip, 0.8)
          SetBlipColour(BarnBlip, Barns[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(Barns[k].label)
          EndTextCommandSetBlipName(BarnBlip)
  
        local BarnFarming = PolyZone:Create(Barns[k].zones, {
            name = Barns[k].label,
            minZ = Barns[k].minz,
            maxZ = Barns[k].maxz,
            debugPoly = false
        })
  
        BarnFarming:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('AnimalCowFarming1')
            TriggerEvent('AnimalCowFarming2')
            TriggerEvent('AnimalCowFarming3')
            TriggerEvent('AnimalCowFarming4')
          else
            for _, v in pairs(CowFarmingZone1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(CowFarmingZone2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(CowFarmingZone3) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(CowFarmingZone4) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(Barns) do
        local BarnFarming = PolyZone:Create(Barns[k].zones, {
            name = Barns[k].label,
            minZ = Barns[k].minz,
            maxZ = Barns[k].maxz,
            debugPoly = false
        })
  
        BarnFarming:onPlayerInOut(function(isPointInside)
            if isPointInside then
              inZone = true
              TriggerEvent('AnimalCowFarming1')
              TriggerEvent('AnimalCowFarming2')
              TriggerEvent('AnimalCowFarming3')
              TriggerEvent('AnimalCowFarming4')
            else
              for _, v in pairs(CowFarmingZone1) do
                exports['qb-target']:RemoveZone(v.Name)
                inZone = false
              end
              for _, v in pairs(CowFarmingZone2) do
                exports['qb-target']:RemoveZone(v.Name)
                inZone = false
              end
              for _, v in pairs(CowFarmingZone3) do
                exports['qb-target']:RemoveZone(v.Name)
                inZone = false
              end
              for _, v in pairs(CowFarmingZone4) do
                exports['qb-target']:RemoveZone(v.Name)
                inZone = false
              end
            end
        end)
      end
    end)
  end
   
     