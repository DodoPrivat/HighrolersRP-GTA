-- function GetVehHealthPercent()
	-- local ped = GetPlayerPed(-1)
	-- local vehicle = GetVehiclePedIsUsing(ped)
	-- local vehiclehealth = GetEntityHealth(vehicle) - 100
	-- local maxhealth = GetEntityMaxHealth(vehicle) - 100
	-- local procentage = (vehiclehealth / maxhealth) * 100
	-- return procentage
-- end

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end


Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsUsing(ped)
		--local damage = GetVehHealthPercent(vehicle)
		
		if IsPedInAnyVehicle(ped, false) then
			SetVehicleEngineCanDegrade(GetVehiclePedIsUsing(ped), true)
			local eg = GetVehicleEngineHealth(vehicle)
			if eg < 930 then
				SetVehicleEnginePowerMultiplier(vehicle, .5) -- not working right now
			end
			--ShowNotification(tostring(eg)) -- for testing only, displays engine health values in game
			--TriggerServerEvent("vh:enginehealth", ped)
			--SetPlayerVehicleDamageModifier(PlayerId(), 100) -- Seems to not work at the moment --
			if eg < 870 then
				SetVehicleUndriveable(vehicle, true)
				ShowNotification("~g~Vehicle is too damaged.")
			end
		end
	end
end)

