
-- TODO
-- ✅ add new data field for avacado trees
-- ❓ find coords (zones, and blips), and adjust sizes as needed
AvacadoTreeField = {
  [1] = {
      label = "Avacado Farm",
      fruit = "Avacado",
      db_obj = Config.Inventory['Avacado'].db_obj,
      in_game_obj = Config.Inventory['Avacado'].in_game_obj,
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
  [2] = {
      label = "Avacado Farm",
      fruit = "Avacado",
      db_obj = Config.Inventory['Avacado'].db_obj,
      in_game_obj = Config.Inventory['Avacado'].in_game_obj,
      BlipCoord = vector3(229.14, 6511.47, 31.3),
      Blip = 1,
      BlipColor = 2,
      zones = {
          vector2(289.20321655273, 6502.2163085938),
          vector2(287.77514648438, 6536.603515625), 
      },
      minZ = 29.864168167114,
      maxZ = 38.54899597168,
  }, 
}


-- ❓ find coords (zones, and blips), and adjust sizes as needed
AvacadoTreeZones = {
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


----------------------------------- Apple Stuff -----------------------------------
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(AvacadoTreeField) do
        local AvacadoTreeFieldBlip = AddBlipForCoord(AvacadoTreeField[k].BlipCoord)
          SetBlipSprite(AvacadoTreeFieldBlip, AvacadoTreeField[k].Blip)
          SetBlipAsShortRange(AvacadoTreeFieldBlip, true)
          SetBlipScale(AvacadoTreeFieldBlip, 0.8)
          SetBlipColour(AvacadoTreeFieldBlip, AvacadoTreeField[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(AvacadoTreeField[k].label)
          EndTextCommandSetBlipName(AvacadoTreeFieldBlip)
  
        local ApplePicking = PolyZone:Create(AvacadoTreeField[k].zones, {
          name = AvacadoTreeField[k].label,
          minZ = AvacadoTreeField[k].minz,
          maxZ = AvacadoTreeField[k].maxz,
          debugPoly = false
        })
  
        ApplePicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:avacadotree')
          else
            for _, v in pairs(AvacadoTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(AvacadoTreeField) do
        local ApplePicking = PolyZone:Create(AvacadoTreeField[k].zones, {
          name = AvacadoTreeField[k].label,
          minZ = AvacadoTreeField[k].minz,
          maxZ = AvacadoTreeField[k].maxz,
          debugPoly = false
        })
  
        ApplePicking:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:avacadotree')
          else
            for _, v in pairs(AvacadoTreeZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
  
  RegisterNetEvent('qb-simplefarming:processavacados', function()
    QBCore.Functions.TriggerCallback('qb-simplefarming:avacados', function(avacados)
      if avacados then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        QBCore.Functions.Progressbar('avacado_processing', Config.Alerts['avacado_processingbar'], Config.ProcessingTime['avacado_processingtime'], false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:avacadoprocess")
        end, function()
          QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
        end)
      elseif not avacados then
        QBCore.Functions.Notify(Config.Alerts['error_avacadoprocessor'], "error", 3000)
      end
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:avacadotreeharvest', function()
    QBCore.Functions.Progressbar('avacado_pickingavacados', Config.Alerts['avacado_pickingbar'], 7500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {
      animDict = 'missmechanic',
      anim = 'work_base',
      flags = 16,
      }, {}, {}, function()
          TriggerServerEvent('qb-simplefarming:avacadopicking')
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)
  
  RegisterNetEvent('qb-simplefarming:avacadotree', function()
    for _, v in pairs(AvacadoTreeZones) do
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
            event = "qb-simplefarming:avacadotreeharvest",
            icon = "fas fa-avacado-alt", --- check this TODO 
            label = "Pick Avacado",
          },
        },
      distance = v.distance,
    })
    end
  end)
 


  