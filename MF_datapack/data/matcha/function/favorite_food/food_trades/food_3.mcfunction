data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:lore": [\
				{\
					"text": "❤❤❤",\
					"color": "red",\
					"italic": false\
				},\
				{\
					"translate": "effect.kleispack.haste_2",\
					"with": [\
						"2:30"\
					],\
					"color": "yellow",\
					"italic": false\
				}\
			],\
			"minecraft:consumable": {\
				"consume_seconds": 1.6,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:regeneration",\
								"amplifier": 2,\
								"duration": 72,\
								"show_particles": false,\
								"show_icon": false\
							},\
							{\
								"id": "minecraft:haste",\
								"amplifier": 1,\
								"duration": 3000,\
								"show_particles": false,\
								"show_icon": true\
							}\
						],\
						"probability": 1\
					}\
				]\
			},\
			"minecraft:item_model": "matcha:brownie",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.brownie"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			}}}}


tag @s add foodChecked