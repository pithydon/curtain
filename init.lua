local register_curtain = function (color, name)

minetest.register_node("curtain:"..color.."_curtain_closed", {
	description = name.." Curtain",
	tiles = {"wool_"..color..".png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_defaults(),
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "curtain:"..color.."_curtain_open", param2 = node.param2})
	end,	
})

minetest.register_node("curtain:"..color.."_curtain_open", {
	description = name.." Curtain open",
	tiles = {"wool_"..color..".png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_defaults(),
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,not_in_creative_inventory=1},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "curtain:"..color.."_curtain_closed", param2 = node.param2})
	end,
	drop = "curtain:"..color.."_curtain_closed",
})

minetest.register_node("curtain:large_"..color.."_curtain_closed", {
	description = "Large "..name.." Curtain",
	tiles = {"wool_"..color..".png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -1.5, 0.4375, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -1.5, 0.3125, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_defaults(),
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "curtain:large_"..color.."_curtain_open", param2 = node.param2})
	end,	
})

minetest.register_node("curtain:large_"..color.."_curtain_open", {
	description = "Large "..name.." Curtain open",
	tiles = {"wool_"..color..".png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -1.5, 0.3125, 0.5, 0.5, 0.5},
	},
	sounds = default.node_sound_defaults(),
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,not_in_creative_inventory=1},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "curtain:large_"..color.."_curtain_closed", param2 = node.param2})
	end,
	drop = "curtain:large_"..color.."_curtain_closed",
})

if minetest.registered_nodes["default:wool_"..color] then

minetest.register_craft({
	output = "curtain:"..color.."_curtain_closed",
	recipe = {
		{"group:stick"},
		{"default:carpet_"..color},
	}
})

elseif (minetest.get_modpath("carpet_api")) then

minetest.register_craft({
	output = "curtain:"..color.."_curtain_closed",
	recipe = {
		{"group:stick"},
		{"carpet:wool_"..color},
	}
})

minetest.register_craft({
	output = "curtain:"..color.."_curtain_closed",
	recipe = {
		{"tools:stick"},
		{"carpet:"..color.."_wool"},
	}
})

else

minetest.register_craft({
	output = "curtain:"..color.."_curtain_closed 12",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"wool:"..color, "wool:"..color, "wool:"..color},
		{"wool:"..color, "wool:"..color, "wool:"..color},
	}
})

end

minetest.register_craft({
	output = "curtain:large_"..color.."_curtain_closed",
	recipe = {
		{"curtain:"..color.."_curtain_closed"},
		{"curtain:"..color.."_curtain_closed"},
	}
})

minetest.register_craft({
	output = "curtain:"..color.."_curtain_closed 2",
	recipe = {
		{"curtain:large_"..color.."_curtain_closed"},
	}
})

end

register_curtain("white", "White")
register_curtain("grey", "Grey")
register_curtain("black", "Black")
register_curtain("red", "Red")
register_curtain("yellow", "Yellow")
register_curtain("green", "Green")
register_curtain("cyan", "Cyan")
register_curtain("blue", "Blue")
register_curtain("magenta", "Magenta")
register_curtain("orange", "Orange")
register_curtain("violet", "Violet")
register_curtain("brown", "Brown")
register_curtain("pink", "Pink")
register_curtain("dark_grey", "Dark Grey")
register_curtain("dark_green", "Dark Green")
