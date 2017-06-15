
local cfg = {}

-- PC position
cfg.pc = {441.595916748047,-978.925598144531,30.6896076202393}

-- illegal items (seize)
cfg.seizable_items = {
  "dirty_money",
  "weed",
  "marijuana",
  "meth"
}

-- jails {x,y,z,radius}
cfg.jails = {
  {459.485870361328,-1001.61560058594,24.914867401123,2.1},
  {459.305603027344,-997.873718261719,24.914867401123,2.1},
  {459.999938964844,-994.331298828125,24.9148578643799,1.6}
}

-- fines
-- map of name -> money
cfg.fines = {
  ["Speeding Class 1"] = 100,
  ["Speeding Class 2"] = 250,
  ["Traffic Violation"] = 250,
  ["Minor Posession"] = 350,
  ["Parking Violation"] = 150,
  ["Vehicle Violation"] = 150
}

return cfg
