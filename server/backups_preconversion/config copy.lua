Config = Config or {}

Config.UseBlips = true                      -- True / false option for toggling - Menu locations
Config.UseZonesFarms = true                 -- True / false option for toggling - map zone for farms
Config.ZonesFarmsColors = 0000000           -- color that is displayed on the map
Config.UseZonesOrchards = true              -- True / false option for toggling - map zone for orchards
Config.ZonesOrchardsColors = 0000000        -- color that is displayed on the map
Config.UseZonesFields = true                -- True / false option for toggling - map zone for fields
Config.ZonesFieldsColors = 0000000          -- color that is displayed on the map

Config.PedModel = "a_m_m_farmer_01"         -- Ped model  https://wiki.rage.mp/index.php?title=Peds
Config.PedHash = 0x94562DD7                 -- Hash numbers for ped model

Config.StoreLocations = {}                  -- Stores
Config.StoreLocations['fav_farms'] = {      --- location flag to be used in other areas... example: Config.Inventory['Apple'].Locations in orchard_apple.lua
    x=0,                                    --- 3 vectors for store menu location
    y=0,
    z=0,
    Name="My Favorite Farm Store",          -- blip label, and menu label
    blip=true                               -- blip for this store on or off
}

Config.RecipeLocations = {}                 -- Recipes
 
-- Alert Notification
Config.Language = Config.Language or {}
    Config.Language['cancel'] = 'Cancelled';
    Config.Language['no_knife'] = 'You don\'t have a knife to do this';
    Config.Language['no_ingredients'] = 'You are trying to process a amount that is invalid try again!';
    Config.Language['sold_it'] = "You have sold your items";
    Config.Language['no_quantity_sale'] = "You do not have the items to sell here!";

    Config.Language['farm_picked'] = 'Picked Up ';
    Config.Language['farm_grab'] = 'Grabbed ';
    Config.Language['farm_drop'] = 'Dropped ';
    Config.Language['farm_stomp'] = 'Stompped ';
    Config.Language['farm_drown'] = 'Drowned ';

-- 2/24/2025 


    -- cow
    Config.Language['cow_milking'] = 'Milking The Cow';
    Config.Language['emptybucket'] = 'You don\'t have a empty bucket';
    Config.Language['killing_cow'] = 'Slaughtering Cow';
    Config.Language['error_rawmeat'] = 'Hm, It looks like you don\'t have any raw meat to process... Come back later!';
    Config.Language['cow_processbar'] = 'Cooking cow beef',
    Config.Language['cow_processing'] = 'You cooked ' ..Config.BeefProcessing.. ' raw cow beef',
    Config.Language['cow_dairyprocessorbar'] = 'Trading Raw Milk',
    Config.Language['milk_processing'] = 'You are processing ' ..Config.MilkProcessing.. ' buckets of raw milk',
    Config.Language['milk_trader'] = 'Received ' ..Config.Milk.. ' Bottles of milk',
    Config.Language['error_milkprocessor'] = 'It looks like you don\'t have any buckets of milk..',
    Config.Language['error_milklocation'] = 'Go to the Paleto Barn and milk the cows then come back!',


-- ❓ pumpkin
    Config.Language['pumpkin_fields'] = 'Pumpkin Farm',
    Config.Language['pumpkin_name'] = 'Pumpkin', 
    Config.Language['sliceofpumpkinpie'] = 'Slice of Pumpkin Pie',        
    Config.Language['pumpkinpie'] = 'Pumpkin Pie', 
    ---  
    Config.Language['picking_pumpkins'] = 'Picking Up Pumpkin',
    Config.Language['pumpkin_processingbar'] = 'Smashing Pumpkins',
    Config.Language['pumpkin_processing'] = 'Smashed ' ..Config.PumpkinProcessing,
    Config.Language['pumpkin_trader'] = 'Made ' ..Config.PumpkinBoxes.. ' boxes of pumpkin pie',
    Config.Language['error_pumpkinsmashing'] = 'You don\'t have any pumpkins to smash',

    Config.Language['pumpkinpieslice_trader'] = 'Made ' ..Config.PumpkinPieSlices.. ' Slices of pumpkin pie',
    Config.Language['pumpkinpie_processing'] = 'Slicing ' ..Config.PumpkinPieProcessing,
    Config.Language['error_pumpkinpieslicing'] = 'You don\'t have any pumpkin pies to slice',
   
-- ❓ corn
    Config.Language['corn_fields'] = 'Corn Farm',
    Config.Language['corn_name'] = 'Corn', 
    ---  
    Config.Language['corn_picking'] = 'Picking Corn',
    Config.Language['corn_processingbar'] = 'Making Can Corn',
    Config.Language['corn_processing'] = 'Removed ' ..Config.CornProcessing.. ' corn',
    Config.Language['corn_processed'] = 'Made ' ..Config.CornProcessed.. ' Can\'s of corn',
    Config.Language['error_corncob'] = 'Seems like you don\'t have any corn cobs to process... Come Back Later!',

-- ❓ grape
    Config.Language['grape_fields'] = 'Grape Farm',
    Config.Language['grape_name'] = 'Grapes', 
    --
    Config.Language['grape_picking'] = 'Picking Grapes',
    Config.Language['grape_processingbar'] = 'Straining Grapes',
    Config.Language['grape_processing'] = 'Strained ' ..Config.GrapeProcessing.. ' grapes',
    Config.Language['grape_processed'] = 'Made ' ..Config.GrapeProcessed.. ' bottles of juice',
    Config.Language['error_grape'] = 'Hm, It seems like you don\'t have any grapes to process... Come back later!',

-- ❓ green pepper
    Config.Language['greenpepper_picking'] = "Picking GreenPeppers",
    Config.Language['greenpepper_fields'] = 'GreenPepper Farm',
    Config.Language['greenpepper_name'] = 'GreenPepper',      
    Config.Language['PickledGreenPeppers'] = 'Pickled GreenPeppers',     
    Config.Language['picking_greenpeppers'] = 'Picking Up GreenPepper',
    Config.Language['greenpepper_processingbar'] = 'Slicing GreenPeppers',
    Config.Language['greenpepper_processing'] = 'Sliced ' ..Config.GreenPepperProcessing,
    Config.Language['greenpepper_trader'] = 'Made ' ..Config.GreenPepperJars.. ' Jar of pickled greenpepper',
    Config.Language['error_greenpepperslicing'] = 'You don\'t have any greenpeppers to slice',

-- ❓ chilli pepper
    Config.Language['ChilliPeppers'] = 'Chilli Peppers',
    Config.Language['chillypepper_picking'] = 'Picking Chilli Peppers',
    Config.Language['chilly_hotsauce'] = 'Making Hot Sauce',
    Config.Language['chilly_processing'] = 'Crushed ' ..Config.ChillyProcessing.. ' Chilli Peppers',
    Config.Language['chilly_processed'] = 'Made ' ..Config.ChillyProcessed.. ' hot sauce bottle\'s',
    Config.Language['error_chilly'] = 'Hm, It seems like you don\'t have any chilli peppers to process... Come back later!',

-- ❓ tomatoes
    Config.Language['tomatoes_color'] = 'Red Tomatoes',
    Config.Language['tomatoes_picking'] = 'Picking Tomatoes',
    Config.Language['tomatoes_processingbar'] = 'Smashing Tomatoes',
    Config.Language['tomatoes_processing'] = 'Squeezed ' ..Config.TomatoesProcessing.. ' tomatoes',
    Config.Language['tomatoes_processed'] = 'Made ' ..Config.TomatoesProcessed.. ' jars of tomatopaste',
    Config.Language['error_tomatoes'] = 'Hm, It seems like you don\'t have any tomatoes to process... Come back later!',

-- pigs
    Config.Language['bacon_processingbar'] = 'Cooking Bacon',
    Config.Language['bacon_processing'] = 'You cooked ' ..Config.BaconProcessed.. ' pieces of bacon',
    Config.Language['error_bacon'] = 'Don\'t have any bacon to cook',

    Config.Language['ham_processingbar'] = 'Cooking Ham',
    Config.Language['ham_processing'] = 'You cooked ' ..Config.HamProcessed.. ' slices of ham',
    Config.Language['error_ham'] = 'Don\'t have any ham to cook',

    Config.Language['pork_processingbar'] = 'Cooking Pork',
    Config.Language['pork_cooking'] = 'You cooked ' ..Config.PorkProcessed.. ' slabs of pork',
    Config.Language['error_pork'] = 'Don\'t have any pork to cook',

    Config.Language['sausage_processingbar'] = 'Cooking Sausage',
    Config.Language['sausage_processing'] = 'You cooked ' ..Config.SausageProcessed.. ' pieces of sausages',
    Config.Language['error_sausage'] = 'Don\'t have any sausage to cook',

    Config.Language['killing_pig'] = 'Slaughtering Pig',
    Config.Language['pig_reward'] = 'Received items for killing the pig',

    Config.Language['error.soybean'] = 'You don\'t have any soybeans to feed the pigs',
    Config.Language['stress'] = 'Your Stress Was Relieved',

    -- 2/24/2025
    -- adding in farm labels or names
    -- ❓ pecans
    Config.Language['pecan_farm'] = 'Pecan Farm',
    Config.Language['pecan_name'] = 'Pecan',

    -- ❓ lemons
    Config.Language['lemon_farm'] = 'Lemon Farm',
    Config.Language['lemon_name'] = 'Lemon',

    -- ❓ limes
    Config.Language['lime_farm'] = 'Lime Farm',
    Config.Language['lime_name'] = 'Lime',

    -- ❓ peaches
    Config.Language['peach_farm'] = 'Peach Farm',
    Config.Language['peach_name'] = 'Peach',

    -- ❓ avacado
    Config.Language['avacado_farm'] = 'Avacado Farm',
    Config.Language['avacado_name'] = 'Avacado',  
      
    
-- ❓ lettuce  
    Config.Language['lettuce_fields'] = 'Lettuce Fields',
    Config.Language['lettuce_name'] = 'Lettuce', 
    Config.Language['lettuce_fields'] = 'Lettuce Farm',
    Config.Language['lettuce_name'] = 'Lettuce',      
    Config.Language['BowlofLettuce'] = 'Bowl of Lettuce',   
    Config.Language['BowlofSalad'] = 'Bowl of Salad',     
    Config.Language['picking_lettuce'] = 'Picking Up Lettuce',
    Config.Language['lettuce_processingbar'] = 'Slicing Lettuces',
    Config.Language['lettuce_processing'] = 'Sliced ' ..Config.LettuceProcessing,
    Config.Language['lettuce_trader'] = 'Made ' ..Config.LettuceBowl.. ' bowls of lettuce',
    Config.Language['salad_trader'] = 'Made ' ..Config.SalardBowl.. ' bowls of salad',
    Config.Language['error_lettuceslicing'] = 'You don\'t have any lettuce heads to slice',


-- ❓ onions
    Config.Language['onion_fields'] = 'Onion Farm',
    Config.Language['onion_name'] = 'Onion', 
    Config.Language['PickledOnions'] = 'Pickled Onions',     
    Config.Language['picking_onions'] = 'Picking Up Onion',
    Config.Language['onion_processingbar'] = 'Slicing Onions',
    Config.Language['onion_processing'] = 'Sliced ' ..Config.OnionProcessing,
    Config.Language['onion_trader'] = 'Made ' ..Config.OnionJars.. ' Jar of pickled onion',
    Config.Language['error_onionslicing'] = 'You don\'t have any onions to slice',

-- ❓ cucumber
    Config.Language['cucumber_fields'] = 'Cucumber Farm',
    Config.Language['cucumber_name'] = 'Cucumber', 
    Config.Language['Cucumber'] = 'Cucumber',
    Config.Language['SlicedCucumber'] = 'Sliced Cucumbers',
    Config.Language['SweetPickles'] = 'Sweet Pickles',
    Config.Language['DillPickles'] = 'Dill Pickles',
    Config.Language['SpicyPickles'] = 'Spicy Pickles', 
    Config.Language['BreadAndButterPickles'] = 'Bread And Butter Pickles Pickles', 
    Config.Language['picking_cucumbers'] = 'Picking Up Cucumber',
    Config.Language['slicingcucumbers_processingbar'] = 'Slicing Cucumbers',
    Config.Language['picklingcucumbers_processingbar'] = 'Pickling Cucumbers',
    Config.Language['slicingcucumbers_processing'] = 'Sliced ' ..Config.CucumberProcessing,
    Config.Language['picklingcucumbers_processing'] = 'Sliced ' ..Config.CucumberProcessing,
    Config.Language['slicedcucumber_trader'] = 'Made ' ..Config.SlicedCucumber.. ' sliced cucumbers',
    Config.Language['sweetpickles_trader'] = 'Made ' ..Config.SweetPickles.. ' Jar(s) of Sweet Pickles',
    Config.Language['dillpickles_trader'] = 'Made ' ..Config.DillPickles.. ' Jar(s) of Dill Pickles',
    Config.Language['spicypickles_trader'] = 'Made ' ..Config.SpicyPickles.. ' Jar(s) of Spicy Pickles',
    Config.Language['breadandbutterpickles_trader'] = 'Made ' ..Config.BreadAndButterPickles.. ' Jar(s) of Bread And Butter Pickles',
    Config.Language['cucumber_trader'] = 'Made ' ..Config.Cucumbers.. ' cucumbers',
    Config.Language['error_cucumberslicing'] = 'You don\'t have any cucumbers to slice',
    Config.Language['error_picklingcucumbers'] = 'You don\'t have any sliced cucumbers to pickle',

-- ❓ rice
    Config.Language['rice_fields'] = 'Rice Farm',
    Config.Language['rice_name'] = 'Rice',  
    Config.Language['GroundRice'] = 'Sack of Rice Flour',  
    Config.Language['RiceBalls'] = 'Balls of Rice',   
    Config.Language['picking_rice'] = 'Picking Up Sack of Rice',
    Config.Language['riceflour_processingbar'] = 'Grinding Rice',
    Config.Language['riceflour_processing'] = 'Ground ' ..Config.RiceProcessing,
    Config.Language['rice_processed'] = 'Finished Cooking Rice',
    Config.Language['riceball_processed'] = 'Finished Rolling Balls of Rice', 
    Config.Language['riceflour_processed'] = 'Finished Grinding Rice',  
    Config.Language['riceflour_trader'] = 'Ground ' ..Config.RiceSack.. ' sack of rice flour',
    Config.Language['riceball_trader'] = 'Ground ' ..Config.RiceBalls.. ' balls of rice',
    Config.Language['error_ricemashing'] = 'You don\'t have a rice sack to grind.', 
    Config.Language['error_riceballmashing'] = 'You don\'t have a rice sack to cook.', 


-- ❓ barley
    Config.Language['barley_fields'] = 'Barley Farm',
    Config.Language['barley_name'] = 'Barley', 


-- ❓ wheat
    Config.Language['wheat_fields'] = 'Wheat Farm',
    Config.Language['wheat_name'] = 'Wheat',  
    Config.Language['GroundWheats'] = 'Sack of Wheat Flour',     
    Config.Language['picking_wheat'] = 'Picking Up Bundle of Wheat',
    Config.Language['wheat_processingbar'] = 'Grinding Wheat',
    Config.Language['wheat_processing'] = 'Ground ' ..Config.WheatProcessing,
    Config.Language['wheat_processed'] = 'Finished Grinding Wheat',
    Config.Language['wheat_trader'] = 'Ground ' ..Config.WheatSack.. ' sack of wheat flour',
    Config.Language['error_wheatgrinding'] = 'You don\'t have a wheat bundle to grind.', 

 
 

-- added because I don't like chasing down data
-- 
Config.Inventory={} 

-- ❓ lettuce
    Config.Inventory['Lettuce'] = {}
        Config.Inventory['Lettuce'].db_obj = "Lettuce"
        Config.Inventory['Lettuce'].in_game_obj = "Lettuce"   
    Config.Inventory['BowlofLettuce'] = {}
        Config.Inventory['BowlofLettuce'].db_obj = "BowlofLettuce"
        Config.Inventory['BowlofLettuce'].in_game_obj = "BowlofLettuce"   
    Config.Inventory['HouseSalad'] = {}
        Config.Inventory['HouseSalad'].db_obj = "HouseSalad"
        Config.Inventory['HouseSalad'].in_game_obj = "HouseSalad"   
    Config.Inventory['GreekSalad'] = {}
        Config.Inventory['GreekSalad'].db_obj = "GreekSalad"
        Config.Inventory['GreekSalad'].in_game_obj = "GreekSalad"   

-- ❓ onions
    Config.Inventory['Onion'] = {}
        Config.Inventory['Onion'].db_obj = "Onion"
        Config.Inventory['Onion'].in_game_obj = "Onion"  
    Config.Inventory['PickledOnions'] = {} 
        Config.Inventory['PickledOnions'].db_obj = "PickledOnions"
        Config.Inventory['PickledOnions'].in_game_obj = "PickledOnions"  
    Config.Inventory['SlicedOnions'] = {} 
        Config.Inventory['SlicedOnions'].db_obj = "SlicedOnions"
        Config.Inventory['SlicedOnions'].in_game_obj = "SlicedOnions"  

-- ❓ cucumber
    Config.Inventory['Cucumber'] = {}
        Config.Inventory['Cucumber'].db_obj = "Cucumber"
        Config.Inventory['Cucumber'].in_game_obj = "Cucumber"  
    Config.Inventory['SlicedCucumber'] = {}
        Config.Inventory['SlicedCucumber'].db_obj = "SlicedCucumber"
        Config.Inventory['SlicedCucumber'].in_game_obj = "SlicedCucumber" 
    Config.Inventory['SweetPickles'] = {}
        Config.Inventory['SweetPickles'].db_obj = "SweetPickles"
        Config.Inventory['SweetPickles'].in_game_obj = "SweetPickles" 
    Config.Inventory['DillPickles'] = {}
        Config.Inventory['DillPickles'].db_obj = "DillPickles"
        Config.Inventory['DillPickles'].in_game_obj = "DillPickles" 
    Config.Inventory['SpicyPickles'] = {}
        Config.Inventory['SpicyPickles'].db_obj = "SpicyPickles"
        Config.Inventory['SpicyPickles'].in_game_obj = "SpicyPickles" 
    Config.Inventory['BreadAndButterPickles'] = {}
        Config.Inventory['BreadAndButterPickles'].db_obj = "BreadAndButterPickles"
        Config.Inventory['BreadAndButterPickles'].in_game_obj = "BreadAndButterPickles" 

-- ❓ rice
    Config.Inventory['Rice'] = {}
        Config.Inventory['Rice'].db_obj = "Rice"
        Config.Inventory['Rice'].in_game_obj = "Rice"   
    Config.Inventory['RiceBalls'] = {}
        Config.Inventory['RiceBalls'].db_obj = "RiceBalls"
        Config.Inventory['RiceBalls'].in_game_obj = "RiceBalls"   
    Config.Inventory['RiceFlour'] = {}
        Config.Inventory['RiceFlour'].db_obj = "RiceFlour"
        Config.Inventory['RiceFlour'].in_game_obj = "RiceFlour"  

-- ❓ barley
    Config.Inventory['Barley'] = {}
        Config.Inventory['Barley'].db_obj = "Barley"
        Config.Inventory['Barley'].in_game_obj = "Barley"   
    Config.Inventory['BarleyFlour'] = {}
        Config.Inventory['BarleyFlour'].db_obj = "BarleyFlour"
        Config.Inventory['BarleyFlour'].in_game_obj = "BarleyFlour"  

-- ❓ wheat
    Config.Inventory['Wheat'] = {}
        Config.Inventory['Wheat'].db_obj = "Wheat"
        Config.Inventory['Wheat'].in_game_obj = "Wheat" 
    Config.Inventory['WheatFlour'] = {}
        Config.Inventory['WheatFlour'].db_obj = "WheatFlour"
        Config.Inventory['WheatFlour'].in_game_obj = "WheatFlour"      

-- ❓ lemons
    Config.Inventory['Lemons'] = {}
        Config.Inventory['Lemons'].db_obj = "Lemons"
        Config.Inventory['Lemons'].in_game_obj = "Lemons" 
    Config.Inventory['Lemonade'] = {}
        Config.Inventory['Lemonade'].db_obj = "Lemonade"
        Config.Inventory['Lemonade'].in_game_obj = "Lemonade" 
    Config.Inventory['LemonBars'] = {}
        Config.Inventory['LemonBars'].db_obj = "LemonBars"
        Config.Inventory['LemonBars'].in_game_obj = "LemonBars" 
    Config.Inventory['LemonMeringuePie'] = {}
        Config.Inventory['LemonMeringuePie'].db_obj = "LemonMeringuePie"
        Config.Inventory['LemonMeringuePie'].in_game_obj = "LemonMeringuePie" 
    Config.Inventory['LemonMeringuePieSlice'] = {}
        Config.Inventory['LemonMeringuePieSlice'].db_obj = "LemonMeringuePieSlice"
        Config.Inventory['LemonMeringuePieSlice'].in_game_obj = "LemonMeringuePieSlice" 

-- ❓ limes
    Config.Inventory['Limes'] = {}
        Config.Inventory['Limes'].db_obj = "Limes"
        Config.Inventory['Limes'].in_game_obj = "Limes"   
    Config.Inventory['LimesHarvest'] = {}
        Config.Inventory['LimesHarvest'].db_obj = "LimesHarvest"
        Config.Inventory['LimesHarvest'].in_game_obj = "LimesHarvest"  

-- ❓ peaches
    Config.Inventory['Peach'] = {}
        Config.Inventory['Peach'].db_obj = "Peach"
        Config.Inventory['Peach'].in_game_obj = "Peach"   
    Config.Inventory['PeachCobbler'] = {}
        Config.Inventory['PeachCobbler'].db_obj = "PeachCobbler"
        Config.Inventory['PeachCobbler'].in_game_obj = "PeachCobbler" 
    Config.Inventory['PeachCobblerSlice'] = {}
        Config.Inventory['PeachCobblerSlice'].db_obj = "PeachCobblerSlice"
        Config.Inventory['PeachCobblerSlice'].in_game_obj = "PeachCobblerSlice" 
    Config.Inventory['CannedPeachs'] = {}
        Config.Inventory['CannedPeachs'].db_obj = "CannedPeachs"
        Config.Inventory['CannedPeachs'].in_game_obj = "CannedPeachs"  

-- ❓ avacado
    Config.Inventory['Avacado'] = {}
        Config.Inventory['Avacado'].db_obj = "Avacado"
        Config.Inventory['Avacado'].in_game_obj = "Avacado"   
    Config.Inventory['AvacadoHarvest'] = {}
        Config.Inventory['AvacadoHarvest'].db_obj = "AvacadoHarvest"
        Config.Inventory['AvacadoHarvest'].in_game_obj = "AvacadoHarvest"  

-- ❓ pecans
    Config.Inventory['Pecan'] = {}
        Config.Inventory['Pecan'].db_obj = "Pecan"
        Config.Inventory['Pecan'].in_game_obj = "Pecan"  
    Config.Inventory['PecanHarvest'] = {}
        Config.Inventory['PecanHarvest'].db_obj = "PecanHarvest"
        Config.Inventory['PecanHarvest'].in_game_obj = "PecanHarvest"  

-- ❓ pumpkin
    Config.Inventory['Pumpkin'] = {}
        Config.Inventory['Pumpkin'].db_obj = "Pumpkin"
        Config.Inventory['Pumpkin'].in_game_obj = "Pumpkin"  
    Config.Inventory['PumpkinPie'] = {}
        Config.Inventory['PumpkinPie'].db_obj = "PumpkinPie"
        Config.Inventory['PumpkinPie'].in_game_obj = "PumpkinPie"  
    Config.Inventory['PumpkinPieSlice'] = {}
        Config.Inventory['PumpkinPieSlice'].db_obj = "PumpkinPieSlice"
        Config.Inventory['PumpkinPieSlice'].in_game_obj = "PumpkinPieSlice"

-- ❓ corn
    Config.Inventory['Corn'] = {}
        Config.Inventory['Corn'].db_obj = "Corn"
        Config.Inventory['Corn'].in_game_obj = "Corn"  
    Config.Inventory['CannedCorn'] = {}
        Config.Inventory['CannedCorn'].db_obj = "CannedCorn"
        Config.Inventory['CannedCorn'].in_game_obj = "CannedCorn"  

-- ❓ tomatoes
    Config.Inventory['Tomatoes'] = {}
        Config.Inventory['Tomatoes'].db_obj = "Tomatoes"
        Config.Inventory['Tomatoes'].in_game_obj = "Tomatoes"  
    Config.Inventory['TomatoPaste'] = {}
        Config.Inventory['TomatoPaste'].db_obj = "TomatoPaste"
        Config.Inventory['TomatoPaste'].in_game_obj = "TomatoPaste"   
    Config.Inventory['SlicedTomatoes'] = {}
        Config.Inventory['SlicedTomatoes'].db_obj = "SlicedTomatoes"
        Config.Inventory['SlicedTomatoes'].in_game_obj = "SlicedTomatoes"   

-- ❓ grapes
    Config.Inventory['Grapes'] = {}
        Config.Inventory['Grapes'].db_obj = "Grapes"
        Config.Inventory['Grapes'].in_game_obj = "Grapes"  
    Config.Inventory['SlicedGrapes'] = {}
        Config.Inventory['SlicedGrapes'].db_obj = "SlicedGrapes"
        Config.Inventory['SlicedGrapes'].in_game_obj = "SlicedGrapes"  
    Config.Inventory['Whine'] = {}
        Config.Inventory['Whine'].db_obj = "Whine"
        Config.Inventory['Whine'].in_game_obj = "Whine"  
    Config.Inventory['GrapeJuice'] = {}
        Config.Inventory['GrapeJuice'].db_obj = "GrapeJuice"
        Config.Inventory['GrapeJuice'].in_game_obj = "GrapeJuice"  
    Config.Inventory['GrapeJelly'] = {}
        Config.Inventory['GrapeJelly'].db_obj = "GrapeJelly"
        Config.Inventory['GrapeJelly'].in_game_obj = "GrapeJelly"  

-- ❓ chillypeppers
    Config.Inventory['ChilliPeppers'] = {}
        Config.Inventory['ChilliPeppers'].db_obj = "ChilliPeppers"
        Config.Inventory['ChilliPeppers'].in_game_obj = "ChilliPeppers" 
    Config.Inventory['SlicedChilliPeppers'] = {}
        Config.Inventory['SlicedChilliPeppers'].db_obj = "SlicedChilliPeppers"
        Config.Inventory['SlicedChilliPeppers'].in_game_obj = "SlicedChilliPeppers" 
    Config.Inventory['PickledChilliPeppers'] = {}
        Config.Inventory['PickledChilliPeppers'].db_obj = "PickledChilliPeppers"
        Config.Inventory['PickledChilliPeppers'].in_game_obj = "PickledChilliPeppers" 
    Config.Inventory['HotSauce'] = {}
        Config.Inventory['HotSauce'].db_obj = "HotSauce"
        Config.Inventory['HotSauce'].in_game_obj = "HotSauce" 

-- ❓ greenpeppers
    Config.Inventory['GreenPeppers'] = {}
        Config.Inventory['GreenPeppers'].db_obj = "GreenPeppers"
        Config.Inventory['GreenPeppers'].in_game_obj = "GreenPeppers"  
    Config.Inventory['SlicedGreenPeppers'] = {}
        Config.Inventory['SlicedGreenPeppers'].db_obj = "SlicedGreenPeppers"
        Config.Inventory['SlicedGreenPeppers'].in_game_obj = "SlicedGreenPeppers"  
    Config.Inventory['PickledGreenPeppers'] = {} 
        Config.Inventory['PickledGreenPeppers'].db_obj = "PickledGreenPeppers"
        Config.Inventory['PickledGreenPeppers'].in_game_obj = "PickledGreenPeppers"  

-- ❓ pig
    Config.Inventory['Pig'] = {}
        Config.Inventory['Pig'].db_obj = "Pig"
        Config.Inventory['Pig'].in_game_obj = "Pig"  
    Config.Inventory['PorkHam'] = {}
        Config.Inventory['PorkHam'].db_obj = "PorkHam"
        Config.Inventory['PorkHam'].in_game_obj = "PorkHam"  
    Config.Inventory['PorkBacon'] = {}
        Config.Inventory['PorkBacon'].db_obj = "PorkBacon"
        Config.Inventory['PorkBacon'].in_game_obj = "PorkBacon"  
    Config.Inventory['PorkChop'] = {}
        Config.Inventory['PorkChop'].db_obj = "PorkChop"
        Config.Inventory['PorkChop'].in_game_obj = "PorkChop"  
    Config.Inventory['PorkTenderloin'] = {}
        Config.Inventory['PorkTenderloin'].db_obj = "PorkTenderloin"
        Config.Inventory['PorkTenderloin'].in_game_obj = "PorkTenderloin"  
    Config.Inventory['PorkSausage'] = {}
        Config.Inventory['PorkSausage'].db_obj = "PorkSausage"
        Config.Inventory['PorkSausage'].in_game_obj = "PorkSausage"  
 
-- ❓ cow
    Config.Inventory['Cow'] = {}
        Config.Inventory['Cow'].db_obj = "Cow"
        Config.Inventory['Cow'].in_game_obj = "Cow"  
    Config.Inventory['BeefRoast'] = {}
        Config.Inventory['BeefRoast'].db_obj = "BeefRoast"
        Config.Inventory['BeefRoast'].in_game_obj = "BeefRoast" 
    Config.Inventory['BeefSteak'] = {}
        Config.Inventory['BeefSteak'].db_obj = "BeefSteak"
        Config.Inventory['BeefSteak'].in_game_obj = "BeefSteak"
    Config.Inventory['BeefRibs'] = {}
        Config.Inventory['BeefRibs'].db_obj = "BeefRibs"
        Config.Inventory['BeefRibs'].in_game_obj = "BeefRibs"
    Config.Inventory['BeefHamburger'] = {}
        Config.Inventory['BeefHamburger'].db_obj = "BeefHamburger"
        Config.Inventory['BeefHamburger'].in_game_obj = "BeefHamburger"
    Config.Inventory['Milk'] = {}
        Config.Inventory['Milk'].db_obj = "Milk"
        Config.Inventory['Milk'].in_game_obj = "Milk" 
    Config.Inventory['Butter'] = {}
        Config.Inventory['Butter'].db_obj = "Butter"
        Config.Inventory['Butter'].in_game_obj = "Butter" 
    Config.Inventory['Cream'] = {}
        Config.Inventory['Cream'].db_obj = "Cream"
        Config.Inventory['Cream'].in_game_obj = "Cream" 

-- ❓ chicken
    Config.Inventory['Chicken'] = {}
        Config.Inventory['Chicken'].db_obj = "Chicken"
        Config.Inventory['Chicken'].in_game_obj = "Chicken"  
    Config.Inventory['Eggs'] = {}
        Config.Inventory['Eggs'].db_obj = "Eggs"
        Config.Inventory['Eggs'].in_game_obj = "Eggs"  
    Config.Inventory['RawWholeChickenPlucked'] = {}
        Config.Inventory['RawWholeChickenPlucked'].db_obj = "RawWholeChickenPlucked"
        Config.Inventory['RawWholeChickenPlucked'].in_game_obj = "RawWholeChickenPlucked"  
    Config.Inventory['ChickenBreasts'] = {}
        Config.Inventory['ChickenBreasts'].db_obj = "ChickenBreasts"
        Config.Inventory['ChickenBreasts'].in_game_obj = "ChickenBreasts"  
    Config.Inventory['ChickenLegs'] = {}
        Config.Inventory['ChickenLegs'].db_obj = "ChickenLegs"
        Config.Inventory['ChickenLegs'].in_game_obj = "ChickenLegs"  
    Config.Inventory['ChickenWings'] = {}
        Config.Inventory['ChickenWings'].db_obj = "ChickenWings"
        Config.Inventory['ChickenWings'].in_game_obj = "ChickenWings" 
    Config.Inventory['ChickenTenders'] = {}
        Config.Inventory['ChickenTenders'].db_obj = "ChickenTenders"
        Config.Inventory['ChickenTenders'].in_game_obj = "ChickenTenders" 


Config.Blips = {

    [0] = {
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
    },

    [1] = {         
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
    },

    [2] = {       
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
    },

    [3] = {  
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
    },

    [4] = {    
        targetZone = vector3(2166.11, 5003.84, 40.39),
        targetHeading = 305,
        coords = vector4(2166.11, 5003.84, 40.39, 312.56),
        SetBlipSprite = 642,
        SetBlipDisplay = 6,
        SetBlipScale = 0.65,
        SetBlipColour = 17,
        BlipLabel = "Pig Farm (Food)",
        minZ = 40,
        maxZ = 42,                                   
    },

    [5] = {    
        targetZone = vector3(2166.11, 5003.84, 40.39),
        targetHeading = 305,
        coords = vector4(2166.11, 5003.84, 40.39, 312.56),
        SetBlipSprite = 642,
        SetBlipDisplay = 6,
        SetBlipScale = 0.65,
        SetBlipColour = 17,
        BlipLabel = "Chicken Farm (Food)",
        minZ = 40,
        maxZ = 42,                                   
    },
 
}
 
Config.PurchaseableItems_FarmFood = {

    [0] = {
        -- ❓ Pig Farm (Food)
        Name = "Pig Food",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },
    [1] = {
        -- ❓ Chickens Farm (Food)     
        Name = "Chicken Food",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",     
    },
    [2] = {
        -- ❓ Goats Farm (Food)     
        Name = "Goat Food",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",     
    },
    [3] = {
        -- ❓ Cows Farm (Food)     
        Name = "Cow Food",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",     
    },  
 
}


-- Sell Items
Config.PurchaseableItems_Plants = {
 
    [] = { 
        Name = "",
        Name_DB = "rawpumpkin",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "pumpkinpiebox",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "slicedpie",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },     
    [] = { 
        Name = "",
        Name_DB = "corncob",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },     
    [] = { 
        Name = "",
        Name_DB = "cannedcorn",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },     
    [] = { 
        Name = "",
        Name_DB = "grapes",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },     
    [] = { 
        Name = "",
        Name_DB = "grapejuice",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "greenpepper",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "chillypepper",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "hotsauce",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "tomato",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "tomatopaste",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   

    [] = { 
        Name = "",
        Name_DB = "lemons",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "limes",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "peaches",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "avacado",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "pecans",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "lettuce",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "onions",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "cucumber",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "rice",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "barley",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    [] = { 
        Name = "",
        Name_DB = "wheat",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    --[[
    [] = { 
        Name = "",
        Name_DB = "",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    --]]
}

Config.PurchaseableItems_Animals = {
    [] = { 
        Name = "",
        Name_DB = "milkbucket",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },
    [] = { 
        Name = "",
        Name_DB = "raw_beef",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },
    [] = { 
        Name = "",
        Name_DB = "beef_roast",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "milk",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "raw_pork",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "raw_bacon",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "raw_sausage",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "raw_pork",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "raw_ham",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "cooked_bacon",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "cooked_sausage",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "cooked_pork",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "cooked_ham",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "pig_leather",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },    
    [] = { 
        Name = "",
        Name_DB = "cow_leather",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "chicken_carcass",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "chicken_frozen",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "chicken_plucked",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },  
    [] = { 
        Name = "",
        Name_DB = "eggs",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   

    --[[   
    [] = { 
        Name = "",
        Name_DB = "",
        Player_Buys_Price = math.random(5, 15),
        Player_Sells_Price = math.random(5, 15),
        Quantity = "5",  
    },   
    --]] 

         
}

 

Config.ProcessingRecipes_Plants = {

    [1] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Pumpkin",              Name_DB = "pumpkin",            Require_Quantity = 1,
        Returns_Item = "PumpkinPie",        Returns_DB = "pumpkinpie",      Returns_Quantity = 4, 
    },
    [2] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Pumpkin",              Name_DB = "pumpkin",            Require_Quantity = 1,
        Returns_Item = "PumpkinSlices",     Returns_DB = "pumpkinslices",   Returns_Quantity = 4, 
    },
    [3] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Corn",                 Name_DB = "corn",               Require_Quantity = 1,
        Returns_Item = "CannedCorn",        Returns_DB = "cannecorn",       Returns_Quantity = 4, 
    },
    [4] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Grape",                Name_DB = "grape",              Require_Quantity = 1,
        Returns_Item = "GrapeJuice",        Returns_DB = "grapejuice",      Returns_Quantity = 12, 
    },
    [5] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "ChilliPepper",         Name_DB = "chillipepper",       Require_Quantity = 1,
        Returns_Item = "HotSauce",          Returns_DB = "hotsauce",        Returns_Quantity = 12, 
    },
    [6] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Tomatoes",             Name_DB = "tomatoes",           Require_Quantity = 1,
        Returns_Item = "TomatoeJuice",      Returns_DB = "tomatoejuice",    Returns_Quantity = 12, 
    },
    -- ❓ lemons
    [7] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Lemons",               Name_DB = "lemons",             Require_Quantity = 1,
        Returns_Item = "LemonJuice",        Returns_DB = "lemonjice",       Returns_Quantity = 12, 
    },
    -- ❓ limes
    [8] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Limes",             Name_DB = "limes",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ peaches
    [9] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Peaches",             Name_DB = "peaches",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ avacado
    [10] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Avacado",             Name_DB = "avacado",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ pecans
    [11] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Pecans",             Name_DB = "pecans",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ lettuce 
    Config.LettuceProce
    [13] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Lettuce",             Name_DB = "lettuce",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ onions
    [14] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Onion",             Name_DB = "onion",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ cucumber
    [15] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Cucumber",             Name_DB = "cucumber",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ rice
    [16] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Rice",                    Name_DB = "rice",           Require_Quantity = 1,
        Returns_Item = " ",                 Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ barley
    [17] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Barley",               Name_DB = "barley",           Require_Quantity = 1,
        Returns_Item = "",                  Returns_DB = " ",    Returns_Quantity = 12, 
    },
    -- ❓ wheat
    [18] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Wheat",                Name_DB = "wheat",              Require_Quantity = 1,
        Returns_Item = "Flour",             Returns_DB = "flour",           Returns_Quantity = 12, 
    }, 
    --[[
    [] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = " ",             Name_DB = " ",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },    
    --]]
}  


Config.ProcessingRecipes_Animals = {   
    -- ❓ eggs
    [0] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Eggs",                 Name_DB = "eggs",               Require_Quantity = 1,
        Returns_Item = "Boiled Eggs",       Returns_DB = "boiled_eggs",     Returns_Quantity = 12, 
    },
    [1] = {
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Beef",                 Name_DB = "beef",               Require_Quantity = 2,
        Returns_Item = "Beef Roast",        Returns_DB = "beef_roast",      Returns_Quantity = 1, 
    },    
    [2] = {
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Pork",                 Name_DB = "pork",               Require_Quantity = 1,
        Returns_Item = "Bacon",             Returns_DB = "bacon",           Returns_Quantity = 24, 
    }, 
    [3] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Pork",                 Name_DB = "pork",               Require_Quantity = 1,
        Returns_Item = "Ham",               Returns_DB = "ham",             Returns_Quantity = 2, 
    }, 
    [4] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Pork",                 Name_DB = "pork",               Require_Quantity = 1,
        Returns_Item = "Sausage",           Returns_DB = "sausage",         Returns_Quantity = 2, 
    },
    [5] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Milk",                 Name_DB = "milk",               Require_Quantity = 1,
        Returns_Item = "Cream",             Returns_DB = "cream",           Returns_Quantity = 2, 
    },
    [6] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Milk",                 Name_DB = "milk",               Require_Quantity = 1,
        Returns_Item = "Half and Half",     Returns_DB = "halfandhalf",     Returns_Quantity = 2, 
    },
    [7] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = "Milk",                 Name_DB = "milk",               Require_Quantity = 1,
        Returns_Item = "Cheese",            Returns_DB = "cheese",          Returns_Quantity = 2, 
    }, 
    -- ❓ chicken
    [8] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = " ",                    Name_DB = " ",                  Require_Quantity = 1,
        Returns_Item = " ",                 Returns_DB = " ",               Returns_Quantity = 12, 
    }, 
    --[[
    [] = { 
        Location = {"", ""}                 Tools = {"", ""},               ProcessingTime = 50 -- seconds
        Item_Name = " ",             Name_DB = " ",           Require_Quantity = 1,
        Returns_Item = " ",      Returns_DB = " ",    Returns_Quantity = 12, 
    },    
    --]]
}  
      