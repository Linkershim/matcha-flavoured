data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:melon_sorbet",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.melon_sorbet"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"consume_seconds": 1.2,\
				"sound": "minecraft:item.honey_bottle.drink",\
				"has_consume_particles": false,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:fire_resistance",\
								"amplifier": 0,\
								"duration": 12000,\
								"show_particles": false,\
								"show_icon": true\
							},\
							{\
								"id": "minecraft:regeneration",\
								"amplifier": 2,\
								"duration": 48,\
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
					"text": "❤❤",\
					"color": "red",\
					"italic": false\
				},\
				{\
					"translate": "effect.kleispack.fire_resistance",\
					"with": [\
						"10:00"\
					],\
					"color": "gold",\
					"italic": false\
				}\
			],\
			"minecraft:use_remainder": {\
				"id": "minecraft:glass_bottle"\
			}}}}


tag @s add foodChecked