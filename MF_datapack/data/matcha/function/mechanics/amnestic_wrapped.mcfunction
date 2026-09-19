execute at @e[type=minecraft:armor_stand,tag=amnestic] run data merge entity @n[type=villager] {LastRestock:0,VillagerData:{level:1,profession:"minecraft:none"}}
execute at @e[type=minecraft:armor_stand,tag=amnestic] run tag @n[type=villager] remove foodChecked
advancement revoke @a only matcha:mechanics/amnestic
kill @e[type=minecraft:armor_stand,tag=amnestic]