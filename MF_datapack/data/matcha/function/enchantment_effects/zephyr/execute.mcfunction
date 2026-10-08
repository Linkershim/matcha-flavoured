# If the player was sneaking without the Zephyr enchantment (which would have given them slow falling) reset their score and stop this function
execute unless predicate matcha:effects/has_slow_falling run return run scoreboard players reset @s sneaking

execute if score @s sneaking matches 1.. run particle minecraft:gust ~ ~0.1 ~ 0.1 0 0.1 0 1
execute if score @s sneaking matches 1.. run playsound minecraft:entity.wind_charge.wind_burst player @s ~ ~ ~ 0.5

execute if score @s sneaking matches 45.. run particle minecraft:poof ~ ~ ~ .1 .1 .1 .5 50
execute if score @s sneaking matches 45.. run effect give @s minecraft:levitation 1 12

scoreboard players reset @s sneaking
