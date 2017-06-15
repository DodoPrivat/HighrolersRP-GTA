
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)
-- Police
local police = {}

function police.init(player)
  local weapons = {}
  weapons["WEAPON_STUNGUN"] = {ammo=1000}
  weapons["WEAPON_COMBATPISTOL"] = {ammo=100}
  weapons["WEAPON_NIGHTSTICK"] = {ammo=0}
  weapons["WEAPON_FLASHLIGHT"] = {ammo=0}
  weapons["WEAPON_FLARE"] = {ammo=20}
  -- ShotGun / Carbine

  
  vRPclient.giveWeapons(player,{weapons,true})
  vRPclient.setCop(player,{true})
end

function police.onjoin(player)
  police.init(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You went on duty as a Police Officer",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function police.onleave(player)
  vRPclient.giveWeapons(player,{{},true})
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You went off duty",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
  vRPclient.setCop(player,{false})
end

function police.onspawn(player)
  police.init(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are a Police Officer",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- OffDuty Cop

local offduty = {}
function offduty.onjoin(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Off Duty Police Officer",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function offduty.onspawn(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are an Off Duty Officer",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function offduty.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Going on Duty...",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- EMS

local ems = {}

function ems.init(player)
  local weapons = {}
  weapons["WEAPON_FIREEXTINGUISHER"] = {ammo=0}
  weapons["WEAPON_FLASHLIGHT"] = {ammo=0}
  weapons["WEAPON_FLARE"] = {ammo=20}
  
  vRPclient.giveWeapons(player,{weapons,true})
  vRPclient.setEms(player,{true})
end

function ems.onjoin(player)
  ems.init(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You've gone on Duty. Visit the Drug Store to get your equipment!",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function ems.onleave(player)
  vRPclient.giveWeapons(player,{{},true})
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You have left the Hospital",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
  vRPclient.setEms(player,{false})
end

function ems.onspawn(player)
  ems.init(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are an EMT",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- Taxi

local taxi = {}

function taxi.onjoin(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are a Taxi Driver",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function taxi.onspawn(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are a Taxi Driver",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function taxi.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Quit Taxi Driver",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- News

local news = {}

function news.onjoin(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Joined Weasel News",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Use /news [MSG] to do your job!",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function news.onspawn(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are a News Reporter",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function news.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Quit Weasel News",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- Citizen

local citizen = {}

function citizen.onjoin(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are an Unemployed Citizen",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function citizen.onspawn(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are an Unemployed Citizen",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function citizen.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Enjoy your new Job!",
            type = "success",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- Tow

local tow = {}

function tow.onjoin(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are a Mechanic",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function tow.onspawn(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You are a Mechanic",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function tow.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You have quit Mechanic",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- Brokia Phone

local brokia = {}

function brokia.onspawn(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Your phone has been replaced!",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function brokia.onjoin(player)
local user_id = vRP.getUserId(player)
  vRP.giveInventoryItem(user_id,"brokia", 1)
  vRP.giveMoney(user_id,-50)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You have Activated your Brokia phone!",
            type = "info",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function brokia.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You have canceled your contract!",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- License

local license = {}

function license.onjoin(player)
local user_id = vRP.getUserId(player)
  vRP.giveInventoryItem(user_id,"license", 1)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You've been given a Drivers License",
            type = "success",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

function license.onleave(player)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "You have lost your Drivers License",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerRight",
            queue = "left"
            })
end

-- User

local function user_spawn(player)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil and vRP.isFirstSpawn(user_id) then
    -- welcome instructions
    local data = vRP.getUserDataTable(user_id)
          TriggerClientEvent("pNotify:SendNotification", source, {
            text = "Loading : Please wait for the 'Loading...' box below to disappear!",
            type = "info",
            timeout = math.random(1000, 50000),
            layout = "centerRight",
            queue = "left"
            })
  end
end

-- Groups Config

cfg.groups = {
 
   ["admin"] = {
   _config = {onspawn = function(player) vRPclient.notify(player,{"Logged in as an Admin."}) end},
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.display_custom",
    "player.custom_sound",
    "player.coords",
    "player.tptome",
    "player.tpto",
    "admin.tickets",
    "player.group.add",
    "player.group.remove",
    "player.givemoney",
    "player.giveitem"
  },
  -- Group : User added to all new Users
  ["user"] = {
    _config = { gtype = "job", onspawn = user_spawn },
    "police.askid",
    "phones.store",
    "player.list",
    "citizen.paycheck"
  },
  ["Driver's License"] = {
    _config = { gtype = "license", onspawn = license.onspawn, onjoin = license.onjoin, onleave = license.onleave },
    "driver.ls"
  },
  -- Phone Group
  ["Activate Brokia Phone"] = {
    _config = { gtype = "phone", onspawn = brokia.onspawn, onjoin = brokia.onjoin, onleave = brokia.onleave },
    "player.phone",
    "phone.bill"
  },
  
  ["Cancel Contract"] = {
    _config = { gtype = "phone",},
    "police.askid",
    "phone.store"
  },
  -- Emergency
  ["Police"] = {
    _config = { gtype = "job", onleave = police.onleave, onjoin = police.onjoin, onspawn = police.onspawn },
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.askid",
    "police.check",
    "police.service",
    "police.vehicle",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    "police.fine",
    "police.jail",
    "police.drag",
	  "emergency.revive",
    "emergency.shop",
    "police.paycheck",
    "police.access"
  },
  ["EMS"] = {
 _config = { gtype = "job", onspawn = ems.onspawn, onjoin = ems.onjoin, onleave = ems.onleave },
    "emergency.revive",
    "emergency.shop",
    "emergency.service",
    "emergency.vehicle",
    "police.paycheck",
    "ems.cloakroom"
  },
  ["Taxi"] = {
    _config = { gtype = "job", onspawn = taxi.onspawn, onjoin = taxi.onjoin, onleave = taxi.onleave },
    "taxi.service",
    "job.vehicle",
    "taxi.paycheck"
  },
  ["News"] = {
    _config = { gtype = "job", onspawn = news.onspawn, onjoin = news.onjoin, onleave = news.onleave },
    "news.service",
    "job.vehicle",
    "taxi.paycheck"
  },
  ["Citizen"] = {
    _config = { gtype = "job", onspawn = citizen.onspawn, onjoin = citizen.onjoin, onleave = citizen.onleave },
    "citizen.paycheck"
  },
  ["OffDuty"] = {
    _config = { gtype = "job", onspawn = offduty.onspawn, onjoin = offduty.onjoin, onleave = offduty.onleave },
    "police.access",
    "police.askid",
    "phones.store",
    "player.list",
    "citizen.paycheck",
    "player.list"
  },
  ["Delivery Person"] = {
    _config = { gtype = "job" }
    "citizen.paycheck",
    "delivery.shop",
    "delivery.vehicle"
  },
  ["Tow"] = {
    _config = { gtype = "job", onspawn = tow.onspawn, onjoin = tow.onjoin, onleave = tow.onleave }
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "tow.shop"
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
-- Dimmies
  [1] = { "admin", "OffDuty" } 
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor permission (optional)

cfg.selectors = {
  ["Jobs"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
    "Taxi",
    "Citizen",
    "Tow",
    "News",
    "Delivery Person"
  },
  ["Police"] = {
    _config = {x = 440.360168457031,y = -993.374755859375, z = 30.6895999908447 , blipid = 351, blipcolor= 38, permission = "police.access" },
    "Police",
    "OffDuty"
  },
  ["EMS"] = {
    _config = {x=-498.959716796875,y=-335.715148925781,z=34.5017547607422, blipid = 351, blipcolor= 1 },
    "EMS",
    "Citizen"
  },
  ["Life Invader"] = {
    _config = { x=-1082.90014648438,y=-248.791107177734,z=37.7632904052734, blipid = 77, blipcolor= 1 },
    "Activate Brokia Phone",
    "Cancel Contract"
  }
}
return cfg

-- 60 103 125