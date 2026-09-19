data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:gimmari",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.gimmari"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"consume_seconds": 1.2,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:water_breathing",\
								"amplifier": 0,\
								"duration": 9600,\
								"show_particles": false,\
								"show_icon": true\
							},\
							{\
								"id": "minecraft:regeneration",\
								"amplifier": 2,\
								"duration": 72,\
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
					"text": "❤❤❤",\
					"color": "red",\
					"italic": false\
				},\
				{\
					"translate": "effect.kleispack.water_breathing",\
					"with": [\
						"8:00"\
					],\
					"color": "#7ec9e7",\
					"italic": false\
				}\
			]\
		}}}


tag @s add foodChecked