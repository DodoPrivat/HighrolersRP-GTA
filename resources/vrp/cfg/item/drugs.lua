
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
    {"amb@world_human_smoking_pot@male@base"}
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
      vRPclient.notify(player,{"~g~ Taking pills."})
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
      vRP.varyHunger(user_id, 30)
      vRPclient.notify(player,{"~b~ Smoking Weed."})
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
      vRP.varyHunger(user_id, 10)
      vRPclient.notify(player,{"~b~Eating Raw Marijuana... are you stupid?"})
      play_drink(player)
      vRP.closeMenu(player)
    end
  end
end}
items["marijuana"] = {"Marijuana","The Raw Dawg of Weed",weed_choices,0.5}



return items
