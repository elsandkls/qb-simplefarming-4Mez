GrapeFieldZones1 = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1977.28, 4834.13, 44.02),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=40.22,
        maxZ=44.22,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1995.4, 4815.91, 43.36),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=39.36,
        maxZ=43.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1999.38, 4821.57, 42.52),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=38.92,
        maxZ=42.92,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1981.46, 4839.82, 43.93),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=40.13,
        maxZ=44.13,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1948.11, 4892.15, 45.89),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.31,
        maxZ=46.31,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1943.17, 4888.39, 46.36),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.96,
        maxZ=46.96,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1925.37, 4906.07, 47.31),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=44.31,
        maxZ=48.31,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1890.05, 4846.44, 46.13),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.13,
        maxZ=46.13,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1918.97, 4805.35, 44.9),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.1,
        maxZ=45.1,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1923.98, 4810.51, 44.14),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=40.54,
        maxZ=44.54,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1906.83, 4827.43, 45.41),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.81,
        maxZ=45.81,
        distance = 5,
    },
}


GrapeFieldZones2 = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(363.95, 6466.04, 30.36),
        length = 2.0,
        width = 11.0,
        heading = 270,
        minZ=28.86,
        maxZ=31.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(363.83, 6479.67, 30.09),
        length = 2.0,
        width = 11.0,
        heading = 270,
        minZ=27.86,
        maxZ=30.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(343.02, 6465.66, 30.24),
        length = 2.0,
        width = 11.0,
        heading = 270,
        minZ=27.86,
        maxZ=30.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(342.84, 6479.87, 29.44),
        length = 2.0,
        width = 11.0,
        heading = 270,
        minZ=27.86,
        maxZ=30.36,
        distance = 5,
    },
}


GrapeField1 = {
  [1] = {
      label = "Grape Field",
      fruit = "Grape",
      db_obj = Config.Inventory['Grape'].db_obj,
      in_game_obj = Config.Inventory['Grape'].in_game_obj,
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

GrapeField2 = {
  [1] = {
      label = "Grape Field",
      fruit = "Grape",
      db_obj = Config.Inventory['Grape'].db_obj,
      in_game_obj = Config.Inventory['Grape'].in_game_obj,
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


RegisterNetEvent('qb-simplefarming:GrapeFieldZones1', function()
  for _, v in pairs(GrapeFieldZones1) do
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
          event = "qb-simplefarming:grapefield",
          icon = "fa fa-sign-language",
          label = "Pick From Garden",
        },
      },
      distance = v.distance,
    })
  end
end)

RegisterNetEvent('qb-simplefarming:GrapeFieldZones2', function()
    for _, v in pairs(GrapeFieldZones2) do
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
              event = "qb-simplefarming:grapefield",
              icon = "fa fa-sign-language",
              label = "Pick From Garden",
            },
          },
        distance = v.distance,
      })
    end
  end)
 
 
  
RegisterNetEvent('qb-simplefarming:grapefield', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
    QBCore.Functions.Progressbar("grapefield_picking", Config.Alerts['grape_picking'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
    }, {}, {}, {}, function()
      TriggerEvent('animations:client:EmoteCommandStart', {"C"})
      TriggerServerEvent('qb-simplefarming:grapepicking')
    end, function()
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


 -- Grapes --
if Config.UseBlips then
  CreateThread(function()
    for k in pairs(GrapeField1) do
      local GrapesFieldBlips = AddBlipForCoord(GrapeField1[k].BlipCoord)
        SetBlipSprite(GrapesFieldBlips, GrapeField1[k].Blip)
        SetBlipAsShortRange(GrapesFieldBlips, true)
        SetBlipScale(GrapesFieldBlips, 0.8)
        SetBlipColour(GrapesFieldBlips, GrapeField1[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(GrapeField1[k].label)
        EndTextCommandSetBlipName(GrapesFieldBlips)

      local GrapesFieldLocation = PolyZone:Create(GrapeField1[k].zones, {
        name = GrapeField1[k].label,
        minZ = GrapeField1[k].minz,
        maxZ = GrapeField1[k].maxz,
        debugPoly = false
      })

      GrapesFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:GrapeFieldZones1')
        else
          for _, v in pairs(GrapeFieldZones1) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k in pairs(GrapeField1) do
      local GrapesFieldLocation = PolyZone:Create(GrapeField1[k].zones, {
        name = GrapeField1[k].label,
        minZ = GrapeField1[k].minz,
        maxZ = GrapeField1[k].maxz,
        debugPoly = false
      })

      GrapesFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:GrapeFieldZones1')
        else
          for _, v in pairs(GrapeFieldZones1) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end


   -- Grapes --
   if Config.UseBlips then
    CreateThread(function()
      for k in pairs(GrapeField2) do
        local GrapesFieldBlips = AddBlipForCoord(GrapeField2[k].BlipCoord)
          SetBlipSprite(GrapesFieldBlips, GrapeField2[k].Blip)
          SetBlipAsShortRange(GrapesFieldBlips, true)
          SetBlipScale(GrapesFieldBlips, 0.8)
          SetBlipColour(GrapesFieldBlips, GrapeField2[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(GrapeField2[k].label)
          EndTextCommandSetBlipName(GrapesFieldBlips)
  
        local GrapesFieldLocation = PolyZone:Create(GrapeField2[k].zones, {
          name = GrapeField2[k].label,
          minZ = GrapeField2[k].minz,
          maxZ = GrapeField2[k].maxz,
          debugPoly = false
        })
  
        GrapesFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:GrapeFieldZones2')
          else
            for _, v in pairs(GrapeFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(GrapeField2) do
        local GrapesFieldLocation = PolyZone:Create(GrapeField2[k].zones, {
          name = GrapeField2[k].label,
          minZ = GrapeField2[k].minz,
          maxZ = GrapeField2[k].maxz,
          debugPoly = false
        })
  
        GrapesFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:GrapeFieldZones2')
          else
            for _, v in pairs(GrapeFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end


  

RegisterNetEvent('qb-simplefarming:makinggrapejuice', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:grapecheck', function(grapes)
    if grapes then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('grape_processing', Config.Alerts['grape_processingbar'], Config.ProcessingTime['grape_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:grapeprocessing")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not grapes then
      QBCore.Functions.Notify(Config.Alerts['error_grape'], "error", 3000)
    end
  end)
end)
