QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('qb-simplefarming:relievestress', function ()
    TriggerServerEvent('hud:server:RelieveStress', math.random(2, 5))
  end)
   