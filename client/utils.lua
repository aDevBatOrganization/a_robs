_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("AtradiumRP | FA", "24/24 - Shop")
_menuPool:Add(mainMenu)
xPlayer = PlayerPedId()

-- #####################################################################################################################################################################################################################

-- ################ --
-- ## MENU main ## --
-- ################ --

function AddmainMenu(menu)
    local telephone = NativeUI.CreateItem("Telephone", "Acheter un telephone pour ~g~ 400$")
    menu:AddItem(telephone)
    local gps = NativeUI.CreateItem("GPS", "Acheter un GPS pour ~g~ 250$")
    menu:AddItem(gps)

    menu.OnItemSelect = function(_, item, index)
        if item == telephone then
            print("Tu as recu un telephone")
            TriggerServerEvent("givePhone")
        elseif item == gps then
            print("Tu as acheter un GPS")
        end
    end
end

AddmainMenu(mainMenu)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        local pedPos = GetEntityCoords(xPlayer)
        local distance = GetDistanceBetweenCoords(pedPos.x, pedPos.y, pedPos.z, Config.markerX, Config.markerY,
            Config.markerZ, true)

        if distance < 1 then
            AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour voir le magasin")
            DisplayHelpTextThisFrame("HELP", false)
            if IsControlJustPressed(1, 51) then
                mainMenu:Visible(not mainMenu:Visible())
            end
        elseif distance > 2 then
            mainMenu:Visible(false)
        end
    end
end)

-- #####################################################################################################################################################################################################################
-- #####################################################################################################################################################################################################################
-- #####################################################################################################################################################################################################################

-- ############ --
-- ## MARKER ## --
-- ############ --

Citizen.CreateThread(function()
    print("ok")
    while true do
        DrawMarker(20, Config.markerX, Config.markerY, Config.markerZ, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 113,
            14, 14, 170,
            false, true, 2, false, nil, nil, false)
        Wait(10)
    end
end)

-- #####################################################################################################################################################################################################################
-- #####################################################################################################################################################################################################################
-- #####################################################################################################################################################################################################################
