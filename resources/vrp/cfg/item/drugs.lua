
local items = {}

local function play_drink(player)
  local seq = {
    {"mp_player_intdrink","intro_bottle",1},
    {"mp_player_intdrink","loop_bottle",1},
    {"mp_player_intdrink","outro_bottle",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

local function play_smoke(player)
   local seq = {
     {"mp_player_int_uppersmoke","mp_player_int_smoke_enter",1},
     {"mp_player_int_uppersmoke","mp_player_int_smoke",1},
     {"mp_player_int_uppersmoke","mp_player_int_smoke_exit",1}
   }

  vRPclient.playAnim(player,{true,seq,false})
end

local function play_eat(player)
  local seq = {
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
    {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
  }

  vRPclient.playAnim(player,{true,seq,false})
end

-- create Pills item
local pills_choices = {}
pills_choices["Take"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"pills",1) then
      vRPclient.varyHealth(player,{25})
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Taking a Pill",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
      play_drink(player)
      vRP.closeMenu(player)
    end
  end
end}

items["pills"] = {"Pills","Medication to heal a person.",pills_choices,0.1}

-- create weed item
local weed_choices = {}
weed_choices["Smoke"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"weed",1) then
      vRP.varyThirst(user_id, 5)
      vRP.varyHunger(user_id, 20)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Smoking Weed",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
      vRPclient.playScreenEffect(player,{"DrugsTrevorClownsFight",3*60})
      play_smoke(player)
      vRP.closeMenu(player)
    end
  end
end}
items["weed"] = {"Weed","The Devils Lettuce",weed_choices,0.5}

-- create Marijuana item
local marijuana_choices = {}
marijuana_choices["Eat?"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"marijuana",1) then
      vRPclient.varyHealth(player,{-5})
      vRP.varyThirst(user_id, 2)
      vRP.varyHunger(user_id, 8.5)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Eating Weed.. Are you dumb?",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
      play_eat(player)
      vRP.closeMenu(player)
    end
  end
end}
items["marijuana"] = {"Marijuana","The Raw Dawg of Weed",weed_choices,1}

local meth_choices = {}
meth_choices["Take"] = {function(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    if vRP.tryGetInventoryItem(user_id,"meth",1) then
      vRP.varyThirst(user_id, 5)
      vRP.varyHunger(user_id, 20)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Smoking Meth",
            type = "info",
            timeout = math.random(1000, 3500),
            layout = "centerRight",
            queue = "left"
            })
      vRPclient.playScreenEffect(player,{"Rampage",3*60})
      play_smoke(player)
      vRP.closeMenu(player)
    end
  end
end}
items["meth"] = {"Meth","The Devils Cough Medicine",meth_choices,0.5}



return items
