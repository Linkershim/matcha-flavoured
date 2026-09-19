data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:4, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:lore": [\
				{\
					"text": "❤",\
					"color": "red",\
					"italic": false\
				}\
			],\
			"minecraft:consumable": {\
				"consume_seconds": 0.8,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:regeneration",\
								"amplifier": 2,\
								"duration": 24,\
								"show_particles": false,\
								"show_icon": false\
							}\
						],\
						"probability": 1\
					}\
				]\
			},\
			"minecraft:item_model": "matcha:tricero_chicken_nugget",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.tricero_chicken_nugget"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			}\
		}}}


tag @s add foodChecked