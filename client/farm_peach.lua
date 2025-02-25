
  
-- TODO
-- ✅ add new data field for peaches trees
-- ❓ find coords (zones, and blips), and adjust sizes as needed
PeachesTreeField = {
  [1] = {
      label = "Peaches Farm",
      fruit = "Peaches",
      db_obj = Config.Inventory['Peaches'].db_obj,
      in_game_obj = Config.Inventory['Peaches'].in_game_obj,
      BlipCoord = vector3(2395.57, 4704.02, 33.65),
      Blip = 1,
      BlipColor = 2,
      zones = {
          vector2(2452.8928222656, 4672.4086914062),
          vector2(2439.8227539062, 4687.1166992188), 
      },
      minz = 31.894828796387,
      maxz = 39.898853302002,
  }, 
}

-- ❓ find coords (zones, and blips), and adjust sizes as needed
PeachTreeZones = {
  {
      Name = math.random(1,99999999999999999999999),
      Coords = vector3(2401.53, 4687.95, 33.68),
      heading = 0,
      minZ=32.05,
      maxZ=36.05,
      distance = 1.5,
  },
  {
      Name = math.random(1,99999999999999999999999),
      Coords = vector3(2387.04, 4724.22, 34.12),
      heading = 0,
      minZ=31.72,
      maxZ=35.72,
      distance = 1.5,
  }, 
}

----------------------------------- Peach Stuff -----------------------------------
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(PeachTreeField) do
        local PeachTreeFieldBlip = AddBlipForCoord(PeachTreeField[k].BlipCoord)
          SetBlipSprite(PeachTreeFieldBlip, PeachTreeField[k].Blip)
          SetBlipAsShortRange(PeachTreeFieldBlip, true)
          SetBlipScale(PeachTreeFieldBlip, 0.8)
          SetBlipColour(PeachTreeFieldBlip, PeachTreeField[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(PeachTreeField[k].label)
          EndTextCommandSetBlipName(PeachTreeFieldBlip)
  
        local PeachPicking = PolyZone:Create(PeachTreeField[k].zones, {
          name = PeachTreeField[k].label,
          minZ = PeachTreeField[k].minz,
          maxZ = PeachTreeField[k].maxz,
          debugPoly = false
        })
  
        PeachPicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:peachtree')
          else
            for _, v in pairs(PeachTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(PeachTreeField) do
        local PeachPicking = PolyZone:Create(PeachTreeField[k].zones, {
          name = PeachTreeField[k].label,
          minZ = PeachTreeField[k].minz,
          maxZ = PeachTreeField[k].maxz,
          debugPoly = false
        })
  
        PeachPicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:peachtree')
          else
            for _, v in pairs(PeachTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
  
  RegisterNetEvent('qb-simplefarming:processpeaches', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:peaches', function(peaches)
      if peaches then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('peach_processing', Config.Alerts['peach_processingbar'], Config.ProcessingTime['peach_processingtime'], false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:peachprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not peaches then
        QBCore.Functions.Notify(Config.Alerts['error_peachprocessor'], "error", 3000)
      end
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:peachtreeharvest', function()
    QBCore.Functions.Progressbar('peach_pickingpeaches', Config.Alerts['peach_pickingbar'], 7500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {
      animDict = 'missmechanic',
      anim = 'work_base',
      flags = 16,
      }, {}, {}, function()
          TriggerServerEvent('qb-simplefarming:peachpicking')
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:peachtree', function()
    for _, v in pairs(PeachTreeZones) do
      exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), 1, 1, {
        name=v.Name,
        heading= v.heading,
        debugPoly=false,
        minZ = v.minZ,
        maxZ = v.maxZ,
      },{
        options = {
          {
            type = "client",
            event = "qb-simplefarming:peachtreeharvest",
            icon = "fas fa-peach-alt", -- double check
            label = "Pick Peaches",
          },
        },
      distance = v.distance,
    })
    end
  end)
 

 