_menuPool = NativeUI.CreatePool()
xPlayer = PlayerPedId()

-- #####################################################################################################################################################################################################################

-- ################ --
-- ## MENU utils ## --
-- ################ --

-- creation de la structure du menu utils

utilsMenu = NativeUI.CreateMenu("AtradiumRP | FA", "24/24 - Shop - Utils")
_menuPool:Add(utilsMenu)

-- function pour invoquer le menu utils

function AddutilsMenu(menu)
    local telephone = NativeUI.CreateItem("Telephone", "Acheter un telephone pour ~g~ 400$")
    menu:AddItem(telephone)
    local gps = NativeUI.CreateItem("GPS", "Acheter un GPS pour ~g~ 250$")
    menu:AddItem(gps)
    local precision_scales = NativeUI.CreateItem("Balance de precision", "Acheter une balance de precision pour ~g~ 100$")
    menu:AddItem(precision_scales)

    menu.OnItemSelect = function(_, item, index)
        if item == telephone then
            print("Tu as recu un telephone")
            TriggerServerEvent("givePhone")
        elseif item == gps then
            print("Tu as acheter un GPS")
        end
    end
end

-- appel du menu utils

AddutilsMenu(utilsMenu)

-- ################ --
-- ## MENU food ## --
-- ################ --

-- creation de la structure du menu food

foodMenu = NativeUI.CreateMenu("AtradiumRP | FA", "24/24 - Shop - Nourriture")
_menuPool:Add(foodMenu)

-- function pour invoquer le menu food

function AddfoodMenu(menu)
    local chocolate_candy = NativeUI.CreateItem("Chocolat et Bonbon", "Acheter du chocolat et des bonbon pour ~g~ 100$")
    menu:AddItem(chocolate_candy)
    local bread = NativeUI.CreateItem("Pain", "Acheter du pain pour ~g~ 80$")
    menu:AddItem(bread)
    local milk = NativeUI.CreateItem("Lait", "Acheter du lait pour ~g~ 50$")
    menu:AddItem(milk)

    menu.OnItemSelect = function(_, item, index)
        if item == chocolate_candy then
            print("Tu as recu du chocolat")
        elseif item == bread then
            print("Tu as acheter du pain")
        end
    end
end

-- appel du menu food

AddfoodMenu(foodMenu)


-- ################ --
-- ## MENU drink ## --
-- ################ --

-- creation de la structure du menu drink

drinkMenu = NativeUI.CreateMenu("AtradiumRP | FA", "24/24 - Shop - Boisson")
_menuPool:Add(drinkMenu)

-- function pour invoquer le menu drink

function AdddrinkMenu(menu)
    local orange_juice = NativeUI.CreateItem("Jus d'orange", "Acheter du jus d'orange pour ~g~ 20$")
    menu:AddItem(orange_juice)
    local soda = NativeUI.CreateItem("Soda", "Acheter du soda pour ~g~ 50$")
    menu:AddItem(soda)
    local water = NativeUI.CreateItem("Eau", "Acheter de l'eau pour ~g~ 10$")
    menu:AddItem(water)

    menu.OnItemSelect = function(_, item, index)
        if item == orange_juice then
            print("Tu as recu du jus d'orange")
        elseif item == soda then
            print("Tu as acheter du soda")
        end
    end
end

-- appel du menu drink

AdddrinkMenu(drinkMenu)

-- ################ --
-- ## MENU basket ## --
-- ################ --

-- creation de la structure du menu pannier

basketMenu = NativeUI.CreateMenu("AtradiumRP | FA", "24/24 - Shop - Pannier")
_menuPool:Add(basketMenu)

-- function pour invoquer le menu pannier

function AddbasketMenu(menu)
    local price = NativeUI.CreateItem("Prix de votre pannier", "~g~ 20$")
    menu:AddItem(price)

    menu.OnItemSelect = function(_, item, index)
        if item == price then
            print("Tu as payer 20$")
        end
    end
end

-- appel du menu pannier

AddbasketMenu(basketMenu)

-- ################################################ --
-- ##### OUVERTURE DES MENU & AFFICHAGE MARKER #### --
-- ################################################ --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        local pedPos = GetEntityCoords(xPlayer)
        -- distance entre le joueur et le point generique
        local distance = GetDistanceBetweenCoords(
            pedPos.x,
            pedPos.y,
            pedPos.z,
            Config.markerX.VespucciRobs.Central,
            Config.markerY.VespucciRobs.Central,
            Config.markerZVespucciRobs,
            true
        )
        -- distance entre le joueur et le point Utils
        local distanceUtils = GetDistanceBetweenCoords(
            pedPos.x,
            pedPos.y,
            pedPos.z,
            Config.markerX.VespucciRobs.Utils,
            Config.markerY.VespucciRobs.Utils,
            Config.markerZVespucciRobs,
            true
        )
        -- distance entre le joueur et le point food
        local distanceFood = GetDistanceBetweenCoords(
            pedPos.x,
            pedPos.y,
            pedPos.z,
            Config.markerX.VespucciRobs.Food,
            Config.markerY.VespucciRobs.Food,
            Config.markerZVespucciRobs,
            true
        )
        -- distance entre le joueur et le point drink
        local distanceDrink = GetDistanceBetweenCoords(
            pedPos.x,
            pedPos.y,
            pedPos.z,
            Config.markerX.VespucciRobs.Drink,
            Config.markerY.VespucciRobs.Drink,
            Config.markerZVespucciRobs,
            true
        )
        -- distance entre le joueur et le point basket
        local distanceBasket = GetDistanceBetweenCoords(
            pedPos.x,
            pedPos.y,
            pedPos.z,
            Config.markerX.VespucciRobs.Paye,
            Config.markerY.VespucciRobs.Paye,
            Config.markerZVespucciRobs,
            true
        )
        -- check de la distance a partir du point utils
        if distanceUtils < 1 then
            AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour voir le magasin utiles")
            DisplayHelpTextThisFrame("HELP", false)
            if IsControlJustPressed(1, 51) then
                utilsMenu:Visible(not utilsMenu:Visible())
            end
            -- check de la distance a partir du point food
        elseif distanceFood < 1 then
            AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour voir le magasin de nourriture")
            DisplayHelpTextThisFrame("HELP", false)
            if IsControlJustPressed(1, 51) then
                foodMenu:Visible(not foodMenu:Visible())
            end
            -- check de la distance a partir du point drink
        elseif distanceDrink < 1 then
            AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour voir le magasin de boisson")
            DisplayHelpTextThisFrame("HELP", false)
            if IsControlJustPressed(1, 51) then
                drinkMenu:Visible(not drinkMenu:Visible())
            end
            -- check de la distance a partir du point basket
        elseif distanceBasket < 1 then
            AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour voir le pannier")
            DisplayHelpTextThisFrame("HELP", false)
            if IsControlJustPressed(1, 51) then
                basketMenu:Visible(not basketMenu:Visible())
            end
            -- check de la distance pour les point utils, food, drink et basket
        elseif distance < 5 then
            -- merker utils
            DrawMarker(20, Config.markerX.VespucciRobs.Utils, Config.markerY.VespucciRobs.Utils,
                Config.markerZVespucciRobs, 0.0,
                0.0,
                0.0, 0.0, 0.0,
                0.0, 0.4,
                0.4, 0.4, 113,
                14, 14, 170,
                false, true, 2, false, nil, nil, false)
            -- merker food
            DrawMarker(20, Config.markerX.VespucciRobs.Food, Config.markerY.VespucciRobs.Food, Config
                .markerZVespucciRobs, 0.0,
                0.0,
                0.0, 0.0, 0.0,
                0.0,
                0.4, 0.4,
                0.4, 113,
                14, 14, 170,
                false, true, 2, false, nil, nil, false)
            -- merker drink
            DrawMarker(20, Config.markerX.VespucciRobs.Drink, Config.markerY.VespucciRobs.Drink,
                Config.markerZVespucciRobs, 0.0,
                0.0,
                0.0, 0.0, 0.0,
                0.0,
                0.4, 0.4,
                0.4, 113,
                14, 14, 170,
                false, true, 2, false, nil, nil, false)
            -- marker pannier
            DrawMarker(20, Config.markerX.VespucciRobs.Paye, Config.markerY.VespucciRobs.Paye, Config
                .markerZVespucciRobs, 0.0,
                0.0,
                0.0, 0.0, 0.0,
                0.0,
                0.4, 0.4,
                0.4, 113,
                14, 14, 170,
                false, true, 2, false, nil, nil, false)
            -- check de la distance pour les point utils, food, drink et basket
        elseif distanceUtils or distanceFood or distanceDrink or basketMenu > 2 then
            -- fermeture de tous les menu
            utilsMenu:Visible(false)
            foodMenu:Visible(false)
            drinkMenu:Visible(false)
            basketMenu:Visible(false)
        end
    end
end)

-- #####################################################################################################################################################################################################################
--
