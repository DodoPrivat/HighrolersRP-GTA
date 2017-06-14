-- client-side vRP configuration

cfg = {}

cfg.iplload = true

-- Voice Proximity
cfg.voice_proximity = 30.0 -- Outside
cfg.voice_proximity_vehicle = 5.0 -- In Vehicle
cfg.voice_proximity_inside = 9.0 -- In Building


cfg.gui = {
  anchor_minimap_width = 260, --260
  anchor_minimap_left = 550, --60
  anchor_minimap_bottom = 50 --213
}

-- disable menu if handcuffed
cfg.handcuff_disable_menu = true

-- when health is under the threshold, player is in coma
-- set to 0 to disable coma
cfg.coma_threshold = 120

-- maximum duration of the coma in minutes
cfg.coma_duration = 5 --10

-- if true, a player in coma will not be able to open the main menu
cfg.coma_disable_menu = true

-- see https://wiki.fivem.net/wiki/Screen_Effects
cfg.coma_effect = "DeathFailOut" -- DeathFailMPIn
