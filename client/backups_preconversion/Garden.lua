

Garden = {
    [1] = {
        label = "Mixed Garden",
        fruit = "Veggie",
        db_obj = "Veggie",
        in_game_obj = "Veggie",
        BlipCoord = vector3(341.1, 6474.72, 29.83),
        Blip = 1,
        BlipColor = 69,
        zones = {
            vector2(368.0016784668, 6488.8334960938),
            vector2(317.75241088867, 6488.841796875),
            vector2(317.66741943359, 6457.5615234375),
            vector2(368.35971069336, 6457.5698242188)
        },
        minZ = 28.7,
        maxZ = 31.1
    },
    [2] = {
        label = "Tomatoe Garden",
        fruit = "Tomatoe",
        db_obj = "Tomatoe",
        in_game_obj = "Tomatoe",
        BlipCoord = vector3(2287.61, 4764.79, 38.64),
        Blip = 1,
        BlipColor = 1,
        zones = {
            vector2(2290.1796875, 4773.1831054688),
            vector2(2290.6130371094, 4777.0229492188),
            vector2(2284.1782226562, 4779.2802734375),
            vector2(2278.2651367188, 4754.7490234375),
            vector2(2290.5715332031, 4752.0361328125),
            vector2(2294.6804199219, 4769.38671875)
        },
        minZ = 36.7,
        maxZ = 39.1
    },
}

BigGarden = {
    [1] = {
        label = "Mixed Garden",
        fruit = "Veggie",
        db_obj = "Veggie",
        in_game_obj = "Veggie",
        BlipCoord = vector3(1937.96, 4848.61, 45.46),
        Blip = 1,
        BlipColor = 69,
        zones = {
            vector2(2012.6793212891, 4827.8100585938),
            vector2(2005.8937988281, 4817.59765625),
            vector2(1986.548828125, 4798.9814453125),
            vector2(1960.234375, 4825.30078125),
            vector2(1921.6357421875, 4799.4609375),
            vector2(1919.83203125, 4798.83984375),
            vector2(1894.9324951172, 4824.623046875),
            vector2(1871.9401855469, 4850.0053710938),
            vector2(1893.3538818359, 4873.5888671875),
            vector2(1898.8295898438, 4888.8442382812),
            vector2(1928.3820800781, 4918.9897460938),
            vector2(1933.2160644531, 4919.1010742188),
            vector2(1939.6021728516, 4915.6147460938)
        },
        minZ = 42.22,
        maxZ = 47.43
    },
}

 

 -- Big Garden
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(BigGarden) do
      local BigGardenBlips = AddBlipForCoord(BigGarden[k].BlipCoord)
        SetBlipSprite(BigGardenBlips, BigGarden[k].Blip)
        SetBlipAsShortRange(BigGardenBlips, true)
        SetBlipScale(BigGardenBlips, 0.8)
        SetBlipColour(BigGardenBlips, BigGarden[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(BigGarden[k].label)
        EndTextCommandSetBlipName(BigGardenBlips)
  
      local BigGardenLocation = PolyZone:Create(BigGarden[k].zones, {
          name = BigGarden[k].label,
          minZ = BigGarden[k].minz,
          maxZ = BigGarden[k].maxz,
          debugPoly = false
      })
  
        BigGardenLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('BigGrapeField')
            TriggerEvent('BigGreenPField')
            TriggerEvent('BigChillyField')
            TriggerEvent('TomatoesFields1')
          else
            for _, v in pairs(GrapeFieldZones1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(GreenPepperFieldZones1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(BigChilliPepperFieldsZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(TomatoesFieldsZone1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(BigGarden) do
        local BigGardenLocation = PolyZone:Create(BigGarden[k].zones, {
          name = BigGarden[k].label,
          minZ = BigGarden[k].minz,
          maxZ = BigGarden[k].maxz,
          debugPoly = false
        })
  
        BigGardenLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('BigGrapeField')
            TriggerEvent('BigGreenPField')
            TriggerEvent('BigChillyField')
            TriggerEvent('TomatoesFields1')
          else
            for _, v in pairs(GrapeFieldZones1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(GreenPepperFieldZones1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(BigChilliPepperFieldsZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(TomatoesFieldsZone1) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end

  -- Gradens --
if Config.UseBlips then
    CreateThread(function()
      for k in pairs(Garden) do
        local GardenBlips = AddBlipForCoord(Garden[k].BlipCoord)
          SetBlipSprite(GardenBlips, Garden[k].Blip)
          SetBlipAsShortRange(GardenBlips, true)
          SetBlipScale(GardenBlips, 0.8)
          SetBlipColour(GardenBlips, Garden[k].BlipColor)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(Garden[k].label)
          EndTextCommandSetBlipName(GardenBlips)
  
        local GardenLocation = PolyZone:Create(Garden[k].zones, {
          name = Garden[k].label,
          minZ = Garden[k].minz,
          maxZ = Garden[k].maxz,
          debugPoly = false
        })
  
        GardenLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('GrapeField')
            TriggerEvent('GreenPeppers')
            TriggerEvent('SmallChillyField')
            TriggerEvent('TomatoesFields2')
          else
            for _, v in pairs(GrapeFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(GreenPepperFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(SmallChilliPepperFieldsZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(TomatoesFieldsZone2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  else
    CreateThread(function()
      for k in pairs(Garden) do
        local GardenLocation = PolyZone:Create(Garden[k].zones, {
          name = Garden[k].label,
          minZ = Garden[k].minz,
          maxZ = Garden[k].maxz,
          debugPoly = false
        })
  
        GardenLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('GrapeField')
            TriggerEvent('GreenPeppers')
            TriggerEvent('SmallChillyField')
            TriggerEvent('TomatoesFields2')
          else
            for _, v in pairs(GrapeFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(GreenPepperFieldZones2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(SmallChilliPepperFieldsZone) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
            for _, v in pairs(TomatoesFieldsZone2) do
              exports['qb-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
        end)
      end
    end)
  end
   
   