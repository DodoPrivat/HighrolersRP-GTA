SR = {
	lastError = ""
}

function SR:isAdmin( playerID )
	local ids = GetPlayerIdentifiers( playerID )
	
	for k,v in pairs( self.admins ) do
		if findi( ids, v ) ~= nil then
			return true
		end
	end
	
	return false
end