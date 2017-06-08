
local cfg = {}

cfg.inventory_weight = 30 -- maximum weight for an user inventory (no unit, but thinking in "kg" is a good norm)

-- default chest weight for vehicle trunks
cfg.default_vehicle_chest_weight = 50

-- define vehicle chest weight by model in lower case
cfg.vehicle_chest_weights = {
  ["burrito3"] = 100,
  ["benson"] = 120,
  ["pounder"] = 150,
  ["trailersmall"] = 100,
  ["trailers"] = 350,
  ["tanker"] = 500
}

return cfg
