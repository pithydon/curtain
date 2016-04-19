function register_curtain(color, name)

minetest.register_node("curtain:"..color.."_curtain_closed", {
	description = name.." Curtain",
	tiles = {"wool_"..color..".png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5},
		},
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
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_defaults(),
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "curtain:"..color.."_curtain_closed", param2 = node.param2})
	end,
	drop = "curtain:"..color.."_curtain_closed",
})

minetest.register_craft({
	output = "curtain:"..color.."_curtain_closed 6",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"wool:"..color, "wool:"..color, "wool:"..color},
		{"wool:"..color, "wool:"..color, "wool:"..color},
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
