data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:bruschetta",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.bruschetta"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"has_consume_particles": true,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:strength",\
								"amplifier": 1,\
								"duration": 3000,\
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
					"text": "\uE030\uE030\uE030\uE030",\
					"color": "red",\
					"italic": false\
				},\
				{\
					"translate": "effect.kleispack.strength_2",\
					"with": [\
						"2:30"\
					],\
					"color": "#e65f33",\
					"italic": false\
				}\
			]\
		}}}


tag @s add foodChecked