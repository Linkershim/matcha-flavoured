#If the player is in survival, and not wearing Maximum freezing Prot, run freezing effects

# Eliminating some @p and using a predicate
execute as @a[gamemode=!creative,gamemode=!spectator] at @s if block ~ ~1 ~ water run execute unless predicate matcha:armour_enchants/freezing_protection run execute if biome ~ ~ ~ #minecraft:is_frozen run function matcha:environmental/freezing_water

#Cannot use this because open freezing water doesn't work, since water decreases the sky light level from max but I left this in for...posterity?
#execute as @a[gamemode=!creative] if predicate matcha:in_open_frozen_water unless predicate matcha:armour_enchants/freezing_protection run function matcha:environmental/freezing_water