local Proxy = require("resources/vRP/lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveMoney(user_id,250)
		vRPclient.notify(source,{"PAYDAY: $250"})
	end																														
end)

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"ems.paycheck") then
		vRP.giveMoney(user_id,250)
		vRPclient.notify(source,{"PAYDAY: $250"})
	end																														
end)

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"taxi.paycheck") then
		vRP.giveMoney(user_id,100)
		vRPclient.notify(source,{"PAYDAY: $100"})
	end																														
end)

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"citizen.paycheck") then
		vRP.giveMoney(user_id,50)
		vRPclient.notify(source,{"Welfare: $50"})
	end																														
end)
