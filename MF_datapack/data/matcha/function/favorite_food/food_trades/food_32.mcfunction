data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:stroganoff",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.stroganoff"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"consume_seconds": 1.8,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:apply_effects",\
						"effects": [\
							{\
								"id": "minecraft:regeneration",\
								"amplifier": 2,\
								"duration": 192,\
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
					"text": "❤❤❤❤❤❤❤❤",\
					"color": "red",\
					"italic": false\
				}\
			],\
			"minecraft:use_remainder": {\
				"id": "bowl"\
			}\
		}}}


tag @s add foodChecked