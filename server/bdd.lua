-- ########################################
-- Regarder le steam id de tous les joueurs
-- ########################################

function getSteamId(playerId)
    local steamIdentifier = GetPlayerIdentifiers(playerId)
    for key, value in pairs(steamIdentifier) do
        if string.match(value, "steam:") then
            return value
        end
    end
    return nil
end

-- Give Item Phone

RegisterNetEvent("givePhone")
AddEventHandler("givePhone", function()
    local _src = source
    local steamIdentifier = getSteamId(_src)
    local item = "phone"
    print(steamIdentifier)
    if steamIdentifier then
        print("^3[DB]^7 : Le joueur " .. steamIdentifier .. " a eu un telphone")
        MySQL.Async.execute(
            "INSERT INTO player_item_fivem (steamid, name_id, quantity) VALUES (@steamid, @name_id, @quantity)", {
                ["steamid"] = steamIdentifier,
                ["name_id"] = "phone",
                ["quantity"] = 1
            })
    end
end)
