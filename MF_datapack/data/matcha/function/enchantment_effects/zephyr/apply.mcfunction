# This function is run every tick by players with Zephyr III

# If the player is sneaking, charge the ability
execute if predicate matcha:flags/is_sneaking run return run function matcha:enchantment_effects/zephyr/charge

# If not, then:

# Check if the player has the ability fully charged. If not: stop and reset their charge
execute unless score @s ZephyrCharge matches 45.. run return run scoreboard players reset @s ZephyrCharge

# Check if the player is mid-air. If not: stop and reset their charge
execute if predicate matcha:flags/is_on_ground run return run scoreboard players reset @s ZephyrCharge


particle minecraft:gust ~ ~0.1 ~ 0.1 0 0.1 0 1
playsound minecraft:entity.wind_charge.wind_burst player @s ~ ~ ~ 0.5
particle minecraft:poof ~ ~ ~ .1 .1 .1 .5 50

effect give @s minecraft:levitation 1 12


scoreboard players reset @s ZephyrCharge
