fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Dovydas5dev'
version '1.0.0'

shared_scripts {'@ox_lib/init.lua'}
client_script 'client.lua'
server_scripts {'server.lua', 'config.lua', '@oxmysql/lib/MySQL.lua'}
