data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:lore": [\
				{\
					"text": "❤❤",\
					"color": "red",\
					"italic": false\
				},\
				{\
					"translate": "effect.kleispack.haste",\
					"with": [\
						"5:00"\
					],\
					"color": "yellow",\
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
								"duration": 48,\
								"show_particles": false,\
								"show_icon": false\
							},\
							{\
								"id": "minecraft:haste",\
								"amplifier": 0,\
								"duration": 6000,\
								"show_particles": false,\
								"show_icon": true\
							}\
						],\
						"probability": 1\
					}\
				]\
			},\
			"minecraft:item_model": "matcha:chocolate_chip_cookie",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.chocolate_chip_cookie"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			}\
		}}}


tag @s add foodChecked