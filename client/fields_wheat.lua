-- TODO
-- ✅ add new data field for wheat
-- ❓ find coords, and adjust sizes as needed
WheatFieldZone = {
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
 
WheatFields = {
    [1] = {
        label = "Wheat Field",  -- updated automatically based on language file func - fix_lables_plant_farms()
        fruit = "Wheat",  -- updated automatically based on language file func - fix_lables_plant_farms()
        db_obj = Config.Inventory['Wheat'].db_obj,
        in_game_obj = Config.Inventory['Wheat'].in_game_obj,
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
 

RegisterNetEvent('qb-simplefarming:wheat', function()
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
          event = "qb-simplefarming:wheatfarming",
          icon = "fa fa-sign-language",
          label = "Pick Wheat",
        },
      },
      distance = v.distance,
    })
  end
end)


RegisterNetEvent('qb-simplefarming:wheatfarming', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
    QBCore.Functions.Progressbar("picking_wheat", Config.Alerts['picking_wheat'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        RequestAnimDict("anim@heists@box_carry@")
        Wait(100)
        local wheatprop
        wheatprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(wheatprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
        Wait(3500)
        DetachEntity(wheatprop, 1, true)
        DeleteEntity(wheatprop)
        DeleteObject(wheatprop)
        TriggerServerEvent('qb-simplefarming:wheatpicking')
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)

   
-- Wheat --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(WheatFields) do
        local WheatFieldBlips = AddBlipForCoord(WheatFields[k].BlipCoord)
          SetBlipSprite(WheatFieldBlips, WheatFields[k].Blip)
          SetBlipAsShortRange(WheatFieldBlips, true)
          SetBlipScale(WheatFieldBlips, 0.8)
          SetBlipColour(WheatFieldBlips, WheatFields[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(WheatFields[k].label)
          EndTextCommandSetBlipName(WheatFieldBlips)
  
        local WheatFieldLocation = PolyZone:Create(WheatFields[k].zones, {
          name = WheatFields[k].label,
          minZ = WheatFields[k].minz,
          maxZ = WheatFields[k].maxz,
          debugPoly = false
        })
  
        WheatFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:wheat')
          else
            for _, v in pairs(WheatsFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(WheatFields) do
        local WheatFieldLocation = PolyZone:Create(WheatFields[k].zones, {
          name = WheatFields[k].label,
          minZ = WheatFields[k].minz,
          maxZ = WheatFields[k].maxz,
          debugPoly = false
        })
  
        WheatFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:wheat')
          else
            for _, v in pairs(WheatsFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
   
 