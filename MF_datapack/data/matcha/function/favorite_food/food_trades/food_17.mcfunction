data modify entity @s Offers.Recipes append value {maxUses:1, sell:{count:1,id:"minecraft:emerald"}, \
        buy:{count:1, "id": "minecraft:poisonous_potato",\
		"components": {\
			"minecraft:item_model": "matcha:ice_cream",\
			"minecraft:item_name": {\
				"translate": "item.kleispack.ice_cream"\
			},\
			"minecraft:food": {\
				"nutrition": 0,\
				"saturation": 0,\
				"can_always_eat": true\
			},\
			"minecraft:consumable": {\
				"consume_seconds": 1.3,\
				"on_consume_effects": [\
					{\
						"type": "minecraft:remove_effects",\
						"effects": [\
							"minecraft:poison",\
							"minecraft:mining_fatigue",\
							"minecraft:wither",\
							"minecraft:weakness",\
							"minecraft:bad_omen",\
							"minecraft:blindness",\
							"minecraft:darkness",\
							"minecraft:infested",\
							"minecraft:weaving",\
							"minecraft:nausea",\
							"minecraft:oozing",\
							"minecraft:slowness"\
						]\
					},\
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
					"translate": "desc.kleispack.cleanses_maleffect",\
					"color": "gray",\
					"italic": false\
				}\
			],\
			"minecraft:use_remainder": {\
				"id": "minecraft:bowl"\
			}\
		}}}


tag @s add foodChecked