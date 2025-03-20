Config = Config or {}

Config.ScriptName = GetCurrentResourceName()
Config.UseBlips = true                      -- True / false option for toggling - Menu locations
Config.DefaultSprite = 1                    -- Default Value for Sprite
Config.DefaultSpriteColor = 2               -- Default Value for Sprite Color
Config.DefaultSpriteLabel = "Look Here"     -- Default Value for Sprite Label
Config.UseZones = true                      -- True / false option for toggling - map zone for farms
Config.ZonesFarmsColors = 0000000           -- color that is displayed on the map
Config.UseZonesOrchards = true              -- True / false option for toggling - map zone for orchards
Config.ZonesOrchardsColors = 0000000        -- color that is displayed on the map
Config.UseZonesFields = true                -- True / false option for toggling - map zone for fields
Config.ZonesFieldsColors = 0000000          -- color that is displayed on the map

Config.PedModel = "a_m_m_farmer_01"         -- Ped model  https://wiki.rage.mp/index.php?title=Peds
Config.PedHash = 0x94562DD7                 -- Hash numbers for ped model


Config.ManualStore = true                   -- If you want to manually specifc which items are sold at which stores.. set to true. 
                                            -- if false it will sell all items at all stores automatically.
                                            
Config.Seller_Locations = Config.Seller_Locations or {}  -- Stores that sell things to players
Config.Seller_Locations['fav_farms'] = {      --- location flag to be used in other areas... example: Config.Inventory['Apple'].Locations in orchard_apple.lua
    x=0,                                    --- 3 vectors for store menu location
    y=0,
    z=0,
    Name="My Favorite Farm Store",          -- blip label, and menu label
    blip=true                               -- blip for this store on or off
}

Config.Buyer_Locations = Config.Buyer_Locations or {} -- Stores that buy things from players               
Config.Buyer_Locations['fav_farms'] = {      --- location flag to be used in other areas... example: Config.Inventory['Apple'].Locations in orchard_apple.lua
    x=0,                                    --- 3 vectors for store menu location
    y=0,
    z=0,
    Name="My Favorite Farm Barn",          -- blip label, and menu label
    blip=true                               -- blip for this store on or off
}

Config.Craft_Locations = Config.Craft_Locations or {} -- Crafting locations    
Config.Craft_Locations['fav_farms'] = {      --- location flag to be used in other areas... example: Config.Inventory['Apple'].Locations in orchard_apple.lua
    x=0,                                    --- 3 vectors for store menu location
    y=0,
    z=0,
    Name="My Favorite Farm Barn",          -- blip label, and menu label
    blip=true                               -- blip for this store on or off
}
 
 
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
    Config.Language['farm_stomp'] = 'Stomped ';
    Config.Language['farm_drown'] = 'Drowned ';
   
-- Inventory Structure
Config.Inventory = Config.Inventory or {}
  
-- other locations not a store or processor that you want blips
Config.Blips = Config.Blips or {}

Config.Blips['fav_butcher'] = { 
        targetZone = vector3(2853.98, 4557.02, 46.15),      -- qb-target vector, center of zone
        targetHeading = 5,                                  -- qb-target box zone
        coords = vector4(2853.98, 4557.02, 46.15, 25.64),   -- Move Location (Ped and blip)
        SetBlipSprite = 568,                                -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
        SetBlipDisplay = 6,                                 -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
        SetBlipScale = 0.65,                                -- Blip Size
        SetBlipColour = 35,                                 -- Blip Color
        BlipLabel = "Butcher",                              -- Blip Label
        minZ = 43.95,                                       -- qb-target Min
        maxZ = 47.95,                                       -- qb-target Max
        toggle=true
    }
    