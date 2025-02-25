
-- ❓ onions  
-- TODO
-- ✅ add new data field for onion
-- ❓ find coords, and adjust sizes as needed
OnionFieldZone = {
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
}
  
OnionFields = {
    [1] = {
        label = "Onion Field",
        fruit = "Onion",
        db_obj = Config.Inventory['Onion'].db_obj,
        in_game_obj = Config.Inventory['Onion'].in_game_obj,
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
 
RegisterNetEvent('qb-simplefarming:onion', function()
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
          event = "qb-simplefarming:onionfarming",
          icon = "fa fa-sign-language",
          label = "Pick Onion",
        },
      },
      distance = v.distance,
    })
  end
end)
 
  RegisterNetEvent('qb-simplefarming:onionfarming', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
    QBCore.Functions.Progressbar("picking_onions", Config.Alerts['picking_onions'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        RequestAnimDict("anim@heists@box_carry@")
        Wait(100)
        local onionprop
        onionprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(onionprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
        Wait(3500)
        DetachEntity(onionprop, 1, true)
        DeleteEntity(onionprop)
        DeleteObject(onionprop)
        TriggerServerEvent('qb-simplefarming:onionpicking')
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


  -- Onion --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(OnionFields) do
        local OnionFieldBlips = AddBlipForCoord(OnionFields[k].BlipCoord)
          SetBlipSprite(OnionFieldBlips, OnionFields[k].Blip)
          SetBlipAsShortRange(OnionFieldBlips, true)
          SetBlipScale(OnionFieldBlips, 0.8)
          SetBlipColour(OnionFieldBlips, OnionFields[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(OnionFields[k].label)
          EndTextCommandSetBlipName(OnionFieldBlips)
  
        local OnionFieldLocation = PolyZone:Create(OnionFields[k].zones, {
          name = OnionFields[k].label,
          minZ = OnionFields[k].minz,
          maxZ = OnionFields[k].maxz,
          debugPoly = false
        })
  
        OnionFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:onion')
          else
            for _, v in pairs(OnionsFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(OnionFields) do
        local OnionFieldLocation = PolyZone:Create(OnionFields[k].zones, {
          name = OnionFields[k].label,
          minZ = OnionFields[k].minz,
          maxZ = OnionFields[k].maxz,
          debugPoly = false
        })
  
        OnionFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:onion')
          else
            for _, v in pairs(OnionsFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end


    
RegisterNetEvent('qb-simplefarming:pickeledonions', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:onioncheck', function(onion)
    if onion then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('onion_processing', Config.Alerts['onion_processingbar'], Config.ProcessingTime['onion_smashingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:onionprocessing")
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not onion then
        QBCore.Functions.Notify(Config.Alerts['error_onionsmashing'], "error", 3000)
    end
  end)
end)
