
CornFieldsZone1 = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(675.66, 6465.44, 32.68),
        length = 22.2,
        width = 126.4,
        heading = 0,
        minZ=26.16,
        maxZ=34.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(660.16, 6486.72, 30.05),
        length = 8.5,
        width = 95.0,
        heading = 0,
        minZ=26.16,
        maxZ=34.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(626.75, 6496.71, 30.23),
        length = 3.5,
        width = 25.0,
        heading = 0,
        minZ=26.16,
        maxZ=34.36,
        distance = 5,
    },
}
 

CornFields = {
  [1] = {
      label = "Corn Field",
      fruit = "Corn",
      db_obj = Config.Inventory['Corn'].db_obj,
      in_game_obj = Config.Inventory['Corn'].in_game_obj,
      BlipCoord = vector3(656.5, 6475.94, 31.98),
      Blip = 1,
      BlipColor = 46,
      zones = {
          vector2(740.30395507812, 6477.470703125),
          vector2(706.55572509766, 6485.8198242188),
          vector2(681.22143554688, 6492.6538085938),
          vector2(622.96466064453, 6500.4521484375),
          vector2(610.61926269531, 6501.2944335938),
          vector2(611.85559082031, 6458.0009765625),
          vector2(739.31109619141, 6458.2534179688)
      },
      minZ = 28.12,
      maxZ = 31.50
  },
}


RegisterNetEvent('qb-simplefarming:corn', function()
    for _, v in pairs(CornFieldsZone1) do
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
            event = "qb-simplefarming:cornfield",
            icon = "fa fa-sign-language",
            label = "Gather Corn",
          },
        },
        distance = v.distance,
      })
    end
  end)
  
RegisterNetEvent('qb-simplefarming:cornfield', function()
    QBCore.Functions.Progressbar("picking_corns", Config.Alerts['corn_picking'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
      }, {
        animDict = 'missmechanic',
        anim = 'work_base',
        flags = 16,
      }, {}, {}, function()
          TriggerServerEvent('qb-simplefarming:cornpicking')
      end, function()
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


  
-- Corn --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(CornFields) do
        local CornFieldBlips = AddBlipForCoord(CornFields[k].BlipCoord)
          SetBlipSprite(CornFieldBlips, CornFields[k].Blip)
          SetBlipAsShortRange(CornFieldBlips, true)
          SetBlipScale(CornFieldBlips, 0.8)
          SetBlipColour(CornFieldBlips, CornFields[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(CornFields[k].label)
          EndTextCommandSetBlipName(CornFieldBlips)
  
        local CornFieldLocation = PolyZone:Create(CornFields[k].zones, {
          name = CornFields[k].label,
          minZ = CornFields[k].minz,
          maxZ = CornFields[k].maxz,
          debugPoly = false
        })
  
        CornFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:corn')
          else
            for _, v in pairs(CornFieldsZone1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(CornFields) do
        local CornFieldLocation = PolyZone:Create(CornFields[k].zones, {
          name = CornFields[k].label,
          minZ = CornFields[k].minz,
          maxZ = CornFields[k].maxz,
          debugPoly = false
        })
  
        CornFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:corn')
          else
            for _, v in pairs(CornFieldsZone1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
   

  
  
RegisterNetEvent('qb-simplefarming:makecancorn', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:corncheck', function(corncob)
    if corncob then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('corn_processing', Config.Alerts['corn_processingbar'], Config.ProcessingTime['corn_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:cornprocessing")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not corncob then
      QBCore.Functions.Notify(Config.Alerts['error_corncob'], "error", 3000)
    end
  end)
end)