data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:carrot_cupcake",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.carrot_cupcake"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:night_vision",\
								"duration": 12000,\
								"show_particles": false,\
								"show_icon": true\
							},\
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
					"translate": "effect.kleispack.night_vision",\
					"with": [\
						"10:00"\
					],\
					"color": "green",\
					"italic": false\
				}\
			]\
		}}}


tag @s add foodChecked