local Proxy = require("resources/vRP/lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveBankMoney(user_id,300)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Police Paycheck : $300 has been added to your bank account.",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
	end																														
end)

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"ems.paycheck") then
		vRP.giveBankMoney(user_id,250)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "EMS Paycheck : $250 has been added to your bank account.",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
	end																														
end)

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"taxi.paycheck") then
		vRP.giveBankMoney(user_id,100)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Taxi Paycheck : $100 has been added to your bank account.",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
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

RegisterServerEvent('paycheck:bill')
AddEventHandler('paycheck:bill', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"phone.bill") then
		vRP.giveBankMoney(user_id,-50)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Paid Phone Bill : $50 has been taken from your bank account.",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
    end																									
end)

