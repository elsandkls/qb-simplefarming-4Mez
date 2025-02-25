--Start Time: 7:40 pm EST
--End Time:  

Config = Config or {}

Config.UseBlips = true                                 -- True / false option for toggling farm blips
Config.PedModel = "a_m_m_farmer_01"                    -- Ped model  https://wiki.rage.mp/index.php?title=Peds
Config.PedHash = 0x94562DD7                            -- Hash numbers for ped model

-- Blips
FoodProcessor = {
    targetZone = vector3(2853.98, 4557.02, 46.15),      -- qb-target vector
    targetHeading = 5,                                  -- qb-target box zone
    coords = vector4(2853.98, 4557.02, 46.15, 25.64),   -- Move Location (Ped and blip)
    SetBlipSprite = 568,                                -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 6,                                 -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.65,                                -- Blip Size
    SetBlipColour = 35,                                 -- Blip Color
    BlipLabel = "Food Processor",                       -- Blip Label
    minZ = 43.95,                                       -- qb-target Min
    maxZ = 47.95,                                       -- qb-target Max
}

DairyProcessor = {
    targetZone = vector3(2567.92, 4684.44, 33.05),
    targetHeading = 330,
    coords = vector4(2567.92, 4684.44, 33.05, 47.10),
    SetBlipSprite = 568,
    SetBlipDisplay = 6,
    SetBlipScale = 0.65,
    SetBlipColour = 32,
    BlipLabel = "Dairy Processor",
    minZ = 32.05,
    maxZ = 35.00,
}

Seller = {
    targetZone = vector3(760.4, -3194.97, 6.07),
    targetHeading = 265.82,
    coords = vector4(760.4, -3194.97, 6.07 - 1.00, 265.82),
    SetBlipSprite = 642,
    SetBlipDisplay = 6,
    SetBlipScale = 0.65,
    SetBlipColour = 17,
    BlipLabel = "Farm Seller",
    minZ = 4,
    maxZ = 7,
}

-- Pig Farm (Food)
Config.PigFood = 5                                      -- Food Amount (Pig Food)
Config.FoodPrice = 5                                    --  Pig Farm Food Price
PigFarmer = vector4(2166.11, 5003.84, 40.39, 312.56)    -- Ped Location
PigFarmerTargetZone = vector3(2166.11, 5003.84, 40.39)  -- QB-Target location
PigFarmerTzHeading = 305                                -- QB-Target Heading
PigFarmerMinZ = 40				                    	-- QB-Target MinZ
PigFarmerMaxZ = 42				                    	-- QB-Target MaxZ


--- adding new items 2/24/2025
-- TODO
-- ❓ Chickens Farm (Food)
Config.ChickenFood = 5                                   -- Food Amount (Pig Food)
Config.ChickenFoodPrice = 5                                    --  Pig Farm Food Price
ChickenFarmer = vector4(2166.11, 5003.84, 40.39, 312.56)    -- Ped Location
ChickenFarmerTargetZone = vector3(2166.11, 5003.84, 40.39)  -- QB-Target location
ChickenFarmerTzHeading = 305                                -- QB-Target Heading
ChickenFarmerMinZ = 40				                    	-- QB-Target MinZ
ChickenFarmerMaxZ = 42				                    	-- QB-Target MaxZ



-- Processing Items
Config.AppleProcessing = 3                              -- Trading Amount
Config.BeefProcessing = 2
Config.BaconProcesing = 3
Config.HamProcessing = 2
Config.PorkProcessing = 1
Config.SausageProcessing = 2
Config.MilkProcessing = 2
Config.PumpkinProcessing = 1
Config.CornProcessing = 2
Config.GrapeProcessing = 3
Config.ChillyProcessing = 3
Config.TomatoesProcessing = 4

--- adding new items 2/24/2025
-- TODO
-- ❓ lemons
Config.LemonsProcessing = 1
-- ❓ limes
Config.LimesProcessing = 1
-- ❓ peaches
Config.PeachesProcessing = 1
-- ❓ avacado
Config.AvacoadosProcessing = 1
-- ❓ pecans
Config.PecansProcessing = 1
-- ❓ lettuce 
Config.LettuceProcessing = 1 
-- ❓ onions
Config.OnionsProcessing = 1
-- ❓ cucumber
Config.CucumbersProcessing = 1
-- ❓ rice
Config.RiceProcessing = 1
-- ❓ barley
Config.BarleysProcessing = 1
-- ❓ wheat
Config.WheatProcessing = 1
-- ❓ chicken
Config.ChikcenProcessing = 1
-- ❓ eggs
Config.EggsProcessing = 1



-- Processed Items
Config.AppleJuice = 1                                   -- Received Amount
Config.BaconProcessed = 3
Config.HamProcessed = 2
Config.PorkProcessed = 1
Config.SausageProcessed = 2
Config.CowMeat = 2
Config.Milk = 4
Config.PumpkinBoxes = 3
Config.CornProcessed = 1
Config.GrapeProcessed = 1
Config.ChillyProcessed = 1
Config.TomatoesProcessed = 1

--- adding new items 2/24/2025
-- TODO
-- ❓ lemons
Config.LemonsProcessed = 1
-- ❓ limes
Config.LimesProcessed = 1
-- ❓ peaches
Config.PeachesProcessed = 1
-- ❓ avacado
Config.AvacoadosProcessed = 1
-- ❓ pecans
Config.PecansProcessed = 1
-- ❓ lettuce 
Config.LettuceProcessed = 1 
-- ❓ onions
Config.OnionsProcessed = 1
-- ❓ cucumber
Config.CucumbersProcessed = 1
-- ❓ rice
Config.RiceProcessed = 1
-- ❓ barley
Config.BarleysProcessed = 1
-- ❓ wheat
Config.WheatProcessed = 1
-- ❓ chicken
Config.ChikcenProcessed = 1
-- ❓ eggs
Config.EggsProcessed = 1

-- Processing time
Config.ProcessingTime = {
    ["apple_processingtime"] = 5000,                    -- MS = Seconds (5000 ms = 5 seconds)
    ["beef_processingtime"] = 10000,
    ["bacon_processingtime"] = 10000,
    ["ham_processingtime"] = 10000,
    ["pork_processingtime"] = 10000,
    ["sausage_processingtime"] = 10000,
    ["milk_tradingtime"] = 7500,
    ["pumpkin_smashingtime"] = 7500,
    ["grape_processingtime"] = 7500,
    ["chillypepper_processingtime"] = 7500,
    ["tomatoes_processingtime"] = 7500,
    --- adding new items 2/24/2025
    -- TODO
    -- ❓ lemons
        ["lemons_processingtime"] = 7500,
    -- ❓ limes
        ["limes_processingtime"] = 7500,
    -- ❓ peaches
        ["peaches_processingtime"] = 7500,
    -- ❓ avacado
        ["avacado_processingtime"] = 7500,
    -- ❓ pecans
        ["pecans_processingtime"] = 7500,
    -- ❓ lettuce  
        ["lettuce_processingtime"] = 7500,
    -- ❓ onions
        ["onions_processingtime"] = 7500,
    -- ❓ cucumber
        ["cucumber_processingtime"] = 7500,
    -- ❓ rice
        ["rice_processingtime"] = 7500,
    -- ❓ barley
        ["barley_processingtime"] = 7500,
    -- ❓ wheat
        ["whea_processingtime"] = 7500,
    -- ❓ chicken
        ["chicken_processingtime"] = 7500,
    -- ❓ chicken eggs
        ["eggs_processingtime"] = 7500,

}


-- Sell Items
Config.Sell = {
    ["apple"] = {
        ["price"] = math.random(5, 15)                  -- Seller Price
    },
    ["apple_juice"] = {
        ["price"] = math.random(25, 35)
    },
    ["milkbucket"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_beef"] = {
        ["price"] = math.random(25, 35)
    },
    ["beef"] = {
        ["price"] = math.random(25, 35)
    },
    ["milk"] = {
        ["price"] = math.random(25, 35)
    },
    ["rawpumpkin"] = {
        ["price"] = math.random(25, 35)
    },
    ["pumpkinpiebox"] = {
        ["price"] = math.random(25, 35)
    },
    ["slicedpie"] = {
        ["price"] = math.random(25, 35)
    },
    ["corncob"] = {
        ["price"] = math.random(25, 35)
    },
    ["canofcorn"] = {
        ["price"] = math.random(25, 35)
    },
    ["grapes"] = {
        ["price"] = math.random(25, 35)
    },
    ["grapejuice"] = {
        ["price"] = math.random(25, 35)
    },
    ["greenpepper"] = {
        ["price"] = math.random(25, 35)
    },
    ["chillypepper"] = {
        ["price"] = math.random(25, 35)
    },
    ["hotsauce"] = {
        ["price"] = math.random(25, 35)
    },
    ["tomato"] = {
        ["price"] = math.random(25, 35)
    },
    ["tomatopaste"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_bacon"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_sausage"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_pork"] = {
        ["price"] = math.random(25, 35)
    },
    ["raw_ham"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_bacon"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_sausage"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_pork"] = {
        ["price"] = math.random(25, 35)
    },
    ["cooked_ham"] = {
        ["price"] = math.random(25, 35)
    },
    ["pig_leather"] = {
        ["price"] = math.random(25, 35)
    },
    ["cow_leather"] = {
        ["price"] = math.random(25, 35)
    },


    --- adding new items 2/24/2025
    -- TODO - trees
    -- ❓ lemons
    ["lemons"] = {
        ["price"] = math.random(5, 10)
    },
    -- ❓ limes
    ["limes"] = {
        ["price"] = math.random(5, 10)
    },
    -- ❓ peaches
    ["peaches"] = {
        ["price"] = math.random(5, 10)
    },
    -- ❓ avacado
    ["avacado"] = {
        ["price"] = math.random(5, 10)
    },
    -- ❓ pecans
    ["pecans"] = {
        ["price"] = math.random(5, 10)
    }, 

    -- veg fields
    -- TODO - veggies
    -- ❓ lettuce  
    ["lettuce"] = {
        ["price"] = math.random(25, 35)
    },
    -- ❓ onions
    ["onions"] = {
        ["price"] = math.random(3, 10)
    },
    -- ❓ cucumber
    ["cucumber"] = {
        ["price"] = math.random(3, 10)
    },
    -- ❓ rice
    ["rice"] = {
        ["price"] = math.random(3, 10)
    },
    -- ❓ barley
    ["barley"] = {
        ["price"] = math.random(3, 10)
    },
    -- ❓ wheat
    ["wheat"] = {
        ["price"] = math.random(3, 10)
    },

    -- chickens
    ["chicken_carcass"] = {
        ["price"] = math.random(10, 35)
    },
    ["chicken_plucked"] = {
        ["price"] = math.random(15, 35)
    },
    ["chicken_frozen"] = {
        ["price"] = math.random(20, 35)
    },
    ["eggs"] = {
        ["price"] = math.random(5, 15)
    },

}


-- Alert Notification
Config.Alerts = {
    ['cancel'] = 'Cancelled',
    ['weapon'] = 'You don\'t have a knife to do this',
    ['itemamount'] = 'You are trying to process a amount that is invalid try again!',

    ['apple_pickingbar'] = 'Picking Apples',
    ['apple_progressbar'] = 'Making Juice',
	['apple_pickingfront'] = 'You picked ',
    ['apple_pickingend'] = ' apples from the tree',
    ['apple_processing'] = 'You are processing ' ..Config.AppleProcessing.. ' amount of apples',
    ['apple_trader'] = 'Received ' ..Config.AppleJuice.. ' apple juice from the framer',
    ['error_appleprocessor'] = 'Hm, It seems like you don\'t have any apples to process... Come back later!',

    ['cow_milking'] = 'Milking The Cow',
    ['emptybucket'] = 'You don\'t have a empty bucket',
    ['killing_cow'] = 'Slaughtering Cow',
    ['error_rawmeat'] = 'Hm, It looks like you don\'t have any raw meat to process... Come back later!',
    ['cow_processbar'] = 'Cooking cow beef',
    ['cow_processing'] = 'You cooked ' ..Config.BeefProcessing.. ' raw cow beef',
    ['cow_dairyprocessorbar'] = 'Trading Raw Milk',
    ['milk_processing'] = 'You are processing ' ..Config.MilkProcessing.. ' buckets of raw milk',
    ['milk_trader'] = 'Received ' ..Config.Milk.. ' Bottles of milk',
    ['error_milkprocessor'] = 'It looks like you don\'t have any buckets of milk..',
    ['error_milklocation'] = 'Go to the Paleto Barn and milk the cows then come back!',

    ['picking_pumpkins'] = 'Picking Up Pumpkin',
    ['pumpkin_processingbar'] = 'Smashing Pumpkins',
    ['pumpkin_processing'] = 'Smashed ' ..Config.PumpkinProcessing,
    ['pumpkin_trader'] = 'Made ' ..Config.PumpkinBoxes.. ' Boxes of pumpkin pie',
    ['error_pumpkinsmashing'] = 'You don\'t have any pumpkins to smash',

    ['corn_picking'] = 'Picking Corn',
    ['corn_progressbar'] = 'Making Can Corn',
    ['corn_processing'] = 'Removed ' ..Config.CornProcessing.. ' corn',
    ['corn_processed'] = 'Made ' ..Config.CornProcessed.. ' Can\'s of corn',
    ['error_corncob'] = 'Seems like you don\'t have any corn cobs to process... Come Back Later!',

    ['grape_picking'] = 'Picking Grapes',
    ['grape_progressbar'] = 'Straining Grapes',
    ['grape_processing'] = 'Strained ' ..Config.GrapeProcessing.. ' grapes',
    ['grape_processed'] = 'Made ' ..Config.GrapeProcessed.. ' bottles of juice',
    ['error_grape'] = 'Hm, It seems like you don\'t have any grapes to process... Come back later!',

    ['greenpepper_picking'] = "Picking GreenPeppers",

    ['chillypepper_picking'] = 'Picking ChillyPeppers',
    ['chilly_hotsauce'] = 'Making Hot Sauce',
    ['chilly_processing'] = 'Crushed ' ..Config.ChillyProcessing.. ' chilly Peppers',
    ['chilly_processed'] = 'Made ' ..Config.ChillyProcessed.. ' hot sauce bottle\'s',
    ['error_chilly'] = 'Hm, It seems like you don\'t have any chilly peppers to process... Come back later!',

    ['tomatoes_picking'] = 'Picking Tomatoes',
    ['tomatoes_progressbar'] = 'Smashing Tomatoes',
    ['tomatoes_processing'] = 'Squeezed ' ..Config.TomatoesProcessing.. ' tomatoes',
    ['tomatoes_processed'] = 'Made ' ..Config.TomatoesProcessed.. ' jars of tomatopaste',
    ['error_tomatoes'] = 'Hm, It seems like you don\'t have any tomatoes to process... Come back later!',


    ['bacon_progressbar'] = 'Cooking Bacon',
    ['bacon_processing'] = 'You cooked ' ..Config.BaconProcessed.. ' pieces of bacon',
    ['error_bacon'] = 'Don\'t have any bacon to cook',

    ['ham_progressbar'] = 'Cooking Ham',
    ['ham_processing'] = 'You cooked ' ..Config.HamProcessed.. ' slices of ham',
    ['error_ham'] = 'Don\'t have any ham to cook',

    ['pork_progressbar'] = 'Cooking Pork',
    ['pork_cooking'] = 'You cooked ' ..Config.PorkProcessed.. ' slabs of pork',
    ['error_pork'] = 'Don\'t have any pork to cook',

    ['sausage_progressbar'] = 'Cooking Sausage',
    ['sausage_processing'] = 'You cooked ' ..Config.SausageProcessed.. ' pieces of sausages',
    ['error_sausage'] = 'Don\'t have any sausage to cook',

    ['killing_pig'] = 'Slaughtering Pig',
    ['pig_reward'] = 'Received items for killing the pig',

    ['error.soybean'] = 'You don\'t have any soybeans to feed the pigs',
    ['stress'] = 'Your Stress Was Relieved',

    -- 2/24/2025
    -- adding in farm labels or names
    -- ❓ pecans
    ['pecan_farm'] = 'Pecan Farm',
    ['pecan_name'] = 'Pecan',
    -- ❓ lemons
    ['lemon_farm'] = 'Lemon Farm',
    ['lemon_name'] = 'Lemon',
    -- ❓ limes
    ['lime_farm'] = 'Lime Farm',
    ['lime_name'] = 'Lime',
    -- ❓ peaches
    ['peach_farm'] = 'Peach Farm',
    ['peach_name'] = 'Peach',
    -- ❓ avacado
    ['avacado_farm'] = 'Avacado Farm',
    ['avacado_name'] = 'Avacado',  
    
-- 2/24/2025
-- add support for apples
    -- ❓ apple
    ['apple_farm'] = 'Apple Farm',
    ['apple_name'] = 'Apple',   


-- 2/24/2025
-- adding in fields labels or names
-- ❓ lettuce  
    ['lettuce_fields'] = 'Lettuce Fields',
    ['lettuce_name'] = 'Lettuce', 
-- ❓ onions
    ['onion_fields'] = 'Onion Farm',
    ['onion_name'] = 'Onion', 
-- ❓ cucumber
    ['cucumber_fields'] = 'Cucumber Farm',
    ['cucumber_name'] = 'Cucumber', 
-- ❓ rice
    ['rice_fields'] = 'Rice Farm',
    ['rice_name'] = 'Rice', 
-- ❓ barley
    ['barley_fields'] = 'Barley Farm',
    ['barley_name'] = 'Barley', 
-- ❓ wheat
    ['wheat_fields'] = 'Wheat Farm',
    ['wheat_name'] = 'Wheat', 
-- ❓ pumpkin
    ['pumpkin_fields'] = 'Pumpkin Farm',
    ['pumpkin_name'] = 'Pumpkin', 
-- ❓ corn
    ['corn_fields'] = 'Corn Farm',
    ['corn_name'] = 'Corn', 

}
 

-- TODO
-- New Trees  - milestone update
-- Play Test Check List
-- ❓ lemons
-- ❓ limes
-- ❓ peaches
-- ❓ avacado
-- ❓ pecans
  
-- New plants - milestone update
-- Play Test Check List
-- ❓ lettuce  
-- ❓ onions
-- ❓ cucumber
-- ❓ rice
-- ❓ barley
-- ❓ wheat
 


-- added because I don't like chasing down data
-- 
Config.Inventory={}
-- ❓ apple
    Config.Inventory['Apple'] = {}
        Config.Inventory['Apple'].db_obj = "Apple"
        Config.Inventory['Apple'].in_game_obj = "Apple"    
-- ❓ lettuce
    Config.Inventory['Lettuce'] = {}
        Config.Inventory['Lettuce'].db_obj = "Lettuce"
        Config.Inventory['Lettuce'].in_game_obj = "Lettuce"   
-- ❓ onions
    Config.Inventory['Onion'] = {}
        Config.Inventory['Onion'].db_obj = "Onion"
        Config.Inventory['Onion'].in_game_obj = "Onion"   
-- ❓ cucumber
    Config.Inventory['Cucumber'] = {}
        Config.Inventory['Cucumber'].db_obj = "Cucumber"
        Config.Inventory['Cucumber'].in_game_obj = "Cucumber"   
-- ❓ rice
    Config.Inventory['Rice'] = {}
        Config.Inventory['Rice'].db_obj = "Rice"
        Config.Inventory['Rice'].in_game_obj = "Rice"   
-- ❓ barley
    Config.Inventory['Barley'] = {}
        Config.Inventory['Barley'].db_obj = "Barley"
        Config.Inventory['Barley'].in_game_obj = "Barley"   
-- ❓ wheat
    Config.Inventory['Wheat'] = {}
        Config.Inventory['Wheat'].db_obj = "Wheat"
        Config.Inventory['Wheat'].in_game_obj = "Wheat"   
-- ❓ lemons
    Config.Inventory['Lemons'] = {}
        Config.Inventory['Lemons'].db_obj = "Lemons"
        Config.Inventory['Lemons'].in_game_obj = "Lemons"   
-- ❓ limes
    Config.Inventory['Limes'] = {}
        Config.Inventory['Limes'].db_obj = "Limes"
        Config.Inventory['Limes'].in_game_obj = "Limes"   
-- ❓ peaches
    Config.Inventory['Peach'] = {}
        Config.Inventory['Peach'].db_obj = "Peach"
        Config.Inventory['Peach'].in_game_obj = "Peach"   
-- ❓ avacado
    Config.Inventory['Avacado'] = {}
        Config.Inventory['Avacado'].db_obj = "Avacado"
        Config.Inventory['Avacado'].in_game_obj = "Avacado"   
-- ❓ pecans
    Config.Inventory['Pecan'] = {}
        Config.Inventory['Pecan'].db_obj = "Pecan"
        Config.Inventory['Pecan'].in_game_obj = "Pecan"  
-- ❓ pumpkin
    Config.Inventory['Pumpkin'] = {}
        Config.Inventory['Pumpkin'].db_obj = "Pumpkin"
        Config.Inventory['Pumpkin'].in_game_obj = "Pumpkin"  
-- ❓ corn
    Config.Inventory['Corn'] = {}
        Config.Inventory['Corn'].db_obj = "Corn"
        Config.Inventory['Corn'].in_game_obj = "Corn"  
-- ❓ tomatoes
    Config.Inventory['Tomatoes'] = {}
        Config.Inventory['Tomatoes'].db_obj = "Tomatoes"
        Config.Inventory['Tomatoes'].in_game_obj = "Tomatoes"  
-- ❓ grapes
    Config.Inventory['Grapes'] = {}
        Config.Inventory['Grapes'].db_obj = "Grapes"
        Config.Inventory['Grapes'].in_game_obj = "Grapes"  
-- ❓ chillypeppers
    Config.Inventory['ChilliPeppers'] = {}
        Config.Inventory['ChilliPeppers'].db_obj = "ChilliPeppers"
        Config.Inventory['ChilliPeppers'].in_game_obj = "ChilliPeppers"  
-- ❓ greenpeppers
    Config.Inventory['GreenPeppers'] = {}
        Config.Inventory['GreenPeppers'].db_obj = "GreenPeppers"
        Config.Inventory['GreenPeppers'].in_game_obj = "GreenPeppers"  
-- ❓ pig
    Config.Inventory['Pig'] = {}
        Config.Inventory['Pig'].db_obj = "GreenPeppers"
        Config.Inventory['Pig'].in_game_obj = "GreenPeppers"  
-- ❓ cow
    Config.Inventory['Cow'] = {}
        Config.Inventory['Cow'].db_obj = "GreenPeppers"
        Config.Inventory['Cow'].in_game_obj = "GreenPeppers"  
-- ❓ chicken
    Config.Inventory['Chicken'] = {}
        Config.Inventory['Chicken'].db_obj = "GreenPeppers"
        Config.Inventory['Chicken'].in_game_obj = "GreenPeppers"  