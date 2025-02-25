-- ❓ rice 
-- TODO
-- ✅ add new data field for rice
-- ❓ find coords, and adjust sizes as needed
RiceFieldZone = {
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
 
RiceFields = {
    [1] = {
        label = "Rice Field",
        fruit = "Rice",
        db_obj = Config.Inventory['Rice'].db_obj,
        in_game_obj = Config.Inventory['Rice'].in_game_obj,
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
 
  RegisterNetEvent('qb-simplefarming:rice', function()
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
            event = "qb-simplefarming:ricefarming",
            icon = "fa fa-sign-language",
            label = "Pick Rice",
          },
        },
        distance = v.distance,
      })
    end
  end)
 
  RegisterNetEvent('qb-simplefarming:ricefarming', function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
    QBCore.Functions.Progressbar("picking_rice", Config.Alerts['picking_rice'], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        RequestAnimDict("anim@heists@box_carry@")
        Wait(100)
        local riceprop
        riceprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(riceprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
        Wait(3500)
        DetachEntity(riceprop, 1, true)
        DeleteEntity(riceprop)
        DeleteObject(riceprop)
        TriggerServerEvent('qb-simplefarming:ricepicking')
    end, function()
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
    end)
  end)


  
-- Rice --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(RiceFields) do
        local RiceFieldBlips = AddBlipForCoord(RiceFields[k].BlipCoord)
          SetBlipSprite(RiceFieldBlips, RiceFields[k].Blip)
          SetBlipAsShortRange(RiceFieldBlips, true)
          SetBlipScale(RiceFieldBlips, 0.8)
          SetBlipColour(RiceFieldBlips, RiceFields[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(RiceFields[k].label)
          EndTextCommandSetBlipName(RiceFieldBlips)
  
        local RiceFieldLocation = PolyZone:Create(RiceFields[k].zones, {
          name = RiceFields[k].label,
          minZ = RiceFields[k].minz,
          maxZ = RiceFields[k].maxz,
          debugPoly = false
        })
  
        RiceFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:rice')
          else
            for _, v in pairs(RiceFieldZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(RiceFields) do
        local RiceFieldLocation = PolyZone:Create(RiceFields[k].zones, {
          name = RiceFields[k].label,
          minZ = RiceFields[k].minz,
          maxZ = RiceFields[k].maxz,
          debugPoly = false
        })
  
        RiceFieldLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('qb-simplefarming:rice')
          else
            for _, v in pairs(RiceFieldZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
   

  

RegisterNetEvent('qb-simplefarming:riceballs', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:ricecheck', function(rice)
    if rice then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('rice_processing', Config.Alerts['rice_processingbar'], Config.ProcessingTime['rice_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:riceprocessing")
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rice then
        QBCore.Functions.Notify(Config.Alerts['error_riceballmashing'], "error", 3000)
    end
  end)
end)

RegisterNetEvent('qb-simplefarming:riceflour', function()
  QBCore.Functions.TriggerCallback('qb-simplefarming:ricecheck', function(rice)
    if rice then
      TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
      QBCore.Functions.Progressbar('rice_processing', Config.Alerts['rice_processingbar'], Config.ProcessingTime['rice_processingtime'] , false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("qb-simplefarming:riceprocessing")
      end, function()
      QBCore.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not rice then
        QBCore.Functions.Notify(Config.Alerts['error_ricemashing'], "error", 3000)
    end
  end)
end)