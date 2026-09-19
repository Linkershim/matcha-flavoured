data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:glow_berry_crumble",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.glow_berry_crumble"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"consume_seconds": 1.6,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:regeneration",\
								"amplifier": 2,\
								"duration": 96,\
								"show_particles": false,\
								"show_icon": false\
							}\
						]\
					}\
				]\
			},\
			"minecraft:max_stack_size": 64,\
			"minecraft:lore": [\
				{\
					"text": "❤❤❤❤",\
					"color": "red",\
					"italic": false\
				},\
				{\
					"translate": "effect.kleispack.aura",\
					"with": [\
						"1:00"\
					],\
					"color": "#0fffa3",\
					"italic": false\
				}\
			]\
		}}}


tag @s add foodChecked