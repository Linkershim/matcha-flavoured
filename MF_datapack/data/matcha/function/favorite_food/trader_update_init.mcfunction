#Process unchecked villagers
execute as @e[type=minecraft:villager, tag=!foodChecked, nbt=!{VillagerData:{profession:"minecraft:none"}}] unless data entity @s {Xp:0} run function matcha:favorite_food/trader_update

#Schedule this function to run again
schedule function matcha:favorite_food/trader_update_init 30s
