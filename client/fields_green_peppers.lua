GreenPepperFieldZones1 = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(2005.03, 4832.2, 42.39),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=40.13,
        maxZ=44.13,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1990.39, 4847.37, 43.93),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=40.53,
        maxZ=44.53,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1950.36, 4899.32, 45.31),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.31,
        maxZ=46.31,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1940.63, 4908.97, 45.63),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.43,
        maxZ=46.43,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1909.42, 4850.82, 46.83),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=43.23,
        maxZ=47.23,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1895.87, 4864.11, 46.54),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.74,
        maxZ=46.74,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1889.45, 4856.51, 45.63),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.83,
        maxZ=45.83,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1902.78, 4843.23, 46.35),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.55,
        maxZ=46.55,
        distance = 5,
    },
}
 


GreenPepperFieldZones2 = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(356.92, 6473.85, 29.87),
        length = 2.0,
        width = 23.0,
        heading = 270,
        minZ=26.86,
        maxZ=31.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(329.02, 6473.51, 29.91),
        length = 2.0,
        width = 23.0,
        heading = 270,
        minZ=26.86,
        maxZ=31.36,
        distance = 5,
    },
}



GreenPepperFields1 = {
  [1] = {
      label = "Green Pepper Field",
      fruit = "Green Pepper",
      db_obj = Config.Inventory['Green Pepper'].db_obj,
      in_game_obj = Config.Inventory['Green Pepper'].in_game_obj,
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
GreenPepperFields2 = {
  [1] = {
      label = "Green Pepper Field",
      fruit = "Green Pepper",
      db_obj = Config.Inventory['Green Pepper'].db_obj,
      in_game_obj = Config.Inventory['Green Pepper'].in_game_obj,
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


RegisterNetEvent('qb-simplefarming:greenpeppersfield1', function()
    for _, v in pairs(GreenPepperFieldZones1) do
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
            event = "qb-simplefarming:greenpepperfield",
            icon = "fa fa-sign-language",
            label = "Pick From Garden",
          },
        },
        distance = v.distance,
      })
    end
  end)

  RegisterNetEvent('qb-simplefarming:greenpeppersfield2', function()
    for _, v in pairs(GreenPepperFieldZones1) do
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
            event = "qb-simplefarming:greenpepperfield",
            icon = "fa fa-sign-language",
            label = "Pick From Garden",
          },
        },
        distance = v.distance,
      })
    end
  end)
  
RegisterNetEvent('qb-simplefarming:greenpepperfield', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
    QBCore.Functions.Progressbar("greenpepper_picking", Config.Alerts['greenpepper_picking'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
    }, {}, {}, {}, function()
      TriggerEvent('animations:client:EmoteCommandStart', {"C"})
      TriggerServerEvent('qb-simplefarming:greenpepperpicking')
    end, function()
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)
  
  -- GreePepper --
  if Config.UseBlips then
    CreateThread(function()
      for k in pairs(GreenPepperFields1) do
        local GreePepperFieldBlips = AddBlipForCoord(GreenPepperFields1[k].BlipCoord)
          SetBlipSprite(GreePepperFieldBlips, GreenPepperFields1[k].Blip)
          SetBlipAsShortRange(GreePepperFieldBlips, true)
          SetBlipScale(GreePepperFieldBlips, 0.8)
          SetBlipColour(GreePepperFieldBlips, GreenPepperFields1[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(GreenPepperFields1[k].label)
          EndTextCommandSetBlipName(GreePepperFieldBlips)
  
        local GreePepperFieldLocation = PolyZone:Create(GreenPepperFields1[k].zones, {
          name = GreenPepperFields1[k].label,
          minZ = GreenPepperFields1[k].minz,
          maxZ = GreenPepperFields1[k].maxz,
          debugPoly = false
        })
  
        GreePepperFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:greenpeppersfield1')
          else
            for _, v in pairs(GreenPepperFieldZones1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(GreenPepperFields1) do
        local GreePepperFieldLocation = PolyZone:Create(GreenPepperFields1[k].zones, {
          name = GreenPepperFields1[k].label,
          minZ = GreenPepperFields1[k].minz,
          maxZ = GreenPepperFields1[k].maxz,
          debugPoly = false
        })
  
        GreePepperFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:greenpeppersfield1')
          else
            for _, v in pairs(GreenPepperFieldZones1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end

  -- GreePepper --
  if Config.UseBlips then
    CreateThread(function()
      for k in pairs(GreenPepperFields2) do
        local GreePepperFieldBlips = AddBlipForCoord(GreenPepperFields2[k].BlipCoord)
          SetBlipSprite(GreePepperFieldBlips, GreenPepperFields2[k].Blip)
          SetBlipAsShortRange(GreePepperFieldBlips, true)
          SetBlipScale(GreePepperFieldBlips, 0.8)
          SetBlipColour(GreePepperFieldBlips, GreenPepperFields2[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(GreenPepperFields2[k].label)
          EndTextCommandSetBlipName(GreePepperFieldBlips)
  
        local GreePepperFieldLocation = PolyZone:Create(GreenPepperFields2[k].zones, {
          name = GreenPepperFields2[k].label,
          minZ = GreenPepperFields2[k].minz,
          maxZ = GreenPepperFields2[k].maxz,
          debugPoly = false
        })
  
        GreePepperFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:greenpeppersfield2')
          else
            for _, v in pairs(GreenPepperFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(GreenPepperFields2) do
        local GreePepperFieldLocation = PolyZone:Create(GreenPepperFields2[k].zones, {
          name = GreenPepperFields2[k].label,
          minZ = GreenPepperFields2[k].minz,
          maxZ = GreenPepperFields2[k].maxz,
          debugPoly = false
        })
  
        GreePepperFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:greenpeppersfield2')
          else
            for _, v in pairs(GreenPepperFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end


  
RegisterNetEvent('qb-simplefarming:pickeledgreenpepper', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:greenpeppercheck', function(greenpepper)
    if greenpepper then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('greenpepper_processing', Config.Alerts['greenpepper_processingbar'], Config.ProcessingTime['greenpepper_smashingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:greenpepperprocessing")
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not greenpepper then
        QBCore.Functions.Notify(Config.Alerts['error_greenpepperslicing'], "error", 3000)
    end
  end)
end)