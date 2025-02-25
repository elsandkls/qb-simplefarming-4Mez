
BigChilliPepperFieldsZone = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1990.32, 4811.15, 42.59),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=40.62,
        maxZ=44.62,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1971.51, 4830.25, 43.78),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.78,
        maxZ=44.58,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1916.75, 4898.88, 47.27),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=44.07,
        maxZ=48.07,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1930.97, 4871.82, 47.01),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=43.41,
        maxZ=47.41,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1910.96, 4891.38, 47.35),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=43.55,
        maxZ=47.55,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1929.26, 4831.36, 45.18),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.98,
        maxZ=45.98,
        distance = 5,
    },
}


SmallChilliPepperFieldsZone = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(350.2, 6473.89, 29.9),
        length = 2.0,
        width = 23.0,
        heading = 270,
        minZ=26.86,
        maxZ=30.36,
        distance = 5,
    },
}
 
SmallChilliPepperFields = {
  [1] = {
      label = "Pepper Field",
      fruit = "Pepper",
      db_obj = Config.Inventory['Pepper'].db_obj,
      in_game_obj = Config.Inventory['Pepper'].in_game_obj,
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

BigChilliPepperFields = {
  [1] = {
      label = "Pepper Field",
      fruit = "Pepper",
      db_obj = Config.Inventory['Pepper'].db_obj,
      in_game_obj = Config.Inventory['Pepper'].in_game_obj,
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



RegisterNetEvent('qb-simplefarming:bigchillipeppers', function()
    for _, v in pairs(BigChilliPepperFieldsZone) do
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
            event = "qb-simplefarming:chillfield",
            icon = "fa fa-sign-language",
            label = "Pick Peppers",
          },
        },
        distance = v.distance,
      })
    end
  end)

  
RegisterNetEvent('qb-simplefarming:smallchillipeppers', function()
    for _, v in pairs(SmallChilliPepperFieldsZone) do
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
              event = "qb-simplefarming:chillfield",
              icon = "fa fa-sign-language",
              label = "Pick Peppers",
            },
          },
        distance = v.distance,
      })
    end
  end)
 
  
  
RegisterNetEvent('qb-simplefarming:chillfield', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
    QBCore.Functions.Progressbar("chilly_picking", Config.Alerts['chillypepper_picking'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
    }, {}, {}, {}, function()
      TriggerEvent('animations:client:EmoteCommandStart', {"C"})
      TriggerServerEvent('qb-simplefarming:chillipepperpicking')
    end, function()
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


    
-- Pepper --
if Config.UseBlips then
  CreateThread(function()
    for k in pairs(BigChilliPepperFields) do
      local BigChilliPepperFieldBlips = AddBlipForCoord(BigChilliPepperFields[k].BlipCoord)
        SetBlipSprite(BigChilliPepperFieldBlips, BigChilliPepperFields[k].Blip)
        SetBlipAsShortRange(BigChilliPepperFieldBlips, true)
        SetBlipScale(BigChilliPepperFieldBlips, 0.8)
        SetBlipColour(BigChilliPepperFieldBlips, BigChilliPepperFields[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(BigChilliPepperFields[k].label)
        EndTextCommandSetBlipName(BigChilliPepperFieldBlips)

      local PepperFieldLocation = PolyZone:Create(BigChilliPepperFields[k].zones, {
        name = BigChilliPepperFields[k].label,
        minZ = BigChilliPepperFields[k].minz,
        maxZ = BigChilliPepperFields[k].maxz,
        debugPoly = false
      })

      PepperFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:bigchillipeppers')
        else
          for _, v in pairs(BigChilliPepperFieldsZone) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k in pairs(BigChilliPepperFields) do
      local PepperFieldLocation = PolyZone:Create(BigChilliPepperFields[k].zones, {
        name = BigChilliPepperFields[k].label,
        minZ = BigChilliPepperFields[k].minz,
        maxZ = BigChilliPepperFields[k].maxz,
        debugPoly = false
      })

      PepperFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:bigchillipeppers')
        else
          for _, v in pairs(BigChilliPepperFieldsZone) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end


-- Pepper --
if Config.UseBlips then
  CreateThread(function()
    for k in pairs(SmallChilliPepperFields) do
      local SmallChilliPepperFieldBlips = AddBlipForCoord(SmallChilliPepperFields[k].BlipCoord)
        SetBlipSprite(SmallChilliPepperFieldBlips, SmallChilliPepperFields[k].Blip)
        SetBlipAsShortRange(SmallChilliPepperFieldBlips, true)
        SetBlipScale(SmallChilliPepperFieldBlips, 0.8)
        SetBlipColour(SmallChilliPepperFieldBlips, SmallChilliPepperFields[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(SmallChilliPepperFields[k].label)
        EndTextCommandSetBlipName(SmallChilliPepperFieldBlips)

      local PepperFieldLocation = PolyZone:Create(SmallChilliPepperFields[k].zones, {
        name = SmallChilliPepperFields[k].label,
        minZ = SmallChilliPepperFields[k].minz,
        maxZ = SmallChilliPepperFields[k].maxz,
        debugPoly = false
      })

      PepperFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:smallchillipeppers')
        else
          for _, v in pairs(SmallChilliPepperFieldsZone) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k in pairs(SmallChilliPepperFields) do
      local PepperFieldLocation = PolyZone:Create(SmallChilliPepperFields[k].zones, {
        name = SmallChilliPepperFields[k].label,
        minZ = SmallChilliPepperFields[k].minz,
        maxZ = SmallChilliPepperFields[k].maxz,
        debugPoly = false
      })

      PepperFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:smallchillipeppers')
        else
          for _, v in pairs(SmallChilliPepperFieldsZone) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end
  
RegisterNetEvent('qb-simplefarming:makingchillysauce', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:chillycheck', function(hotstuff)
    if hotstuff then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('chillypepper_processing', Config.Alerts['chilly_hotsauce'], Config.ProcessingTime['chillypepper_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:makinghotsauce")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not hotstuff then
      QBCore.Functions.Notify(Config.Alerts['error_chilly'], "error", 3000)
    end
  end)
end) 