local Proxy = require("resources/vRP/lib/Proxy")

RegisterServerEvent('drivers:pass')
AddEventHandler('drivers:pass', function()
      local user_id = vRP.getUserId(source)
          vRP.addUserGroup(user_id,"Driver's License")
          if vRP.hasPermission(user_id,"driver.ls") then
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You have passed the Drivers Test and have been given a License.",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
    end
end)



-- RegisterServerEvent('drivers:fail')
-- AddEventHandler('drivers:fail', function()
-- 	local user_id = vRP.getUserId(player)
-- 	if vRP.hasPermission(user_id,"citizen.paycheck") then
-- 	vRP.giveMoney(user_id,-50)
--           TriggerClientEvent("pNotify:SendNotification", source, {
--             text = "You have failed the Drivers Test!",
--             type = "error",
--             timeout = math.random(1000, 3500),
--             layout = "centerRight",
--             queue = "left"
--             })
-- 	end																														
-- end)--