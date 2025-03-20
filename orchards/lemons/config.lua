function init_lemons() 

    -- ❓ -- lemon -- 
    --
    Config.My_Item_Key  = "Lemon"  -- set this to be the key for everything else.
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
    Config.Inventory[Config.My_Item_Key].LABEL = "Lemon"  -- Label or name that shows up in any ui interactions
    Config.Inventory[Config.My_Item_Key].DB_OGJ = "lemon"  -- key or name of the object in your database
    Config.Inventory[Config.My_Item_Key].IN_GAME_OBJ = ""   --- in game object if you want to render it somewhere, blank if no object available 

    Config.Inventory[Config.My_Item_Key].PICKING_ANIM_DICT = "missmechanic"   --- in game object if you want to render it somewhere, blank if no object available 
    Config.Inventory[Config.My_Item_Key].PICKING_ANIM = "work_base"
    
    Config.Inventory[Config.My_Item_Key].LOOKING_ANIM_DICT = "missmechanic"   --- in game object if you want to render it somewhere, blank if no object available 
    Config.Inventory[Config.My_Item_Key].POOKING_ANIM = "work_base"
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


function init_lemon_orchard() 
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



function init_lemon_orchard_trees()  
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
    Config.Trees[my_key].UniqueTree[Config.tree_count].Name = 'Tree' .. Config.tree_count
 

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
end