------------------------------ SCRIPT PARAMETERS CAN BE CHANGED BETWEEN ------------------------------

local distanceParam = 5 -- Change this value to change the distance needed to lock / unlock a vehicle
-----
local key = 303 -- Change this value to change the key (List of values below)
-----
local chatMessage = false -- Put on false to disable message notifications and enable notifications above the radar. (Put on 0 for disable all)
-----
local chatCommands = true -- Put on true for enable chat Commands and disable the key
-----
local playSound = true -- Put on false for disable sound when Lock/Unlock (To change the sounds, follow the instructions here : https://forum.fivem.net/t/release-locksystem/17750/5)
-----

------------------------------ SCRIPT PARAMETERS CAN BE CHANGED BETWEEN ------------------------------


            ------------------------------ KEY LIST HERE ------------------------------

--[[    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
        ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
        ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
        ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
        ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
        ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
        ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
        ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
        ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118    ]]

            ------------------------------ KEY LIST HERE -----------------------------

---------------------------------------------------------------------------------------------------------------
------------------------------ Don't touch after that if you are not a developer ------------------------------
---------------------------------------------------------------------------------------------------------------

-- Initialisation des variables
local lastCar, posCar = 0

--
-- Thread principal
Citizen.CreateThread(function() 
    while true do 
        Wait(0) 

        if IsControlJustPressed(1, key) then

            local player = GetPlayerPed(-1)
            local lastCar = SetPlayersLastVehicle(GetVehiclePedIsIn(player, true))
            local FixAction = IsPedGettingIntoAVehicle(player)

            if lastCar ~= 0 then

                GetPosition(lastCar, player)

            end

            if lastCar == 0 then

                if not FixAction then

                    if chatMessage then
                        TriggerEvent("chatMessage", "Error", {255, 0, 0}, "This is not your vehicle!")
                    elseif not chatMessage then
        TriggerEvent("pNotify:SendNotification", {
            text = "This is not your vehicle!",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "right"
        })
                    end

                end

            else          

                distanceBetweenVehPlayer = GetDistanceBetweenCoords(carX, carY, carZ, playerX, playerY, playerZ, false)

                if distanceBetweenVehPlayer <= distanceParam then

                    lockStatus = GetVehicleDoorLockStatus(lastCar) 

                    if lockStatus == 1 or lockStatus == 0 then

                        if not FixAction then

                            engineValue = IsPedInAnyVehicle(player)
                            lockStatus = SetVehicleDoorsLocked(lastCar, 2)
                            SetVehicleDoorsLockedForPlayer(lastCar, PlayerId(), false)

                            if chatMessage then
                                TriggerEvent("chatMessage", "Info", {0, 255, 0}, "Vehicle Locked.")
                            elseif not chatMessage then
                            TriggerEvent("pNotify:SendNotification", {
                                text = "Vehicle Locked",
                                type = "warning",
                                timeout = math.random(1000, 10000),
                                layout = "centerRight",
                                queue = "right"
                            })
                            end

                            if playSound then
                                TriggerEvent('InteractSound_CL:PlayOnOne', 'lock', 1.0)
                            end
                            
                            if not engineValue then
                                SetVehicleEngineOn(lastCar, false, false, true)
                            end

                        end

                    else

                        if not FixAction then

                            lockStatus = SetVehicleDoorsLocked(lastCar, 1)
                        
                            if chatMessage then
                                TriggerEvent("chatMessage", "Info", {0, 255, 0}, "Vehicle Unlocked.")
                            elseif not chatMessage then
                           TriggerEvent("pNotify:SendNotification", {
                               text = "Vehicle Unlocked",
                               type = "success",
                               timeout = math.random(1000, 10000),
                               layout = "centerRight",
                               queue = "right"
                           })
                            end

                            if playSound then
                                TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 1.0)
                            end

                        end

                    end

                else

                    if chatMessage then
                        TriggerEvent("chatMessage", "Error", {255, 0, 0}, "You are too far from the vehicle.")
                    elseif not chatMessage then
                   TriggerEvent("pNotify:SendNotification", {
                       text = "Too far away from Vehicle!",
                       type = "error",
                       timeout = math.random(1000, 10000),
                       layout = "centerRight",
                       queue = "right"
                   })
                    end

                end
            end
        end
    end
end)

function GetPosition(lastCar, player)
    posCar = GetEntityCoords(lastCar, false)
    carX, carY, carZ = posCar.x, posCar.y, posCar.z 

    posPlayer = GetEntityCoords(player, false) 
    playerX, playerY, playerZ = posPlayer.x, posPlayer.y, posPlayer.z
    return
end

-- RegisterNetEvent("locksystem:notify")
-- AddEventHandler("locksystem:notify", function(text)
--   Citizen.CreateThread(function()
--     Wait(1)
--     SetNotificationTextEntry("STRING");
--     AddTextComponentString(text);
--     Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, "LockSystem", "Version 1.0", 0.070);
--     DrawNotification_4(false, true);
--     end)
-- end)
