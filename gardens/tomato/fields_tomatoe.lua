

TomatoesFieldsZone1 = {
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
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1966.44, 4825.11, 43.55),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.52,
        maxZ=45.00,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1926.41, 4867.16, 47.09),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=43.29,
        maxZ=47.29,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1906.03, 4887.31, 47.25),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=43.65,
        maxZ=47.65,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1879.68, 4847.43, 45.3),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.5,
        maxZ=45.5,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1893.68, 4834.01, 45.89),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=42.29,
        maxZ=46.29,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(1931.77, 4818.85, 44.46),
        length = 2.0,
        width = 11.0,
        heading = 315,
        minZ=41.46,
        maxZ=45.46,
        distance = 5,
    },
}
 

TomatoesFieldsZone2 = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(322.17, 6472.49, 29.96),
        length = 2.0,
        width = 23.0,
        heading = 270,
        minZ=26.86,
        maxZ=30.36,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(2290.14, 4760.52, 38.45),
        length = 11.8,
        width = 2.0,
        heading = 344,
        minZ=35.65,
        maxZ=39.65,
        distance = 5,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(2284.07, 4766.46, 38.62),
        length = 20.8,
        width = 2.0,
        heading = 344,
        minZ=35.65,
        maxZ=39.65,
        distance = 5,
    },
}



TomatoesFields2 = {
  [1] = {
      label = "Tomatoe Field",
      fruit = "Tomatoe",
      db_obj = Config.Inventory['Tomatoe'].db_obj,
      in_game_obj = Config.Inventory['Tomatoe'].in_game_obj,
      BlipCoord = vector3(509.84, 6491.57, 30.65),
      Blip = 1,
      BlipColor = 17,
      zones = {
          vector2(496.97012329102, 6518.8471679688),
          vector2(496.59399414062, 6461.634765625),
          vector2(522.32666015625, 6461.857421875),
          vector2(522.26049804688, 6519.0224609375)
      },
      minZ = 29.12,
      maxZ = 31.50
  },
}

TomatoesFields1 = {
  [1] = {
      label = "Tomatoe Field",   -- updated automatically based on language file func - fix_lables_plant_farms()
      fruit = "Tomatoe",   -- updated automatically based on language file func - fix_lables_plant_farms()
      db_obj = Config.Inventory['Tomatoe'].db_obj,
      in_game_obj = Config.Inventory['Tomatoe'].in_game_obj,
      BlipCoord = vector3(509.84, 6491.57, 30.65),
      Blip = 1,
      BlipColor = 17,
      zones = {
          vector2(496.97012329102, 6518.8471679688),
          vector2(496.59399414062, 6461.634765625),
          vector2(522.32666015625, 6461.857421875),
          vector2(522.26049804688, 6519.0224609375)
      },
      minZ = 29.12,
      maxZ = 31.50
  },
}


RegisterNetEvent('qb-simplefarming:TomatoesFields1', function()
    for _, v in pairs(TomatoesFieldsZone1) do
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
            event = "qb-simplefarming:tomatoefields",
            icon = "fa fa-sign-language",
            label = "Pick From Garden",
          },
        },
        distance = v.distance,
      })
    end
  end)
 
RegisterNetEvent('qb-simplefarming:TomatoesFields2', function()
    for _, v in pairs(TomatoesFieldsZone2) do
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
              event = "qb-simplefarming:tomatoefields",
              icon = "fa fa-sign-language",
              label = "Pick From Garden",
            },
          },
        distance = v.distance,
      })
    end
  end)

 

  
RegisterNetEvent('qb-simplefarming:tomatoefields', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"Mechanic4"})
    QBCore.Functions.Progressbar("tomatoes_picking", Config.Alerts['tomatoes_picking'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
    }, {}, {}, {}, function()
      TriggerEvent('animations:client:EmoteCommandStart', {"C"})
      TriggerServerEvent('qb-simplefarming:tomatoespicking')
    end, function()
      ClearPedTasks(PlayerPedId())
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


-- Tomatoe --
if Config.UseBlips then
  CreateThread(function()
    for k in pairs(TomatoesFields1) do
      local TomatoeFieldBlips = AddBlipForCoord(TomatoesFields1[k].BlipCoord)
        SetBlipSprite(TomatoeFieldBlips, TomatoesFields1[k].Blip)
        SetBlipAsShortRange(TomatoeFieldBlips, true)
        SetBlipScale(TomatoeFieldBlips, 0.8)
        SetBlipColour(TomatoeFieldBlips, TomatoesFields1[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(TomatoesFields1[k].label)
        EndTextCommandSetBlipName(TomatoeFieldBlips)

      local TomatoeFieldLocation = PolyZone:Create(TomatoesFields1[k].zones, {
        name = TomatoesFields1[k].label,
        minZ = TomatoesFields1[k].minz,
        maxZ = TomatoesFields1[k].maxz,
        debugPoly = false
      })

      TomatoeFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:TomatoesFields1')
        else
          for _, v in pairs(TomatoesFieldZones) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k in pairs(TomatoesFields1) do
      local TomatoeFieldLocation = PolyZone:Create(TomatoesFields1[k].zones, {
        name = TomatoesFields1[k].label,
        minZ = TomatoesFields1[k].minz,
        maxZ = TomatoesFields1[k].maxz,
        debugPoly = false
      })

      TomatoeFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:TomatoesFields1')
        else
          for _, v in pairs(TomatoesFieldZones) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end


-- Tomatoe --
if Config.UseBlips then
  CreateThread(function()
    for k in pairs(TomatoesFields2) do
      local TomatoeFieldBlips = AddBlipForCoord(TomatoesFields2[k].BlipCoord)
        SetBlipSprite(TomatoeFieldBlips, TomatoesFields2[k].Blip)
        SetBlipAsShortRange(TomatoeFieldBlips, true)
        SetBlipScale(TomatoeFieldBlips, 0.8)
        SetBlipColour(TomatoeFieldBlips, TomatoesFields2[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(TomatoesFields2[k].label)
        EndTextCommandSetBlipName(TomatoeFieldBlips)

      local TomatoeFieldLocation = PolyZone:Create(TomatoesFields2[k].zones, {
        name = TomatoesFields2[k].label,
        minZ = TomatoesFields2[k].minz,
        maxZ = TomatoesFields2[k].maxz,
        debugPoly = false
      })

      TomatoeFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:TomatoesFields2')
        else
          for _, v in pairs(TomatoesFieldZones) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
else
  CreateThread(function()
    for k in pairs(TomatoesFields2) do
      local TomatoeFieldLocation = PolyZone:Create(TomatoesFields2[k].zones, {
        name = TomatoesFields2[k].label,
        minZ = TomatoesFields2[k].minz,
        maxZ = TomatoesFields2[k].maxz,
        debugPoly = false
      })

      TomatoeFieldLocation:onPlayerInOut(function(isPointInside)
        if isPointInside then
          inZone = true
          TriggerEvent('qb-simplefarming:TomatoesFields2')
        else
          for _, v in pairs(TomatoesFieldZones) do
            exports['qb-target']:RemoveZone(v.Name)
            inZone = false
          end
        end
      end)
    end
  end)
end
 
RegisterNetEvent('qb-simplefarming:makingtomatoepaste', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:tomatoescheck', function(tomatoes)
    if tomatoes then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('tomatoes_processing', Config.Alerts['tomatoes_processing'], Config.ProcessingTime['tomatoes_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("qb-simplefarming:tomatoesprocessing")
      end, function()
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not tomatoes then
      QBCore.Functions.Notify(Config.Alerts['error_tomatoes'], "error", 3000)
    end
  end)
end)