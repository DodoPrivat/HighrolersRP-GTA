
-- AddEventHandler("chatMessage", function(p, color, msg)
    -- if msg:sub(1, 1) == "/" then
        -- fullcmd = stringSplit(msg, " ")
        -- cmd = fullcmd[1]
		
		

        -- if cmd == "/stopscript" then
				-- --TriggerClientEvent( "chatMessage", source, "SR", {255,255,255}, "You have not yet stopped: " .. fullcmd[2] )
				-- --if SR:isAdmin( source ) then
				-- TriggerClientEvent( "chatMessage", p, "SR", {255,255,255}, "You have stoped: " .. fullcmd[2] )
				
				-- StopResource(tostring(fullcmd[2]))
						
					
				-- --else
				-- --	TriggerClientEvent( "chatMessage", source, "SR", {255,255,255}, "You do not have permission to do this command" )
				-- --end
				-- CancelEvent()
        -- end
        -- if cmd == "/startscript" then
			
				-- --if SR:isAdmin( source ) then
				-- --	TriggerClientEvent( "chatMessage", source, "SR", {255,255,255}, "You have started: " .. fullcmd[2] )
					-- StartResource(tostring(fullcmd[2]))
						-- TriggerClientEvent( "chatMessage", p, "SR", {255,255,255}, "You have started: " .. fullcmd[2] )
					
					
				-- --else
					-- --TriggerClientEvent( "chatMessage", source, "SR", {255,255,255}, "You do not have permission to do this command" )
				-- --end
				-- CancelEvent()
			-- end
			
        -- if cmd == "/rscript" then
			
				-- --if SR:isAdmin( source ) then
				-- --	TriggerClientEvent( "chatMessage", source, "SR", {255,255,255}, "You have started: " .. fullcmd[2] )
					-- StopResource(tostring(fullcmd[2]))
						
						
						
					-- StartResource(tostring(fullcmd[2]))
					
					
					-- TriggerClientEvent( "chatMessage", p, "SR", {255,255,255}, "You have restarted: " .. fullcmd[2])
					
					-- --StartResource(tostring(fullcmd[2]))
				-- --else
					
				-- --end
				-- CancelEvent()
			-- end
			
        
    -- end
 
	
-- end)
AddEventHandler("chatMessage", function(p, color, msg)
    if msg:sub(1, 1) == "/" then
        fullcmd = stringSplit(msg, " ")
        cmd = fullcmd[1]
		
		

        if cmd == "/stop" then
			StopResource(tostring(fullcmd[2]))
			TriggerClientEvent( "chatMessage", p, "SR", {255,255,255}, "You have stopped: " .. fullcmd[2])
        	CancelEvent()
        end
        if cmd == "/start" then
			StartResource(tostring(fullcmd[2]))
			TriggerClientEvent( "chatMessage", p, "SR", {255,255,255}, "You have started: " .. fullcmd[2])
        	CancelEvent()
        end
        if cmd == "/rs" then
			StopResource(tostring(fullcmd[2]))
			StartResource(tostring(fullcmd[2]))
			TriggerClientEvent( "chatMessage", p, "SR", {255,255,255}, "You have restarted: " .. fullcmd[2])
        	CancelEvent()
        end
		
    end
end)
function stringSplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end
