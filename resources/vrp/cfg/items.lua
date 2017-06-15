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
  ["peach"] = {"Peach","A Peach.",{
    ["Eat"] = {function(player,choice)
      local user_id = vRP.getUserId(player)
      if user_id ~= nil then
        if vRP.tryGetInventoryItem(user_id,"peach",1) then
          vRP.varyHunger(user_id,-10)
          vRP.varyThirst(user_id,-10)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Eating Peach",
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
  }
},


--Gold items
  ["gold_ore"] = {"Gold Ore","",{},4},
  ["gold_processed"] = {"Processed Gold","",{},3},
  ["gold_ingot"] = {"Gold Ingot","",{},2},
--Meth items
  ["Nail Polish Remover"] = {"Nail Polish Remover","",{},0.1},
  ["Window Cleaner"] = {"Window Cleaner","",{},1.0},
  ["Cold Medicine"] = {"Cold Medicine","",{},0.3},
  ["Hydrochloric Acid"] = {"Hydrochloric Acid","",{},1.0},
  ["Box of Matches"] = {"Box of Matches","",{},0.4},
  ["Brake Fluid"] = {"Brake Fluid","",{},1.0},
  ["lye"] = {"lye","",{},1.0},
  ["Drain Cleaner"]= {"Drain Cleaner","",{},1.0},

--Phones
  ["brokia"]= {"Brokia Phone","",{},0.0},

--delivery products
  ["TV"]= {"Television","",{},30.0},
  ["beer"]= {"Crate of Beer","",{},25.0},
  ["phonecrate"]= {"Crate of Phones","",{},15.0},
  ["furbees"]= {"Crate of Furbees","",{},20},
  ["golfball"]= {"Bucket of Golf Balls","",{},20}

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