------------------------------------------
-- Startup Settings handling happens here.
------------------------------------------
if settings.startup["electric-locomotive-speed-setting"].value == "238 km/h (Vanilla)" then
  data.raw["locomotive"]["space-locomotive"].max_speed = 1.1
  data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.1
  data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.1
elseif settings.startup["electric-locomotive-speed-setting"].value == "378 km/h" then
  data.raw["locomotive"]["space-locomotive"].max_speed = 1.75
  data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.75
  data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.75
end

if settings.startup["electric-cargo-wagon-capacity-setting"].value == "40 Slots (Vanilla)" then
  data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 40
elseif settings.startup["electric-cargo-wagon-capacity-setting"].value == "120 Slots (Extended)" then
  data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 120
end

if settings.startup["electric-fluid-wagon-capacity-setting"].value == "25.000 (Vanilla)" then
  data.raw["fluid-wagon"]["space-fluid-wagon"].capacity = 25000
end

if settings.startup["train-battery-pack-energy-density-setting"].value == "100 MJ" then
  data.raw["assembling-machine"]["space-train-battery-charging-station"].energy_usage = "3.3MW"
  data.raw["assembling-machine"]["experimental-space-train-battery-charging-station"].energy_usage = "33MW"
  data.raw["item"]["space-train-battery-pack"].fuel_value = "100MJ"
end

if settings.startup["train-battery-decay-enable-setting"].value then
  data:extend({{
    type = "item",
    name = "space-train-destroyed-battery-pack",
    icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "space-train-discharged-battery-pack",
    subgroup = "intermediate-product",
    order = "s-a[destroyed-battery-pack]",
    stack_size = 60
  }, -- Destroyed speed, acceleration and efficiency battery-packs
  {
    type = "item",
    name = "destroyed-speed-battery-pack",
    icon = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "discharged-speed-battery-pack",
    subgroup = "intermediate-product",
    stack_size = 60
  },{
    type = "item",
    name = "destroyed-acceleration-battery-pack",
    icon = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "discharged-acceleration-battery-pack",
    subgroup = "intermediate-product",
    stack_size = 60
  }, {
    type = "item",
    name = "destroyed-efficiency-battery-pack",
    icon = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "discharged-efficiency-battery-pack",
    subgroup = "intermediate-product",
    stack_size = 60
  }, -- Refurb for speed, acceleration and efficiency battery-packs
  {
    type = "recipe",
    name = "speed-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"destroyed-speed-battery-pack", 1}, {"battery", 5}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.speed-battery-pack-refurbish-desc"},
    result = "speed-battery-pack",
    order = "s-[battery-refurbish-d]"
  },{
    type = "recipe",
    name = "acceleration-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"destroyed-acceleration-battery-pack", 1}, {"battery", 5}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.acceleration-battery-pack-refurbish-desc"},
    result = "acceleration-battery-pack",
    order = "s-[battery-refurbish-b]"
  },{
    type = "recipe",
    name = "efficiency-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"destroyed-efficiency-battery-pack", 1}, {"battery", 5}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.efficiency-battery-pack-refurbish-desc"},
    result = "efficiency-battery-pack",
    order = "s-[battery-refurbish-c]"
  },
    
  
  {
    type = "recipe",
    name = "space-train-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"space-train-destroyed-battery-pack", 1}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.space-train-battery-pack-refurbish-desc"},
    result = "space-train-discharged-battery-pack",
    order = "s-[battery-refurbish-a]"
  }, -- Speed, acceleration and efficiency battery-pack ref

})
else
  data.raw["recipe"]["space-train-battery-pack-recharge"].results = {{
    name = "space-train-battery-pack",
    amount = 1
  }}
  data.raw["recipe"]["faster-space-train-battery-pack-recharge"].results = {{
    name = "space-train-battery-pack",
    amount = 1
  }}
  -- Same for faster speed, acceleration and efficiency battery-packs
  data.raw["recipe"]["speed-battery-pack-recharge"].results = {{
    name = "speed-battery-pack",
    amount = 1
  }}
  data.raw["recipe"]["acceleration-battery-pack-recharge"].results = {{
    name = "acceleration-battery-pack",
    amount = 1
  }}
  data.raw["recipe"]["efficiency-battery-pack-recharge"].results = {{
    name = "efficiency-battery-pack",
    amount = 1
  }}
end
------------------------------------------
-- Changes to recipes and technologies.
------------------------------------------

  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"rocket-control-unit", 10})
  table.insert(data.raw["recipe"]["recipe-space-locomotive"].ingredients, {"electric-engine-unit", 50})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients, {"rocket-control-unit", 10})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients, {"electric-engine-unit", 50})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-cargo-wagon"].ingredients, {"electric-engine-unit", 5})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-space-fluid-wagon"].ingredients, {"electric-engine-unit", 5})

data:extend({ 
{
  type = "technology",
  name = "tech-space-trains",
  mod = "space-trains",
  icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
  icon_size = 256,
  icon_mipmaps = 4,
  effects = {{
    type = "unlock-recipe",
    recipe = "recipe-space-locomotive"
  }, {
    type = "unlock-recipe",
    recipe = "recipe-space-fluid-wagon"
  }, {
    type = "unlock-recipe",
    recipe = "recipe-space-cargo-wagon"
  }, {
    type = "unlock-recipe",
    recipe = "space-train-battery-charging-station"
  }, {
    type = "unlock-recipe",
    recipe = "space-train-battery-pack"
  }, {
    type = "unlock-recipe",
    recipe = "space-train-battery-pack-recharge"
  }},
  prerequisites = {"steel-processing", "advanced-electronics-2", "battery", "railway", "production-science-pack", "utility-science-pack", "electric-engine", "rocket-control-unit"},
  unit = {
    count = 2000,
    ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
                    {"production-science-pack", 1}, {"utility-science-pack", 1}},
    time = 60
  }
}})

-- Add new research for experimental chargers that unlock the experimental charging station.
data:extend({
  {
    type = "technology",
    name = "tech-space-trains-experimental-charging",
    mod = "space-trains",
    icon = "__electric-trains__/graphics/icons/experimental-space-train-charging-station.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "experimental-space-train-battery-charging-station"
    }, {
      type = "unlock-recipe",
      recipe = "faster-space-train-battery-pack-recharge"
    }},
    prerequisites = {"tech-space-trains", "space-science-pack"},
    unit = {
      count = 20000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  -- Add infinite techs for increasing the braking force of the trains. (Would love to have a TechnologyModifier for top speed too, but that's not possible yet.)
  data:extend({  
    {
    type = "technology",
    name = "tech-space-trains-braking-force-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = 
    {
      {
        icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
        icon_size = 256, icon_mipmaps = 4
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = {100, 100}
      }
    },
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.05
      } 
    },
    prerequisites = {"space-science-pack", "tech-space-trains", "tech-space-trains-experimental-charging"}, 
    unit =
    {
      count_formula = "2^L*1000", 
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    order = "e-k-d"
  }})

  -- Electric Wagon Locomotive
  data:extend({{
    type = "technology",
    name = "tech-electric-locomotive-wagon",
    icon = "__electric-trains__/graphics/icons/electric-locomotive-wagon.png",
    icon_size = 64, 
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "recipe-electric-locomotive-wagon"
      } 
    },
    prerequisites = {"space-science-pack", "tech-space-trains"}, 
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}   
      },
      time = 60
    },
  }})

  -- Speed battery packs
  data:extend({{
    type = "technology",
    name = "tech-speed-battery-pack",
    icon = "__electric-trains__/graphics/icons/speed-battery/speed-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "speed-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "speed-battery-pack-recharge"
    }},
    prerequisites = {"tech-space-trains", "tech-space-trains-experimental-charging"},
    unit = {
      count = 2000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  -- Acceleration battery packs
  data:extend({{
    type = "technology",
    name = "tech-acceleration-battery-pack",
    icon = "__electric-trains__/graphics/icons/acceleration-battery/acceleration-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "acceleration-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "acceleration-battery-pack-recharge"
    }},
    prerequisites = {"tech-space-trains", "tech-space-trains-experimental-charging"},
    unit = {
      count = 2000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  -- Efficiency battery packs
  data:extend({{
    type = "technology",
    name = "tech-efficiency-battery-pack",
    icon = "__electric-trains__/graphics/icons/efficiency-battery/efficiency-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "efficiency-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "efficiency-battery-pack-recharge"
    }},
    prerequisites = {"tech-space-trains", "tech-space-trains-experimental-charging"},
    unit = {
      count = 2000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  if settings.startup["train-battery-decay-enable-setting"].value then
    table.insert(data.raw["technology"]["tech-space-trains"].effects, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-speed-battery-pack"].effects, {
      type = "unlock-recipe",
      recipe = "speed-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-acceleration-battery-pack"].effects, {
      type = "unlock-recipe",
      recipe = "acceleration-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-efficiency-battery-pack"].effects, {
      type = "unlock-recipe",
      recipe = "efficiency-battery-pack-refurbish"
    })
  end