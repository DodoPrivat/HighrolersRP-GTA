AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC | " .. name, { 128, 128, 128 }, string.sub(msg,5))
	end
end)

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}
	
	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end
	
	return t
end

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/me" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "* " .. name, { 223, 105, 207 }, string.sub(msg,5))
	end
end)

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}
	
	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end
	
	return t
end

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ad" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "ADVERT : " .. name, { 223, 219, 105 }, string.sub(msg,5))
	end
end)

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}
	
	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end
	
	return t
end

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/911" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "911 ", { 242, 70, 70 }, string.sub(msg,5))
	end
end)

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}
	
	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end
	
	return t
end

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/pd" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "Dispatch ", { 242, 70, 70 }, string.sub(msg,5))
	end
end)

function stringsplit(self, delimiter)
	local a = self:Split(delimiter)
	local t = {}
	
	for i = 0, #a - 1 do
		table.insert(t, a[i])
	end
	
	return t
end