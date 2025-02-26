fx_version 'cerulean'
game 'gta5'

author 'TRClassic#0001'
description 'Farming script for QBCore Modded 4 Mez'
version '1.1.3'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua',
    'client/*.lua'
}

server_scripts { 
    'server/server.lua',
    'server/*.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}

this_is_a_map 'yes'
