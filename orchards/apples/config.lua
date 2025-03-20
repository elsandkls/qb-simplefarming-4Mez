function init_apples() 

    -- ❓ -- apple -- 
    --
    Config.My_Item_Key  = "Apple"  -- set this to be the key for everything else.
    Config.My_Item_Key_Orchard = "Orchard"  -- set this to be the key for everything else.
    Config.Category = Config.Category or {} 
    Config.Category[Config.My_Item_Key] =  Config.My_Item_Key .. "s"  -- set this to be the category key for everything else.
    
    -- 
    Config.Inventory = Config.Inventory or {}  
    Config.Recipes = Config.Recipes or {} 
    --------------------------------------------------------
    -- recipe  
    Config.Inventory[Config.My_Item_Key] = {}  
    Config.Inventory[Config.My_Item_Key].KEY = Config.My_Item_Key
    Config.Inventory[Config.My_Item_Key].LABEL = "Apple"  -- Label or name that shows up in any ui interactions
    Config.Inventory[Config.My_Item_Key].DB_OGJ = "apple"  -- key or name of the object in your database
    Config.Inventory[Config.My_Item_Key].IN_GAME_OBJ = ""   --- in game object if you want to render it somewhere, blank if no object available 

    Config.Inventory[Config.My_Item_Key].PICKING_ANIM_DICT = "missmechanic"   --- animation dictionary if you want control of the picking actions 
    Config.Inventory[Config.My_Item_Key].PICKING_ANIM = "work_base"             -- animation key
    
    Config.Inventory[Config.My_Item_Key].LOOKING_ANIM_DICT = "missmechanic"   ---  animation dictionary if you want control of the picking actions 
    Config.Inventory[Config.My_Item_Key].POOKING_ANIM = "work_base"             -- animation key

    -- if your having issues with folks exploiting, try using random.
    -- using randoms makes it harder on scripts/bots to automate things,  
    -- also adds more interaction for manual players.
    -- harvest 
    Config.Inventory[Config.My_Item_Key].growing = math.random(250, 360)    --- int seconds 
    Config.Inventory[Config.My_Item_Key].picking = math.random(20, 40)   --- int seconds
    
    Config.Inventory[Config.My_Item_Key].min = math.random(1, 3)   --- int seconds
    Config.Inventory[Config.My_Item_Key].max = math.random(3, 5)   --- int seconds
    
    Config.Inventory[Config.My_Item_Key].looking = math.random(20, 40)   --- int seconds
    Config.Inventory[Config.My_Item_Key].harvest_limit = math.random(20, 40)    --- int quantity
    Config.Inventory[Config.My_Item_Key].harvest_cooldown = math.random(20, 360)   --- int seconds  
    
    -- sellable and buyable
    Config.Inventory[Config.My_Item_Key].Toggle_Buy = true  --- can it be purchased by a player   -- bool
    Config.Inventory[Config.My_Item_Key].Player_Buys_Price = math.random(5, 15)    --- int
    Config.Inventory[Config.My_Item_Key].Quantity_Limit_Buy = math.random(25, 50)       --- int

    Config.Inventory[Config.My_Item_Key].Toggle_Sell = true  --- can it be sold by a player  -- bool
    Config.Inventory[Config.My_Item_Key].Player_Sells_Price = math.random(5, 15)   --- int
    Config.Inventory[Config.My_Item_Key].Quantity_Limit_Sell = math.random(25, 50)  --- int  --- to limit quantity sold in a time frame, 0 for no limit on sold.
    Config.Inventory[Config.My_Item_Key].Time_Frame_Sell = math.random(25, 50)  -- to limit quantity sold in a time frame, 0 for no limit on time.
   
    --------------------------------------------------------
    if Config.ManualStore then 
        Config.Inventory[Config.My_Item_Key].Locations = {   -- list the key from the locations table listed in the config file. this is where the item can be bought and sold. -- strings
            {loc="fav_farms",flag="buy"},  --- buy = player can buy item 
            {loc="fav_farms",flag="sell"}  --- sell = player can buy item 
        }     
        -- buy and sell locations can be different places.     
        -- this has to be done manually if you want control over where things are bought and sold.
    else 
        for keyed_index in pairs(Config.Orchards) do    -- incomplete TODO
            Config.Seller_Locations
            Config.Buyer_Locations
        end 
    end 

    Config.Language = Config.Language or {}
    Config.Language[Config.My_Item_Key] = Config.Language[Config.My_Item_Key] or {}
    Config.Language[Config.My_Item_Key].Messages = {}
    Config.Language[Config.My_Item_Key].Messages['pick'] = 'Pick '.. Config.Inventory[Config.My_Item_Key].LABEL .. '(s)'; 
    Config.Language[Config.My_Item_Key].Messages['picked_start'] = 'You have picked '; 
    Config.Language[Config.My_Item_Key].Messages['picked_end'] =  " " .. Config.Inventory[Config.My_Item_Key].LABEL .. '(s)';
    Config.Language[Config.My_Item_Key].Messages['none_left'] = 'No '.. Config.Inventory[Config.My_Item_Key].LABEL .. '(s) here, come back later. ';

    Config.Language[Config.My_Item_Key].Messages['picking'] = 'Picking '.. Config.Inventory[Config.My_Item_Key].LABEL .. '(s)';  
    Config.Language[Config.My_Item_Key].Messages['picking_cooldown'] = 'Time remaining ..... ';
    Config.Language[Config.My_Item_Key].Messages['picking_cancelled'] =  Config.Inventory[Config.My_Item_Key].LABEL .. '(s) picking cancelled.';

    Config.Language[Config.My_Item_Key].Messages['looking'] = 'Looking for '.. Config.Inventory[Config.My_Item_Key].LABEL .. '(s)';
    Config.Language[Config.My_Item_Key].Messages['looking_cancelled'] = 'Search cancelled. ';
 
end 


function init_apple_orchard() 
    -- Orchard Locations  -- zones on the map, and coords.
    Config.Orchards = Config.Orchards or {}  
    Config.orchard_count = 1
    Config.Trees = Config.Trees or {} 
    -- requires a specific format. 
    -- set the category
    -- then you can change "orchard1" part to anything you want.
    ---------------------------------------------------------------
    ---------------------------------------------------------------
    my_key = Config.Category[Config.My_Item_Key] .. '_' ..  Config.My_Item_Key_Orchard .. '_' .. Config.orchard_count
    Config.Orchards[my_key] = {}
    Config.Orchards[my_key].KEY = Config.My_Item_Key
    Config.Orchards[my_key].Label = Config.My_Item_Key .. " Farm " .. Config.orchard_count   -- you can name the farms ##################################
    Config.Orchards[my_key].BlipCoord = vector3(2395.57, 4704.02, 33.65)
    Config.Orchards[my_key].Blip = 1
    Config.Orchards[my_key].BlipColor = 2
    Config.Orchards[my_key].Zones = {    -- points of a poly zone, as many as you want or as small as 3 for a triangle.
            vector3(2452.8928222656, 4672.4086914062, 00.00),
            vector3(2439.8227539062, 4687.1166992188, 00.00),
            vector3(2414.7272949219, 4712.7700195312, 00.00),
            vector3(2397.6696777344, 4729.6762695312, 00.00),
            vector3(2385.3977050781, 4742.1533203125, 00.00),
            vector3(2371.2399902344, 4755.1059570312, 00.00),
            vector3(2358.1411132812, 4763.0947265625, 00.00),
            vector3(2344.37109375, 4768.94140625, 00.00),
            vector3(2328.6586914062, 4773.5844726562, 00.00),
            vector3(2320.71484375, 4772.7905273438, 00.00),
            vector3(2317.4611816406, 4763.0546875, 00.00),
            vector3(2313.8427734375, 4746.5541992188, 00.00),
            vector3(2355.9326171875, 4721.61328125, 00.00),
            vector3(2381.279296875, 4696.46484375, 00.00),
            vector3(2399.1264648438, 4677.4370117188, 00.00),
            vector3(2424.4719238281, 4652.625, 00.00)
        },
    Config.Orchards[my_key].minz = 31.894828796387
    Config.Orchards[my_key].maxz = 39.898853302002
    Config.Trees[my_key] = {} 
    Config.Trees[my_key].UniqueTree = {}

    ---------------------------------------------------------------
    ---------------------------------------------------------------
    Config.orchard_count =     Config.orchard_count + 1
    my_key = Config.Category[Config.My_Item_Key] .. '_' ..  Config.My_Item_Key_Orchard .. '_' .. Config.orchard_count
    Config.Orchards[my_key] = {}
    Config.Orchards[my_key].label = Config.My_Item_Key .. " Farm " .. Config.orchard_count     -- you can name the farms or use the default ##################################
    Config.Orchards[my_key].BlipCoord = vector3(229.14, 6511.47, 31.3)
    Config.Orchards[my_key].Blip = 1
    Config.Orchards[my_key].BlipColor = 2
    Config.Orchards[my_key].zones = {     -- points of a poly zone, as many as you want or as small as 3 for a triangle.
            vector3(289.20321655273, 6502.2163085938, 00.00),
            vector3(287.77514648438, 6536.603515625, 00.00),
            vector3(222.20254516602, 6527.8041992188, 00.00),
            vector3(196.49742126465, 6514.607421875, 00.00),
            vector3(177.99984741211, 6493.1274414062, 00.00)
        },
    Config.Orchards[my_key].minZ = 29.864168167114
    Config.Orchards[my_key].maxZ = 38.54899597168 
    Config.Trees[my_key] = {} 
    Config.Trees[my_key].UniqueTree = {}

    ---------------------------------------------------------------
    ---------------------------------------------------------------
    Config.orchard_count =     Config.orchard_count + 1
    my_key = Config.Category[Config.My_Item_Key] .. '_' ..  Config.My_Item_Key_Orchard .. '_' .. Config.orchard_count
    Config.Orchards[my_key] = {}
    Config.Orchards[my_key].label = Config.My_Item_Key .. " Farm " .. Config.orchard_count 
    Config.Orchards[my_key].BlipCoord = vector3(344.48, 6516.05, 28.98)
    Config.Orchards[my_key].Blip = 1
    Config.Orchards[my_key].BlipColor = 2
    Config.Orchards[my_key].zones = {
                vector2(382.51480102539, 6501.0625),
                vector2(381.90463256836, 6536.7026367188),
                vector2(318.63339233398, 6535.7666015625),
                vector2(316.62408447266, 6500.5341796875)
            },
    Config.Orchards[my_key].minZ = 27.854934692383
    Config.Orchards[my_key].maxZ = 38.128866195679
    Config.Trees[my_key] = {} 
    Config.Trees[my_key].UniqueTree = {}


    ---------------------------------------------------------------
    ---------------------------------------------------------------
    Config.orchard_count =     Config.orchard_count + 1
    my_key = Config.Category[Config.My_Item_Key] .. '_' ..  Config.My_Item_Key_Orchard .. '_' .. Config.orchard_count
    Config.Orchards[my_key] = {}
    Config.Orchards[my_key].label = Config.My_Item_Key .. " Farm " .. Config.orchard_count 
    Config.Orchards[my_key].BlipCoord = vector3(2360.18, 5001.98, 43.37)
    Config.Orchards[my_key].Blip = 1
    Config.Orchards[my_key].BlipColor = 2
    Config.Orchards[my_key].Zones = {
                vector2(2399.5366210938, 4999.3530273438),
                vector2(2366.2536621094, 5033.7846679688),
                vector2(2329.6940917969, 5043.2255859375),
                vector2(2309.8139648438, 5020.3061523438),
                vector2(2300.6643066406, 4996.7055664062),
                vector2(2315.2868652344, 4981.8823242188),
                vector2(2333.2858886719, 4973.2338867188),
                vector2(2363.9282226562, 4972.4086914062),
                vector2(2385.8947753906, 4984.8833007812)
            },
    Config.Orchards[my_key].minZ = 41.743362426758
    Config.Orchards[my_key].maxZ = 45.949619293213
    Config.Trees[my_key] = {} 
    Config.Trees[my_key].UniqueTree = {}

    ---------------------------------------------------------------
    ---------------------------------------------------------------
    Config.orchard_count =     Config.orchard_count + 1
    my_key = Config.Category[Config.My_Item_Key] .. '_' ..  Config.My_Item_Key_Orchard .. '_' .. Config.orchard_count
    Config.Orchards[my_key] = {}
    Config.Orchards[my_key].label =  Config.My_Item_Key .. " Farm " .. Config.orchard_count 
    Config.Orchards[my_key].BlipCoord = vector3(2067.21, 4830.06, 43.28)
    Config.Orchards[my_key].Blip = 1
    Config.Orchards[my_key].BlipColor = 2
    Config.Orchards[my_key].Zones = {
                vector2(2152.3620605469, 4867.8896484375),
                vector2(2121.8264160156, 4895.2124023438),
                vector2(2108.3776855469, 4888.830078125),
                vector2(2064.2922363281, 4854.1962890625),
                vector2(2024.7045898438, 4814.4604492188),
                vector2(1974.3603515625, 4768.5590820312),
                vector2(1977.8233642578, 4767.5166015625),
                vector2(2012.8217773438, 4785.7797851562),
                vector2(2080.7509765625, 4817.8271484375),
                vector2(2116.6823730469, 4836.623046875)
            },
    Config.Orchards[my_key].minZ = 40.51
    Config.Orchards[my_key].maxZ = 41.98
    Config.Trees[my_key] = {} 
    Config.Trees[my_key].UniqueTree = {}
    ---------------------------------------------------------------
    ---------------------------------------------------------------

end 

------



function init_apple_orchard_trees()  
    ---------------------------------------------------------------
    -- requires a specific key for sorting later.
    --- orchard 1 should match up with the orchards table.
    -- based on the trees locations. 
    --- original data was not sorted like this and requires us to update and sort it.
    ---------------------------------------------------------------
    Config.tree_count = 1
    Config.orchard_count = 1

---- copy and paste these lines when you need to start a new orchard. 
    Config.orchard_count = Config.orchard_count + 1
    my_key = Config.Category[Config.My_Item_Key] .. '_' ..  Config.My_Item_Key_Orchard .. '_' .. Config.orchard_count
     
    --- use the above line to change the variable as needed when you find where the list changes. 
    --- can have as many orchards as you want, just use the name consistently.

    -- find out the exact radius of the top of the tree, and the height above ground, and we can  
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {}  
    Config.Trees[my_key].UniqueTree[Config.tree_count].coords = vector3(2401.53, 4687.95, 33.68)
    Config.Trees[my_key].UniqueTree[Config.tree_count].heading = 0
    Config.Trees[my_key].UniqueTree[Config.tree_count].minZ = 32.05
    Config.Trees[my_key].UniqueTree[Config.tree_count].maxZ = 36.05
    Config.Trees[my_key].UniqueTree[Config.tree_count].distance = 1.5 
    Config.Trees[my_key].UniqueTree[Config.tree_count].blip = false
    Config.Trees[my_key].UniqueTree[Config.tree_count].label = true
    Config.Trees[my_key].UniqueTree[Config.tree_count].CoolDown = 0
    Config.Trees[my_key].UniqueTree[Config.tree_count].LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count
    Config.Trees[my_key].UniqueTree[Config.tree_count].Name = ' Tree ' .. Config.tree_count
    Config.Trees[my_key].UniqueTree[Config.tree_count].Key = Config.tree_count
 

    -- long form of the variables
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {}  
    Config.Trees[my_key].UniqueTree[Config.tree_count].coords = vector3(2387.04, 4724.22, 34.12)
    Config.Trees[my_key].UniqueTree[Config.tree_count].heading = 0
    Config.Trees[my_key].UniqueTree[Config.tree_count].minZ=31.72
    Config.Trees[my_key].UniqueTree[Config.tree_count].maxZ=35.72
    Config.Trees[my_key].UniqueTree[Config.tree_count].distance = 1.5 -- defaults to 1.5 if missing
    Config.Trees[my_key].UniqueTree[Config.tree_count].blip = false  -- defaults to false if missing
    Config.Trees[my_key].UniqueTree[Config.tree_count].label = true  -- defaults to true if missing.
    Config.Trees[my_key].UniqueTree[Config.tree_count].CoolDown = 0  -- defaults to 0 if missing.
    Config.Trees[my_key].UniqueTree[Config.tree_count].LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count
    Config.Trees[my_key].UniqueTree[Config.tree_count].Name = 'Tree' .. Config.tree_count
    Config.Trees[my_key].UniqueTree[Config.tree_count].Key = Config.tree_count

    --- short form of the variables
    --## 1 - 10   
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {
        coords = vector3(2367.42, 4751.43, 33.74),
        heading = 0,
        minZ=30.94,
        maxZ=34.94,
        distance = 1.5, -- defaults to 1.5 if missing
        blip=false,   -- defaults to false if missing
        label=true,  -- defaults to true if missing.
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
        Key = Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {   
        coords = vector3(2353.55, 4760.43, 34.3),
        heading = 0,
        minZ=33.3,
        maxZ=35.3,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2343.7, 4755.61, 34.75),
        heading = 0,
        minZ=32.72,
        maxZ=36.72,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2339.5, 4767.24, 35.16),
        heading = 0,
        minZ=33.72,
        maxZ=37.72,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2327.75, 4770.84, 36.03),
        heading = 0,
        minZ=34.63,
        maxZ=37.23,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {  
        coords = vector3(2325.97, 4761.78, 35.95),
        heading = 0,
        minZ=34.63,
        maxZ=38.23,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2324.82, 4746.77, 36.04),
        heading = 0,
        minZ=33.44,
        maxZ=37.44,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2339.43, 4741.31, 35.12),
        heading = 0,
        minZ=33.44,
        maxZ=37.44,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2350.41, 4734.16, 34.81),
        heading = 0,
        minZ=33.44,
        maxZ=36.44,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2364.91, 4729.96, 34.15),
        heading = 0,
        minZ=31.55,
        maxZ=35.55,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    --## 11 - 20    
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {  
        coords = vector3(2359.24, 4723.84, 34.56),
        heading = 0,
        minZ=31.76,
        maxZ=35.76,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {   
        coords = vector3(2374.6, 4735.12, 33.76),
        heading = 0,
        minZ=30.96,
        maxZ=34.96,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {  
        coords = vector3(2386.84, 4736.18, 33.25),
        heading = 0,
        minZ=30.45,
        maxZ=34.45,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2383.17, 4713.19, 33.71),
        heading = 0,
        minZ=30.91,
        maxZ=34.91,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2381.58, 4700.71, 33.94),
        heading = 0,
        minZ=31.34,
        maxZ=34.94,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2402.18, 4717.22, 33.16),
        heading = 0,
        minZ=30.36,
        maxZ=34.36,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2404.42, 4704.08, 33.37),
        heading = 0,
        minZ=30.57,
        maxZ=34.57,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2412.75, 4707.36, 33.01),
        heading = 0,
        minZ=30.21,
        maxZ=34.21,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2390.02, 4691.07, 33.89),
        heading = 0,
        minZ=30.21,
        maxZ=34.21,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2423.98, 4697.82, 33.06),
        heading = 0,
        minZ=30.06,
        maxZ=34.06,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    --## 21 - 30   
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2422.16, 4686.7, 33.69),
        heading = 0,
        minZ=30.89,
        maxZ=34.89,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2407.06, 4676.87, 33.96),
        heading = 0,
        minZ=31.56,
        maxZ=35.56,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2419.54, 4674.09, 33.89),
        heading = 0,
        minZ=31.29,
        maxZ=35.29,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2434.38, 4678.72, 33.39),
        heading = 0,
        minZ=30.99,
        maxZ=34.99,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2443.51, 4672.27, 33.33),
        heading = 0,
        minZ=30.33,
        maxZ=34.33,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }
        
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2423.89, 4658.64, 33.46),
        heading = 0,
        minZ=31.06,
        maxZ=35.06,
        distance = 1.5,
        blip=false,
        label=true, 
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2389.91, 4992.31, 45.21),
        heading = 0,
        minZ=42.41,
        maxZ=46.41,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2389.62, 5004.42, 45.73),
        heading = 0,
        minZ=42.93,
        maxZ=46.93,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2376.46, 5016.76, 45.48),
        heading = 0,
        minZ=42.93,
        maxZ=46.93,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2377.49, 5003.99, 44.66),
        heading = 0,
        minZ=41.86,
        maxZ=45.86,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    --## 31 - 40   
    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2369.59, 5010.9, 44.38),
        heading = 0,
        minZ=41.58,
        maxZ=45.58,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2357.19, 5020.52, 43.9),
        heading = 0,
        minZ=41.3,
        maxZ=45.3,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2342.02, 5035.0, 44.34),
        heading = 0,
        minZ=41.54,
        maxZ=45.54,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2329.53, 5036.98, 44.5),
        heading = 0,
        minZ=41.7,
        maxZ=45.7,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2343.63, 5022.67, 43.52),
        heading = 0,
        minZ=40.92,
        maxZ=44.92,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2360.91, 5002.34, 43.4),
        heading = 0,
        minZ=40.8,
        maxZ=44.8,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2374.04, 4988.99, 44.02),
        heading = 0,
        minZ=41.42,
        maxZ=45.42,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2361.52, 4988.74, 43.35),
        heading = 0,
        minZ=40.55,
        maxZ=44.55,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2344.51, 5007.92, 42.74),
        heading = 0,
        minZ=39.94,
        maxZ=43.94,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2330.36, 5021.91, 42.93),
        heading = 0,
        minZ=40.13,
        maxZ=44.13,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2316.68, 5023.66, 43.3),
        heading = 0,
        minZ=40.7,
        maxZ=44.7,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {  
        coords = vector3(2331.01, 5007.99, 42.37),
        heading = 0,
        minZ=39.57,
        maxZ=43.57,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2349.42, 4989.62, 43.04),
        heading = 0,
        minZ=40.44,
        maxZ=44.44,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2361.61, 4976.4, 43.22),
        heading = 0,
        minZ=40.42,
        maxZ=44.42,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2349.42, 4975.85, 42.77),
        heading = 0,
        minZ=39.97,
        maxZ=43.97,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2336.21, 4976.07, 42.62),
        heading = 0,
        minZ=39.82,
        maxZ=43.82,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2317.97, 4984.55, 41.77),
        heading = 0,
        minZ=38.77,
        maxZ=42.77,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2317.08, 4994.16, 42.05),
        heading = 0,
        minZ=39.25,
        maxZ=43.25,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = {  
        coords = vector3(2304.87, 4997.04, 42.3),
        heading = 0,
        minZ=39.5,
        maxZ=43.5,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2316.94, 5008.96, 42.52),
        heading = 0,
        minZ=39.72,
        maxZ=43.72,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2331.51, 4996.47, 42.12),
        heading = 0,
        minZ=39.12,
        maxZ=43.12,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(377.96, 6505.88, 27.94),
        heading = 0,
        minZ=24.94,
        maxZ=28.94,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(370.23, 6505.92, 28.4),
        heading = 0,
        minZ=25.4,
        maxZ=29.4,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(363.13, 6505.82, 28.55),
        heading = 0,
        minZ=25.75,
        maxZ=29.75,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(355.38, 6505.02, 28.51),
        heading = 0,
        minZ=25.71,
        maxZ=29.71,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(347.74, 6505.41, 28.8),
        heading = 0,
        minZ=26.0,
        maxZ=30.0,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(339.77, 6505.53, 28.7),
        heading = 0,
        minZ=25.9,
        maxZ=29.9,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(330.82, 6505.69, 28.48),
        heading = 0,
        minZ=25.48,
        maxZ=29.48,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(321.92, 6505.44, 29.2),
        heading = 0,
        minZ=26.2,
        maxZ=30.2,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(321.87, 6517.33, 29.13),
        heading = 0,
        minZ=26.13,
        maxZ=30.13,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(330.41, 6517.67, 28.98),
        heading = 0,
        minZ=26.38,
        maxZ=30.38,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(338.85, 6517.19, 28.95),
        heading = 0,
        minZ=26.35,
        maxZ=30.35,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(347.65, 6517.5, 28.77),
        heading = 0,
        minZ=25.97,
        maxZ=29.97,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(355.28, 6517.28, 28.21),
        heading = 0,
        minZ=25.41,
        maxZ=29.41,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(362.62, 6517.64, 28.26),
        heading = 0,
        minZ=25.46,
        maxZ=29.46,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(369.96, 6517.68, 28.37),
        heading = 0,
        minZ=25.57,
        maxZ=29.57,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(378.0, 6517.52, 28.37),
        heading = 0,
        minZ=25.57,
        maxZ=29.57,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(369.4, 6531.86, 28.39),
        heading = 0,
        minZ=25.59,
        maxZ=29.59,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(361.39, 6531.46, 28.35),
        heading = 0,
        minZ=25.55,
        maxZ=29.55,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(353.77, 6530.84, 28.39),
        heading = 0,
        minZ=25.59,
        maxZ=29.59,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(345.99, 6531.54, 28.75),
        heading = 0,
        minZ=25.95,
        maxZ=29.95,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(338.41, 6531.29, 28.55),
        heading = 0,
        minZ=25.8,
        maxZ=29.95,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(329.58, 6531.13, 28.63),
        heading = 0,
        minZ=25.83,
        maxZ=29.83,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(321.75, 6531.13, 29.12),
        heading = 0,
        minZ=26.32,
        maxZ=30.32,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(282.16, 6506.62, 30.14),
        heading = 0,
        minZ=27.14,
        maxZ=31.14,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(273.44, 6507.42, 30.39),
        heading = 0,
        minZ=27.59,
        maxZ=31.59,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(263.95, 6506.16, 30.67),
        heading = 0,
        minZ=27.87,
        maxZ=31.87,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(263.95, 6506.16, 30.67),
        heading = 0,
        minZ=27.87,
        maxZ=31.87,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(256.11, 6503.95, 30.84),
        heading = 0,
        minZ=28.04,
        maxZ=32.04,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    } 

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(246.75, 6502.97, 31.04),
        heading = 0,
        minZ=28.04,
        maxZ=32.04,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(246.76, 6503.0, 31.04),
        heading = 0,
        minZ=27.84,
        maxZ=31.84,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(236.83, 6501.92, 31.21),
        heading = 0,
        minZ=28.41,
        maxZ=32.41,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(227.99, 6501.47, 31.31),
        heading = 0,
        minZ=28.71,
        maxZ=32.71,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(219.97, 6499.34, 31.38),
        heading = 0,
        minZ=28.38,
        maxZ=32.38,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(209.94, 6498.34, 31.45),
        heading = 0,
        minZ=28.65,
        maxZ=32.65,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(201.43, 6497.22, 31.47),
        heading = 0,
        minZ=28.47,
        maxZ=32.47,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(194.03, 6497.35, 31.52),
        heading = 0,
        minZ=28.72,
        maxZ=32.72,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(185.12, 6498.04, 31.54),
        heading = 0,
        minZ=28.74,
        maxZ=32.74,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(199.48, 6508.76, 31.51),
        heading = 0,
        minZ=28.51,
        maxZ=32.51,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(208.51, 6509.88, 31.48),
        heading = 0,
        minZ=28.48,
        maxZ=32.48,
        distance = 1.5,
        blip=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(217.78, 6510.39, 31.4),
        heading = 0,
        minZ=28.6,
        maxZ=32.6,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(225.82, 6511.73, 31.34),
        heading = 0,
        minZ=28.54,
        maxZ=32.54,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(234.37, 6512.68, 31.24),
        heading = 0,
        minZ=28.44,
        maxZ=32.44,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(244.76, 6515.25, 31.1),
        heading = 0,
        minZ=28.1,
        maxZ=32.1,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(253.58, 6514.11, 30.94),
        heading = 0,
        minZ=27.94,
        maxZ=31.94,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(262.23, 6516.63, 30.73),
        heading = 0,
        minZ=27.94,
        maxZ=31.94,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(272.57, 6519.16, 30.45),
        heading = 0,
        minZ=27.45,
        maxZ=31.45,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(281.57, 6518.98, 30.17),
        heading = 0,
        minZ=27.17,
        maxZ=31.17,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(280.46, 6530.68, 30.2),
        heading = 0,
        minZ=27.4,
        maxZ=31.4,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(270.45, 6530.64, 30.48),
        heading = 0,
        minZ=27.68,
        maxZ=31.68,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(261.59, 6527.62, 30.72),
        heading = 0,
        minZ=27.72,
        maxZ=31.72,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(251.96, 6527.45, 30.97),
        heading = 0,
        minZ=28.17,
        maxZ=32.17,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(242.94, 6526.22, 31.1),
        heading = 0,
        minZ=28.1,
        maxZ=32.1,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(233.22, 6524.61, 31.24),
        heading = 0,
        minZ=28.24,
        maxZ=32.24,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(223.85, 6523.69, 31.33),
        heading = 0,
        minZ=21.33,
        maxZ=32.33,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2146.38, 4867.68, 40.81),
        heading = 0,
        minZ=39.33,
        maxZ=42.33,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2123.04, 4883.89, 40.88),
        heading = 0,
        minZ=38.28,
        maxZ=42.28,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2102.17, 4877.77, 41.02),
        heading = 0,
        minZ=38.22,
        maxZ=42.22,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2117.44, 4842.01, 41.54),
        heading = 0,
        minZ=38.5,
        maxZ=42.5,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2098.33, 4841.46, 41.55),
        heading = 0,
        minZ=39.15,
        maxZ=43.15,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2083.39, 4853.39, 41.94),
        heading = 0,
        minZ=39.15,
        maxZ=43.15,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2060.33, 4842.74, 41.93),
        heading = 0,
        minZ=39.53,
        maxZ=43.53,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2086.2, 4825.65, 41.64),
        heading = 0,
        minZ=39.04,
        maxZ=43.04,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2064.04, 4819.52, 41.69),
        heading = 0,
        minZ=39.49,
        maxZ=43.49,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2031.57, 4802.19, 41.8),
        heading = 0,
        minZ=39.0,
        maxZ=43.0,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2016.38, 4800.59, 42.07),
        heading = 0,
        minZ=39.47,
        maxZ=43.47,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(2003.88, 4787.16, 41.98),
        heading = 0,
        minZ=39.18,
        maxZ=43.18,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    }

    Config.tree_count = Config.tree_count + 1
    Config.Trees[my_key].UniqueTree[Config.tree_count] = { 
        coords = vector3(1982.26, 4771.12, 41.86),
        heading = 0,
        minZ=39.66,
        maxZ=43.66,
        distance = 1.5,
        blip=false,
        label=true,
        CoolDown = 0,  -- defaults to 0 if missing.
        LABEL = Config.My_Item_Key .. " Tree " .. Config.tree_count,
        Name = 'Tree' .. Config.tree_count,
    } 

end