PumpkinFieldZone = {
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(509.52, 6492.95, 29.36),
        length = 51.6,
        width = 5.8,
        heading = 0,
        minZ=26.16,
        maxZ=30.36,
        distance = 1.35,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(518.15, 6493.43, 30.37),
        length = 51.6,
        width = 5.8,
        heading = 0,
        minZ=26.16,
        maxZ=30.82,
        distance = 1.35,
    },
    {
        Name = math.random(1,99999999999999999999999),
        Coords = vector3(501.22, 6490.95, 30.64),
        length = 54.6,
        width = 5.8,
        heading = 0,
        minZ=26.16,
        maxZ=30.82,
        distance = 1.35,
    }
}


PumpkinField = {
    [1] = {
        label = "Pumpkin Field",  -- updated automatically based on language file func - fix_lables_plant_farms()
        fruit = "Pumpkin",  -- updated automatically based on language file func - fix_lables_plant_farms()
        db_obj = Config.Inventory['Pumpkin'].db_obj,
        in_game_obj = Config.Inventory['Pumpkin'].in_game_obj,
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
 
RegisterNetEvent('qb-simplefarming:pumpkin', function()
    for _, v in pairs(PumpkinFieldZone) do
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
            event = "qb-simplefarming:pumpkinfarming",
            icon = "fa fa-sign-language",
            label = "Pick Pumpkin",
          },
        },
        distance = v.distance,
      })
    end
  end)
   

  RegisterNetEvent('qb-simplefarming:pumpkinfarming', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
    QBCore.Functions.Progressbar("picking_pumpkins", Config.Alerts['picking_pumpkins'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        RequestAnimDict("anim@heists@box_carry@")
        Wait(100)
        local pumpkinprop
        pumpkinprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(pumpkinprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
        Wait(3500)
        DetachEntity(pumpkinprop, 1, true)
        DeleteEntity(pumpkinprop)
        DeleteObject(pumpkinprop)
        TriggerServerEvent('qb-simplefarming:pumpkinpicking')
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)

  
------------ Pumpkins --------------
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(PumpkinField) do
        local PumpkinFarmingBlip = AddBlipForCoord(PumpkinField[k].BlipCoord)
          SetBlipSprite(PumpkinFarmingBlip, PumpkinField[k].Blip)
          SetBlipAsShortRange(PumpkinFarmingBlip, true)
          SetBlipScale(PumpkinFarmingBlip, 0.8)
          SetBlipColour(PumpkinFarmingBlip, PumpkinField[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(PumpkinField[k].label)
          EndTextCommandSetBlipName(PumpkinFarmingBlip)
  
        local PumpkinFarmingLocation = PolyZone:Create(PumpkinField[k].zones, {
          name = PumpkinField[k].label,
          minZ = PumpkinField[k].minz,
          maxZ = PumpkinField[k].maxz,
          debugPoly = false
        })
  
        PumpkinFarmingLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:pumpkin')
          else
            for _, v in pairs(PumpkinFieldZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(PumpkinField) do
        local PumpkinFarmingLocation = PolyZone:Create(PumpkinField[k].zones, {
          name = PumpkinField[k].label,
          minZ = PumpkinField[k].minz,
          maxZ = PumpkinField[k].maxz,
          debugPoly = false
        })
  
        PumpkinFarmingLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:pumpkin')
          else
            for _, v in pairs(PumpkinFieldZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end

 
RegisterNetEvent('qb-simplefarming:pumpkinpie', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:pumpkincheck', function(pumpkin)
    if pumpkin then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('pumpkin_processing', Config.Alerts['pumpkin_processingbar'], Config.ProcessingTime['pumpkin_smashingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:pumpkinprocessing")
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not pumpkin then
        QBCore.Functions.Notify(Config.Alerts['error_pumpkinsmashing'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:pumpkinpieslices', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:pumpkincheck', function(pumpkin)
    if pumpkin then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('pumpkinpie_processing', Config.Alerts['pumpkinpie_processingbar'], Config.ProcessingTime['pumpkinpie_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:pumpkinpieprocessing")
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not pumpkin then
        QBCore.Functions.Notify(Config.Alerts['error_pumpkinpieslicing'], "error", 3000)
    end
  end)
end)