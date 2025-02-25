-- TODO
-- ✅ add new data field for lemon trees
-- ❓ find coords (zones, and blips), and adjust sizes as needed
LemonTreeField = {
  [1] = {
      label = "Lemon Farm",
      fruit = "Lemon",
      db_obj = Config.Inventory['Lemon'].db_obj,
      in_game_obj = Config.Inventory['Lemon'].in_game_obj,
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
LemonTreeZones = {
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

----------------------------------- Lemon Stuff -----------------------------------
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(LemonTreeField) do
        local LemonTreeFieldBlip = AddBlipForCoord(LemonTreeField[k].BlipCoord)
          SetBlipSprite(LemonTreeFieldBlip, LemonTreeField[k].Blip)
          SetBlipAsShortRange(LemonTreeFieldBlip, true)
          SetBlipScale(LemonTreeFieldBlip, 0.8)
          SetBlipColour(LemonTreeFieldBlip, LemonTreeField[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(LemonTreeField[k].label)
          EndTextCommandSetBlipName(LemonTreeFieldBlip)
  
        local LemonPicking = PolyZone:Create(LemonTreeField[k].zones, {
          name = LemonTreeField[k].label,
          minZ = LemonTreeField[k].minz,
          maxZ = LemonTreeField[k].maxz,
          debugPoly = false
        })
  
        LemonPicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:lemontree')
          else
            for _, v in pairs(LemonTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(LemonTreeField) do
        local LemonPicking = PolyZone:Create(LemonTreeField[k].zones, {
          name = LemonTreeField[k].label,
          minZ = LemonTreeField[k].minz,
          maxZ = LemonTreeField[k].maxz,
          debugPoly = false
        })
  
        LemonPicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:lemontree')
          else
            for _, v in pairs(LemonTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
  
  RegisterNetEvent('qb-simplefarming:processlemons', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:lemons', function(lemons)
      if lemons then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('lemon_processing', Config.Alerts['lemon_processingbar'], Config.ProcessingTime['lemon_processingtime'], false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:lemonprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not lemons then
        QBCore.Functions.Notify(Config.Alerts['error_lemonprocessor'], "error", 3000)
      end
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:lemontreeharvest', function()
    QBCore.Functions.Progressbar('lemon_pickinglemons', Config.Alerts['lemon_pickingbar'], 7500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {
      animDict = 'missmechanic',
      anim = 'work_base',
      flags = 16,
      }, {}, {}, function()
          TriggerServerEvent('qb-simplefarming:lemonpicking')
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:lemontree', function()
    for _, v in pairs(LemonTreeZones) do
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
            event = "qb-simplefarming:lemontreeharvest",
            icon = "fas fa-lemon-alt",
            label = "Pick Lemons",
          },
        },
      distance = v.distance,
    })
    end
  end)
 

 