-- define items, see the Inventory API on github

local cfg = {}

local function play_eat(player)
  local seq = {
      {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
      {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
      {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
      {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
  }

   vRPclient.playAnim(player,{true,seq,false})
 end

-- idname = {name,description,choices}
cfg.items = {
  ["fruit_peche"] = {"Peach","A Peach.",{
    ["Eat"] = {function(player,choice)
      local user_id = vRP.getUserId(player)
      if user_id ~= nil then
        if vRP.tryGetInventoryItem(user_id,"fruit_peche",1) then
          vRP.varyHunger(user_id,-10)
          vRP.varyThirst(user_id,-10)
          vRPclient.notify(player,{"~o~ Eat Peach."})
          play_eat(player)
          vRP.closeMenu(player)
        end
      end
    end}
  }},



  ["gold_ore"] = {"Gold Ore","",{},4},
  ["gold_processed"] = {"Processed Gold","",{},3},
  ["gold_ingot"] = {"Gold Ingot","",{},2}
  -- items["breed"] = {"Bread","",breed_choices,0.5}
}

-- load more items function
local function load_item_pack(name)
  local items = require("resources/vrp/cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[vRP] item pack ["..name.."] not found")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")

return cfg