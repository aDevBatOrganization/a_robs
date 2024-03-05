fx_version 'cerulean'

game 'gta5'

dependency {
    'mysql-async'
}

shared_scripts {
    'shared/*.lua'
}

client_scripts {
    "src/Wrapper/*.lua",
    "src/UIElements/*.lua",
    "src/UIMenu/elements/*.lua",
    "src/UIMenu/items/*.lua",
    "src/UIMenu/windows/*.lua",
    "src/UIMenu/panels/*.lua",
    "src/UIMenu/*.lua",
    'src/UITimerBar/*.lua',
    'src/UITimerBar/items/*.lua',
    'src/UIProgressBar/*.lua',
    'src/UIProgressBar/items/*.lua',
    "src/NativeUI.lua",
    "src/NativeUIReloaded.lua",
}


client_scripts {
    'client/*.lua',
    'shared/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
    'shared/*.lua'
}
