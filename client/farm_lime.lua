
  
-- TODO
-- ✅ add new data field for Limes trees
-- ❓ find coords (zones, and blips), and adjust sizes as needed
LimesTreeField = {
  [1] = {
      label = "Limes Farm",
      fruit = "Limes",
      db_obj = Config.Inventory['Limes'].db_obj,
      in_game_obj = Config.Inventory['Limes'].in_game_obj,
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
LimeTreeZones = {
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


----------------------------------- Lime Stuff -----------------------------------
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(LimeTreeField) do
        local LimeTreeFieldBlip = AddBlipForCoord(LimeTreeField[k].BlipCoord)
          SetBlipSprite(LimeTreeFieldBlip, LimeTreeField[k].Blip)
          SetBlipAsShortRange(LimeTreeFieldBlip, true)
          SetBlipScale(LimeTreeFieldBlip, 0.8)
          SetBlipColour(LimeTreeFieldBlip, LimeTreeField[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(LimeTreeField[k].label)
          EndTextCommandSetBlipName(LimeTreeFieldBlip)
  
        local LimePicking = PolyZone:Create(LimeTreeField[k].zones, {
          name = LimeTreeField[k].label,
          minZ = LimeTreeField[k].minz,
          maxZ = LimeTreeField[k].maxz,
          debugPoly = false
        })
  
        LimePicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:limetree')
          else
            for _, v in pairs(LimeTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(LimeTreeField) do
        local LimePicking = PolyZone:Create(LimeTreeField[k].zones, {
          name = LimeTreeField[k].label,
          minZ = LimeTreeField[k].minz,
          maxZ = LimeTreeField[k].maxz,
          debugPoly = false
        })
  
        LimePicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:limetree')
          else
            for _, v in pairs(LimeTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
  
  RegisterNetEvent('qb-simplefarming:processlimes', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:limes', function(limes)
      if limes then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('lime_processing', Config.Alerts['lime_processingbar'], Config.ProcessingTime['lime_processingtime'], false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:limeprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not limes then
        QBCore.Functions.Notify(Config.Alerts['error_limeprocessor'], "error", 3000)
      end
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:limetreeharvest', function()
    QBCore.Functions.Progressbar('lime_pickinglimes', Config.Alerts['lime_pickingbar'], 7500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {
      animDict = 'missmechanic',
      anim = 'work_base',
      flags = 16,
      }, {}, {}, function()
          TriggerServerEvent('qb-simplefarming:limepicking')
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:limetree', function()
    for _, v in pairs(LimeTreeZones) do
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
            event = "qb-simplefarming:limetreeharvest",
            icon = "fas fa-lime-alt",  -- double check
            label = "Pick Limes",
          },
        },
      distance = v.distance,
    })
    end
  end)
 