-- ❓ lettuce   
-- TODO
-- ✅ add new data field for lettuce
-- ❓ find coords, and adjust sizes as needed
LettuceFieldZone = {
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
    
LettuceFields = {
    [1] = {
        label = "Lettuce Field",
        fruit = "Lettuce",
        db_obj = Config.Inventory['Lettuce'].db_obj,
        in_game_obj = Config.Inventory['Lettuce'].in_game_obj,
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
 
RegisterNetEvent('qb-simplefarming:lettuce', function()
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
          event = "qb-simplefarming:lettucefarming",
          icon = "fa fa-sign-language",
          label = "Pick Lettuce",
        },
      },
      distance = v.distance,
    })
  end
end)
 
RegisterNetEvent('qb-simplefarming:lettucefarming', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
    QBCore.Functions.Progressbar("picking_lettuce", Config.Alerts['picking_lettuce'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        RequestAnimDict("anim@heists@box_carry@")
        Wait(100)
        local lettuceprop
        lettuceprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(lettuceprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
        Wait(3500)
        DetachEntity(lettuceprop, 1, true)
        DeleteEntity(lettuceprop)
        DeleteObject(lettuceprop)
        TriggerServerEvent('qb-simplefarming:lettucepicking')
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


  -- Lettuce --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(LettuceFields) do
        local LettuceFieldBlips = AddBlipForCoord(LettuceFields[k].BlipCoord)
          SetBlipSprite(LettuceFieldBlips, LettuceFields[k].Blip)
          SetBlipAsShortRange(LettuceFieldBlips, true)
          SetBlipScale(LettuceFieldBlips, 0.8)
          SetBlipColour(LettuceFieldBlips, LettuceFields[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(LettuceFields[k].label)
          EndTextCommandSetBlipName(LettuceFieldBlips)
  
        local LettuceFieldLocation = PolyZone:Create(LettuceFields[k].zones, {
          name = LettuceFields[k].label,
          minZ = LettuceFields[k].minz,
          maxZ = LettuceFields[k].maxz,
          debugPoly = false
        })
  
        LettuceFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:lettuce')
          else
            for _, v in pairs(LettucesFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(LettuceFields) do
        local LettuceFieldLocation = PolyZone:Create(LettuceFields[k].zones, {
          name = LettuceFields[k].label,
          minZ = LettuceFields[k].minz,
          maxZ = LettuceFields[k].maxz,
          debugPoly = false
        })
  
        LettuceFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:lettuce')
          else
            for _, v in pairs(LettucesFieldZones) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end