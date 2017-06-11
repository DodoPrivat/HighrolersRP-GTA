
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
    action="Gather",
    description="Gather Peaches",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["peach"] = 3
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
      ["peach"] = 5
    },
    products={}
  },
  {
    name="Gold Rich River",
    r=255,g=255,b=0,
    max_units=5000,
    units_per_minute=5000,
    x=123.05940246582,y=3336.2939453125,z=30.7280216217041,
    radius=30, height=8,
    action="Pan for Gold",
    description="Pan for Gold",
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
   -- Meth 
  {
    name="Household Supplies",
    r=255,g=125,b=24,
    max_units=5000,
    units_per_minute=5000,
    x=-803.462158203125,y=169.876571655273,z=76.7403106689453, 
    radius=15, height=4,
    action="Search for Supplies",
    description="Steal Household Supplies",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["Nail Polish Remover"] = 1,
      ["Drain Cleaner"] = 1,
      ["Window Cleaner"] = 1
    }
},

    {
    name="Cold Medicine",
    r=255,g=125,b=24,
    max_units=5000,
    units_per_minute=5000,
    x=95.1359405517578,y=-1604.95568847656,z=29.5917186737061, 
    radius=15, height=4,
    action="Search for Supplies",
    description="Steal Cold Medicine",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["Cold Medicine"] = 1
    }
},

  {
    name="Lab Supplies",
    r=255,g=125,b=24,
    max_units=5000,
    units_per_minute=5000,
    x=3559.68139648438,y=3674.55712890625,z=28.1218738555908, 
    radius=3, height=4,
    action="Search for Supplies",
    description="Steal Lab Supplies",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["Hydrochloric Acid"] = 1,
      ["lye"] = 1
    }
},

    {
    name="Brake Fluid",
    r=255,g=125,b=24,
    max_units=5000,
    units_per_minute=5000,
    x=-1150.20874023438,y=-2016.98706054688,z=13.1802616119385, -- -1150.20874023438,-2016.98706054688,13.1802616119385
    radius=5, height=4,
    action="Searching...",
    description="Steal Brake Fluid",
    in_money=0,
    out_money=0,
    reagents={},
    products={
      ["Brake Fluid"] = 1
    }
},
   {
    name="Meth Lab",
    r=255,g=255,b=0,
    max_units=80,
    units_per_minute=3,
    x=1391.26953125,y=3607.48168945313,z=38.9419097900391,
    radius=3,height=4,
    action="Cook Meth",
    description="Cook Meth.",
    in_money=0,
    out_money=0,
    reagents={
    ["Nail Polish Remover"] = 10,
    ["Window Cleaner"] = 3,
    ["Cold Medicine"] = 15,
    ["Hydrochloric Acid "] = 8,
    ["Box of Matches"] = 8,
    ["Brake Fluid"] = 9,
    ["lye"] = 8,
    ["Drain Cleaner"] = 14
    },
    products={
      ["Meth"] = 15
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
    out_money=0,
    reagents={
      ["weed"] = 2,
    },
    products={
    ["dirty_money"] = 400
  }
},

  {
   name=" Meth Dealer",
   r=255,g=255,b=0,
   max_units=5000,
   units_per_minute=5000,
   x=16.8569660186768,y=3718.5234375,z=39.6396255493164,
   radius=10,height=4,
   action="Sell",
   description="Sell Meth",
   in_money=0,
   out_money=0,
   reagents={
     ["meth"] = 2,
   },
   products={
   ["dirty_money"] = 800
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
      description="Harvest Marijuana.", -- action description
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