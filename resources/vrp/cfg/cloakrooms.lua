-- Config Cloakrooms

local cfg = {}

-- cloakroom types (_config, map of name => customization)
cfg.cloakroom_types = {
  ["police"] = {
    _config = { permission = "police.cloakroom" },
    ["Uniform"] = {
      [4] = {25,2},
      [6] = {24,0},
      [8] = {58,0},
      [11] = {55,0}
    }
  },
  ["ems"] = {
    _config = { permission = "ems.cloakroom" },
    ["Uniform"] = {
   ["modelhash"] = -1286380898,
    }
  }
}


-- Locations of Cloakrooms
cfg.cloakrooms = {
  {"police", 457.196746826172,-990.949279785156,30.6896018981934},
  {"ems", -499.195648193359,-342.909942626953,34.5018424987793}
}

return cfg
