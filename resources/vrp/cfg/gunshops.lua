
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permission (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
  ["weapons"] = {
    _config = {blipid=110,blipcolor=59},
    ["WEAPON_BAT"] = {"Bat",350,0,""},
    ["WEAPON_KNIFE"] = {"Knife",500,0,""},
    ["WEAPON_PISTOL"] = {"Pistol",5000,15,""},
    ["WEAPON_COMBATPISTOL"] = {"Combat Pistol",5250,15,""},
    ["WEAPON_DAGGER"] = {"Dagger",1000,0,""},
    ["WEAPON_HATCHET"] = {"Hatchet",1500,0,""},
    ["WEAPON_MACHETE"] = {"Machete",1250,0,""},
    ["WEAPON_SNOWBALL"] = {"SnowBall",100,0,""},
    ["WEAPON_FLASHLIGHT"] = {"FlashLight",50000,0,""},
  },

  ["blackmarket"] = {
    _config = {blipid=154,blipcolor=1},
    ["WEAPON_KNUCKLE"] = {"Knuckle",500,0,"It's legal... till you use it."},
    ["WEAPON_MICROSMG"] = {"Uzi",25000,25,"Illegal Full Auto Weapon"}, --BlackMarket
    ["WEAPON_MOLOTOV"] = {"Molotov",1000,45,"Illegal Throwable Fire Bottle"}, -- BlackMarket
    ["WEAPON_SNIPERRIFLE"] = {"Sniper Rifle",350000,50,"Illegal Large Sniper Rifle"}, --BlackMarket
    ["WEAPON_SAWNOFFSHOTGUN"] = {"Sawn-Off Shotgun",250000,65,"Illegal Sawn-Off Shotgun"} --BlackMarket
  }
}

-- list of gunshops positions

cfg.gunshops = {
  {"weapons", 1692.41, 3758.22, 34.7053},
  {"weapons", 252.696, -48.2487, 69.941},
  {"weapons", 844.299, -1033.26, 28.1949},
  {"weapons", -331.624, 6082.46, 31.4548},
  {"weapons", -664.147, -935.119, 21.8292},
  {"weapons", -1320.983, -389.260, 36.483},
  {"weapons", -1119.48803710938,2697.08666992188,18.5541591644287},
  {"weapons", 2569.62, 294.453, 108.735},
  {"weapons", -3172.60375976563,1085.74816894531,20.8387603759766},
  {"weapons", 21.70, -1107.41, 29.79},
  {"weapons", 810.15, -2156.88, 29.61},
  {"blackmarket", 127.15128326416,-1941.63134765625,20.6512432098389}
}

return cfg
