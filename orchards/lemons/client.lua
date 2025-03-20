-- ❓ -- lemon --  
 -- Configs are in configs/orchard_appple.lua
----------------------------------- Code begins here -----------------------------------
--- load the variables. 
-- doing it this way allows us to create a command that allows admins to reset the variables without restarting the script.
init_lemons() 
init_lemon_orchard() 
init_lemon_orchard_trees()   
create_blips()
create_zones()
My_Item_Key  = "Lemon"  -- must match Config.My_Item_Key for this item in config_lemons.lua
-- this allows us to use the same config file structure for any number of items, but still customzie things.

---------------------------------------------------------------------------------------------------------
----------------------------------- Load the Blips -----------------------------------
---------------------------------------------------------------------------------------------------------
local function create_blips()
    local my_script = Config.ScriptName
    local this_func = "create_blips " .. '[' .. My_Item_Key.. ']'

    if Config.UseBlips then
        CreateThread(function()
            for orchards in pairs(Config.Orchards) do  -- orchards will be Lemon_Orchard_1, Lemon_Orchard_2, Lemon_Orchard_3   
                local my_func = this_func .. " | key: " .. orchards
                key_string =  orchards
                key_fruit = My_Item_Key
                if ContainsFruit(key_string, key_fruit) then  

                    -- verify data integreity, don't rely on user inputs
                    Config.Orchards[orchards].BlipCoord.x = VerifyVector3(Config.Orchards[orchards].BlipCoord.x, my_func) 
                    Config.Orchards[orchards].BlipCoord.y = VerifyVector3(Config.Orchards[orchards].BlipCoord.y, my_func) 
                    Config.Orchards[orchards].BlipCoord.z = VerifyVector3(Config.Orchards[orchards].BlipCoord.z, my_func)                      
                    local TreeFieldBlip = AddBlipForCoord(Config.Orchards[orchards].BlipCoord) -- vector 3

                    -- blips can be strings or numbers? double check 
                    Config.Orchards[orchards].Blip = VerifyBlipSprite(Config.Orchards[orchards].Blip, my_func) 
                    SetBlipSprite(TreeFieldBlip, Config.Orchards[orchards].Blip)

                    -- color can be numbers, probably ints?? double check 
                    Config.Orchards[orchards].BlipColor = VerifyBlipColor(Config.Orchards[orchards].BlipColor, my_func) 
                    SetBlipColour(TreeFieldBlip, Config.Orchards[orchards].BlipColor)
                    
                    -- defaults
                    SetBlipAsShortRange(TreeFieldBlip, true)  -- default
                    SetBlipScale(TreeFieldBlip, 0.8)    -- default  

                    -- color can be numbers, probably ints?? double check 
                    Config.Orchards[orchards].Label = VerifyBlipLabel(Config.Orchards[orchards].Label, my_func) 
                    BeginTextCommandSetBlipName("STRING")   -- default
                    AddTextComponentString(Config.Orchards[orchards].Label) 
                    EndTextCommandSetBlipName(TreeFieldBlip)     -- default      

                    Config.Orchards[orchards].ActiveBlip = TreeFieldBlip  -- tracking the blips for cleanup
                end 
            end -- for orchards
        )  -- end thread
    end  -- if blips
end 
 


---------------------------------------------------------------------------------------------------------
----------------------------------- Load the Zones -----------------------------------
---------------------------------------------------------------------------------------------------------
local function create_zones()
    local my_script = Config.ScriptName
    local this_func = "create_blips " .. '[' .. My_Item_Key.. ']'
    if Config.UseZones then
        CreateThread(function()
            for orchards in pairs(Config.Orchards) do  --  orchards will be Lemon_Orchard_1, Lemon_Orchard_2, Lemon_Orchard_3   

                local my_func = this_func .. " | key: " .. orchards
                key_string =  orchards
                key_fruit = My_Item_Key
                if ContainsFruit(key_string, key_fruit) then        
                               
                    local LemonPicking = PolyZone:Create(
                        Config.Orchards[orchards].Zones, {
                            name = str(Config.Orchards[orchards].Label),
                            minZ = Config.Orchards[orchards].minz,
                            maxZ = Config.Orchards[orchards].maxz,
                            debugPoly = false
                            }
                    ) -- end    PolyZone:Create

                    -- not familiar with this. does it loop through the zones array? doesn't seem like it would. have to test.
                    Config.Orchards[orchards].ActiveZones = LemonPicking

                    LemonPicking:onPlayerInOut(   
                        function(isPointInside)
                            if isPointInside then
                                inZone = true
                                TriggerEvent(Config.ScriptName..':'..My_Item_Key..'_tree_zone', orchards)  -- local client event
                            else
                                for _, v in pairs(Config.Orchards[orchards]) do
                                    exports['qb-target']:RemoveZone(v.Label)
                                    inZone = false
                                end
                            end
                        end
                    ) -- end LemonPicking:onPlayerInOut 
                end -- if ContainsFruit
            end -- for orchards
        )  -- end thread
    end  -- if zones
end

 
--- for the cool down to work I need to know which tree they clicked on. need to look at qb-target to see how it works
-- action associated with object?
local this_action1 = 'picking'
RegisterNetEvent(Config.ScriptName..':'..My_Item_Key..'_'..this_action1, function()
    QBCore.Functions.Progressbar(   My_Item_Key..this_action1,                           -- Name
                                    Config.Language[My_Item_Key].Messages[this_action1],  -- Label
                                    Config.Inventory[My_Item_Key].picking,              -- Time
                                    false,                                              -- useWhileDead 
                                    true, {                                             -- canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        }, {
        animDict = Config.Inventory[My_Item_Key].ANIM_DICT,
        anim = Config.Inventory[My_Item_Key].ANIM,
        flags = 16,
        }, 
        {}, 
        {}, 
        function()
            TriggerServerEvent(Config.ScriptName..':'..My_Item_Key..this_action1)
        end, 
        function()
        QBCore.Functions.Notify(Config.Language[My_Item_Key].Messages[this_action1..'_cancelled'], "error")
        end
    )
end)


local this_action2 = 'looking'  -- needs to match the "Label"  
-- action associated with object?
RegisterNetEvent(Config.ScriptName..':'..My_Item_Key..'_'..this_action2, function()
    QBCore.Functions.Progressbar(
        My_Item_Key..this_action2,                                  -- Name
        Config.Language[My_Item_Key].Messages[this_action2],        -- Label
        Config.Inventory[My_Item_Key].looking,                      -- Time 
        false,                                                      -- useWhileDead
        true, 
        {                                                     -- canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, 
        {
            animDict = Config.Inventory[My_Item_Key].LOOKING_ANIM_DICT,
            anim = Config.Inventory[My_Item_Key].LOOKING_ANIM,
            flags = 16,
        }, 
        {}, 
        {}, 
        function()
            ----- no actions
        end, 
        function()
            QBCore.Functions.Notify(Config.Language[My_Item_Key].Messages[this_action2..'_cancelled'], "error")
        end
    )
end)

 
local this_action3 = 'tree_zone'  -- needs to match the "Label" 
-- interactive label on the object, picking is available
RegisterNetEvent(Config.ScriptName..':'..My_Item_Key..'_'..this_action3, function()
    for _, v in pairs(Config.Trees[My_Item_Key].UniqueTree) do
        if v.CoolDown then

            if v.CoolDown == 0 then          
                if Config.Trees[my_key].UniqueTree[Config.tree_count].label == true then        
                    -- verify data integreity, don't rely on user inputs
                    v.Coords.x = VerifyVector3(v.Coords.x, my_func) 
                    v.Coords.y = VerifyVector3(v.Coords.y, my_func) 
                    v.Coords.z = VerifyVector3(v.Coords.z, my_func) 

                    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), 1, 1, 
                        { -- Name | Coords | ? | ? 
                            treename=v.Name,
                            heading= v.heading,
                            debugPoly=false,
                            minZ = v.minZ,
                            maxZ = v.maxZ,
                        },{
                            options = {
                                {
                                type = "client",
                                event = Config.ScriptName..':'..My_Item_Key..'_'..this_action1,
                                icon = "fas fa-".. string.lower(My_Item_Key) .."-alt",
                                label = Config.Language[My_Item_Key].Messages['pick'],
                                treename = v.Name,
                                },
                            },
                            distance = v.distance,
                        }
                    )
                end 
            else     
                if Config.Trees[my_key].UniqueTree[Config.tree_count].label == true then          
                    -- verify data integreity, don't rely on user inputs
                    v.Coords.x = VerifyVector3(v.Coords.x, my_func) 
                    v.Coords.y = VerifyVector3(v.Coords.y, my_func) 
                    v.Coords.z = VerifyVector3(v.Coords.z, my_func) 

                    exports['qb-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), 1, 1, 
                        { -- Name | Coords | ? | ? 
                            name=v.LABEL,
                            heading= v.heading,
                            debugPoly=false,
                            minZ = v.minZ,
                            maxZ = v.maxZ,
                        },{
                            options = {
                                {
                                type = "client",
                                event = Config.ScriptName..':'..My_Item_Key..'_'..this_action2,
                                icon = "fas fa-".. string.lower(My_Item_Key) .."-alt",
                                label =  Config.Language[My_Item_Key].Messages['picking_cooldown'] ..'['.. v.CoolDown .. ']', 
                                },
                            },
                            distance = v.distance,
                        }
                    )
                end
            end 
        end
    end
end)