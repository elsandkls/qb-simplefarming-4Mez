
  
-- TODO
-- ✅ add new data field for pecans trees
-- ❓ find coords (zones, and blips), and adjust sizes as needed
PecansTreeField = {
  [1] = {
      label = "Pecans Farm",
      fruit = "Pecans",
      db_obj = Config.Inventory['Pecans'].db_obj,
      in_game_obj = Config.Inventory['Pecans'].in_game_obj,
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
PecanTreeZones = {
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


----------------------------------- Pecan Stuff -----------------------------------
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(PecanTreeField) do
        local PecanTreeFieldBlip = AddBlipForCoord(PecanTreeField[k].BlipCoord)
          SetBlipSprite(PecanTreeFieldBlip, PecanTreeField[k].Blip)
          SetBlipAsShortRange(PecanTreeFieldBlip, true)
          SetBlipScale(PecanTreeFieldBlip, 0.8)
          SetBlipColour(PecanTreeFieldBlip, PecanTreeField[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(PecanTreeField[k].label)
          EndTextCommandSetBlipName(PecanTreeFieldBlip)
  
        local PecanPicking = PolyZone:Create(PecanTreeField[k].zones, {
          name = PecanTreeField[k].label,
          minZ = PecanTreeField[k].minz,
          maxZ = PecanTreeField[k].maxz,
          debugPoly = false
        })
  
        PecanPicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:pecantree')
          else
            for _, v in pairs(PecanTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(PecanTreeField) do
        local PecanPicking = PolyZone:Create(PecanTreeField[k].zones, {
          name = PecanTreeField[k].label,
          minZ = PecanTreeField[k].minz,
          maxZ = PecanTreeField[k].maxz,
          debugPoly = false
        })
  
        PecanPicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:pecantree')
          else
            for _, v in pairs(PecanTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
  
  RegisterNetEvent('qb-simplefarming:processpecans', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:pecans', function(pecans)
      if pecans then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('pecan_processing', Config.Alerts['pecan_processingbar'], Config.ProcessingTime['pecan_processingtime'], false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:pecanprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not pecans then
        QBCore.Functions.Notify(Config.Alerts['error_pecanprocessor'], "error", 3000)
      end
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:pecantreeharvest', function()
    QBCore.Functions.Progressbar('pecan_pickingpecans', Config.Alerts['pecan_pickingbar'], 7500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {
      animDict = 'missmechanic',
      anim = 'work_base',
      flags = 16,
      }, {}, {}, function()
          TriggerServerEvent('qb-simplefarming:pecanpicking')
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:pecantree', function()
    for _, v in pairs(PecanTreeZones) do
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
            event = "qb-simplefarming:pecantreeharvest",
            icon = "fas fa-pecan-alt",  ---- double check 
            label = "Pick Pecans",
          },
        },
      distance = v.distance,
    })
    end
  end)
 
