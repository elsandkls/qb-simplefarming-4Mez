-- ❓ cucumber
-- TODO
-- ✅ add new data field for cucumbers
-- ❓ find coords, and adjust sizes as needed
CucumbersFieldZones = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1984.67, 4806.66, 42.52),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.52,
        maxZ=45.00,
        distance = 5,
    },
}
  
CucumberFields = {
    [1] = {
        label = "Cucumber Field",
        fruit = "Cucumber",
        db_obj = Config.Inventory['Cucumber'].db_obj,
        in_game_obj = Config.Inventory['Cucumber'].in_game_obj,
        BlipCoord = vector3(656.5, 6475.94, 31.98),
        Blip = 1,
        BlipColor = 46,
        zones = {
            vector2(740.30395507812, 6477.470703125),
            vector2(706.55572509766, 6485.8198242188), 
        },
        minZ = 28.12,
        maxZ = 31.50
    },
}
 
RegisterNetEvent('qb-simplefarming:cucumbers', function()
  for _, v in pairs(PumpkinFieldZone) do
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
          event = "qb-simplefarming:cucumbersfarming",
          icon = "fa fa-sign-language",
          label = "Pick Cucumber",
        },
      },
      distance = v.distance,
    })
  end
end)

 

 
  RegisterNetEvent('qb-simplefarming:cucumberfarming', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
    QBCore.Functions.Progressbar("picking_cucumbers", Config.Alerts['picking_cucumbers'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        RequestAnimDict("anim@heists@box_carry@")
        Wait(100)
        local cucumberprop
        cucumberprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(cucumberprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
        Wait(3500)
        DetachEntity(cucumberprop, 1, true)
        DeleteEntity(cucumberprop)
        DeleteObject(cucumberprop)
        TriggerServerEvent('qb-simplefarming:cucumberpicking')
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


  
  
-- Cucumber --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(CucumberFields) do
        local CucumberFieldBlips = AddBlipForCoord(CucumberFields[k].BlipCoord)
          SetBlipSprite(CucumberFieldBlips, CucumberFields[k].Blip)
          SetBlipAsShortRange(CucumberFieldBlips, true)
          SetBlipScale(CucumberFieldBlips, 0.8)
          SetBlipColour(CucumberFieldBlips, CucumberFields[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(CucumberFields[k].label)
          EndTextCommandSetBlipName(CucumberFieldBlips)
  
        local CucumberFieldLocation = PolyZone:Create(CucumberFields[k].zones, {
          name = CucumberFields[k].label,
          minZ = CucumberFields[k].minz,
          maxZ = CucumberFields[k].maxz,
          debugPoly = false
        })
  
        CucumberFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:cucumbers')
          else
            for _, v in pairs(CucumbersFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(CucumberFields) do
        local CucumberFieldLocation = PolyZone:Create(CucumberFields[k].zones, {
          name = CucumberFields[k].label,
          minZ = CucumberFields[k].minz,
          maxZ = CucumberFields[k].maxz,
          debugPoly = false
        })
  
        CucumberFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:cucumbers')
          else
            for _, v in pairs(CucumbersFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
   

  RegisterNetEvent('qb-simplefarming:pickeledcucumbers', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:cucumbercheck', function(cucumber)
      if cucumber then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('cucumber_processing', Config.Alerts['cucumber_processingbar'], Config.ProcessingTime['cucumber_processingtime'] , false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:cucumberprocessing")
        end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not cucumber then
          QBCore.Functions.Notify(Config.Alerts['error_cucumbersmashing'], "error", 3000)
      end
    end)
  end)