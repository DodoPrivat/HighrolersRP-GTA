
local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
  {
    name="Peaches",
    r=255,g=125,b=24,
    max_units=5000,
    units_per_minute=5000,
    x=-2268.099609375,y=-31.0390892028809,z=112.193695068359,
    radius=15, height=4,
    action="Gathering...",
    description="Gather Peaches",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["fruit_peche"] = 3
    }
  },
  {
    name="Fruit Shop",
    r=255,g=125,b=24,
    max_units=5000,
    units_per_minute=5000,
    x=-1555.32836914063,y=1376.30554199219,z=126.894462585449,
    radius=5, height=2.5,
    action="Sell",
    description="Sell Peaches : 5 for $25",
    in_money=0,
    out_money=25,
    reagents = {
      ["fruit_peche"] = 5
    },
    products={}
  },
  {
    name="Gold Mine",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=123.05940246582,y=3336.2939453125,z=30.7280216217041,
    radius=30, height=8,
    action="Mine for Gold",
    description="Mine for Gold",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["gold_ore"] = 1
    }
  },
  {
    name="Gold Treatment",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=-75.9527359008789,y=6495.42919921875,z=31.4908847808838,
    radius=24, height=2,
    action="Treat Gold",
    description="Treat Gold for Refining",
    in_money=0,
    out_money=0,
    reagents={
      ["gold_ore"] = 1
    },
    products={
      ["gold_processed"] = 1
    }
  },
  {
    name="Gold Refinery",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=1032.71105957031,y=2516.86010742188,z=46.6488876342773,
    radius=24,height=4,
    action="Refine Gold",
    description="Refine gold to sell!",
    in_money=0,
    out_money=0,
    reagents={
      ["gold_processed"] = 1,
    },
    products={
      ["gold_ingot"] = 1
    }
  },
    {
    name="Weed Processor",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=2054.6396484375,y=3180.01806640625,z=45.1689605712891,
    radius=15,height=4,
    action="Process to Weed",
    description="Process Marijuana into Weed.",
    in_money=0,
    out_money=0,
    reagents={
      ["marijuana"] = 1,
    },
    products={
      ["weed"] = 1
    }
  },
    {
    name="Dealer",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=-1540.93090820313,y=125.988372802734,z=56.7800025939941,
    radius=10,height=4,
    action="Sell",
    description="Sell Weed",
    in_money=0,
    out_money=400,
    reagents={
      -- ["weed"] = 2,
    },
    products={
    ["dirty_money"] = 400
  }
},
  {
    name="Jeweler",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=-139.963653564453,y=-823.515258789063,z=31.4466247558594, 
    radius=8,height=1.5,
    action="Sell Gold",
    description="Sell gold : $1000/ingot.",
    in_money=0,
    out_money=1000,
    reagents={
      ["gold_ingot"] = 1
    },
    products={}
  }
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["Marijuana field"] = {
    def = {
      name="Marijuana field", -- menu name
      r=0,g=200,b=0, -- color
      max_units=5000,
      units_per_minute=5000,
      x=0,y=0,z=0, -- pos
      radius=30, height=1.5, -- area
      action="Harvest", -- action name
      description="Harvest some harvest.", -- action description
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={ -- items given per unit
        ["marijuana"] = 1
      }
    },
    positions = {
      {2213.16967773438,5577.6630859375,53.8029823303223}
    }
  }
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
  },
  positions = {
    {-1203.77490234375,461.014465332031,91.8671264648438},
    {-1072.02038574219,-1073.34985351563,2.15036082267761},
    {234.083740234375,643.559936523438,186.398941040039},
    {-375.793731689453,6219.86865234375,31.4890422821045}
  },
  interval = 30, -- interval in minutes for the reseller respawn
  duration = 15, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg



-- Crafting Place : 1375.81359863281,-740.304138183594,67.2328872680664