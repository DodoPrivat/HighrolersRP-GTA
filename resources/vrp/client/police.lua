
-- this module define some police tools and functions

local handcuffed = false

-- set player as cop (true or false)
function tvRP.setCop(flag)
  cop = flag
  SetPedAsCop(GetPlayerPed(-1),flag)
end

-- HANDCUFF

function tvRP.toggleHandcuff()
  handcuffed = not handcuffed

  SetEnableHandcuffs(GetPlayerPed(-1), handcuffed)
  if handcuffed then
    tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
  else
    tvRP.stopAnim(true)
    SetPedStealthMovement(GetPlayerPed(-1),false,"") 
  end
end

function tvRP.setHandcuffed(flag)
  if handcuffed ~= flag then
    tvRP.toggleHandcuff()
  end
end

function tvRP.isHandcuffed()
  return handcuffed
end

-- function tvRP.drag()
--       if drag then
--         local ped = GetPlayerPed(GetPlayerFromServerId(officerDrag))
--         local myped = GetPlayerPed(-1)
--         AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
--       else
--         DetachEntity(GetPlayerPed(-1), true, false)   
--       end
--     end

-- (experimental, based on experimental getNearestVehicle)
function tvRP.putInNearestVehicleAsPassenger(radius)
  local veh = tvRP.getNearestVehicle(radius)

  if IsEntityAVehicle(veh) then
    for i=1,math.max(GetVehicleMaxNumberOfPassengers(veh),3) do
      if IsVehicleSeatFree(veh,i) then
        SetPedIntoVehicle(GetPlayerPed(-1),veh,i)
        return true
      end
    end
  end
  
  return false
end


function tvRP.putInNearestVehicleAsPassenger(radius)
  local veh = tvRP.getNearestVehicle(radius)

  if IsEntityAVehicle(veh) then
    for i=0,GetVehicleMaxNumberOfPassengers(veh) do
      if IsVehicleSeatFree(veh,i) then
        SetPedIntoVehicle(GetPlayerPed(-1),veh,i)
        return true
      end
    end
  end
  
  return false
end

-- keep handcuffed animation
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(15000)
    if handcuffed then
      tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
    end
  end
end)

-- force stealth movement while handcuffed (prevent use of fist and slow the player)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if handcuffed then
      SetPedStealthMovement(GetPlayerPed(-1),true,"")
      DisableControlAction(0,21,true) -- disable sprint
      DisableControlAction(0,24,true) -- disable attack
      DisableControlAction(0,25,true) -- disable aim
      DisableControlAction(0,263,true) -- disable melee
      DisableControlAction(0,264,true) -- disable melee
      DisableControlAction(0,140,true) -- disable melee
      DisableControlAction(0,141,true) -- disable melee
      DisableControlAction(0,142,true) -- disable melee
      DisableControlAction(0,143,true) -- disable melee
      DisableControlAction(0,75,true) -- disable exit vehicle
      DisableControlAction(27,75,true) -- disable exit vehicle
    end
  end
end)

-- JAIL

local jail = nil

-- jail the player in a no-top no-bottom cylinder 
function tvRP.jail(x,y,z,radius)
  tvRP.teleport(x,y,z) -- teleport to center
  jail = {x+0.0001,y+0.0001,z+0.0001,radius+0.0001}
end

-- unjail the player
function tvRP.unjail()
  jail = nil
end

function tvRP.isJailed()
  return jail ~= nil
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5)
    if jail then
      local x,y,z = tvRP.getPosition()

      local dx = x-jail[1]
      local dy = y-jail[2]
      local dist = math.sqrt(dx*dx+dy*dy)

      if dist >= jail[4] then
        local ped = GetPlayerPed(-1)
        SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001) -- stop player

        -- normalize + push to the edge + add origin
        dx = dx/dist*jail[4]+jail[1]
        dy = dy/dist*jail[4]+jail[2]

        -- teleport player at the edge
        SetEntityCoordsNoOffset(ped,dx,dy,z,true,true,true)
      end
    end
  end
end)


