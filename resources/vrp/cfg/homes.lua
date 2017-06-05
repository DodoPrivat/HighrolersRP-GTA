
local cfg = {}

-- default flats positions from https://github.com/Nadochima/HomeGTAV/blob/master/List

-- define the home slots (each entry coordinate should be unique for ALL types)
cfg.slot_types = {
  ["basic_flat"] = {
    -- slots entry point coordinates
    {-782.171,324.589,223.258},
    {-774.171,333.589,207.621},
    {-774.171,333.589,159.998},
    {-596.689,59.139,108.030},
    {-1451.557,-523.546,69.556},
    {-1452.185,-522.640,56.929},
    {-907.900,-370.608,109.440},
    {-921.124,-381.099,85.480},
    {-464.453,-708.617,77.086},
    {-470.647,-689.459,53.402}
  },
  ["rich_flat"] = {
    {-784.363,323.792,211.996},
    {-603.997,58.954,98.200},
    {-1453.013,-539.629,74.044},
    {-912.547,-364.706,114.274},
  }
}

-- define home clusters
cfg.homes = {
  ["Vinewood Flat"] = {
    slot = "basic_flat",
    entry_point = {-635.665,44.155,42.697},
    buy_price = 100000,
    sell_price = 80000,
    max = 250,
    blipid=40,
    blipcolor=4
  },
  ["Small Vinewood Flat"] = {
    slot = "basic_flat",
    entry_point = {-599.255981445313,147.80744934082,61.672721862793},
    buy_price = 100000,
    sell_price = 80000,
    max = 250,
    blipid=40,
    blipcolor=4
  },
  ["Little Seoul"] = {
    slot = "basic_flat",
    entry_point = {-767.436462402344,-751.6806640625,27.8752155303955},
    buy_price = 100000,
    sell_price = 80000,
    max = 250,
    blipid=40,
    blipcolor=4
  },
  ["Alesandro Appt."] = {
    slot = "basic_flat",
    entry_point = {-599.255981445313,147.80744934082,61.672721862793},
    buy_price = 100000,
    sell_price = 80000,
    max = 50,
    blipid=40,
    blipcolor=4
  },
  ["El Burton"] = {
    slot = "rich_flat",
    entry_point = {-417.206024169922,-187.134948730469,37.4518280029297},
    buy_price = 500000,
    sell_price = 350000,
    max = 30,
    blipid=40,
    blipcolor=5
  }
}

return cfg
