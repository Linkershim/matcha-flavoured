# This function is run every tick for all players with a shakudo_regen score of 1+

# Check if Cooldown should be reset WITHOUT giving regen (e.g. when initially equipped), stop function here if so.
execute unless score @s ShakudoRegenCooldown matches 0.. run return run function matcha:enchantment_effects/shakudo_effects/regeneration/set_cooldown

# Stop before applying regen if the ability is on cooldown
execute unless score @s ShakudoRegenCooldown matches 0 run return fail

# Apply Regen Effect
execute if score @s shakudo_regen matches 1..4 run return run effect give @s minecraft:regeneration 3 0 true
execute if score @s shakudo_regen matches 5.. run return run effect give @s minecraft:regeneration 3 1 true

# Put the ability on Cooldown
function matcha:enchantment_effects/shakudo_effects/regeneration/set_cooldown
