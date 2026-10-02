# Set cooldown based on the number of Shakudo Armour pieces equipped

# Regen 1
execute if score @s shakudo_regen matches 1 run return run scoreboard players set @s ShakudoRegenCooldown 600
execute if score @s shakudo_regen matches 2 run return run scoreboard players set @s ShakudoRegenCooldown 520
execute if score @s shakudo_regen matches 3 run return run scoreboard players set @s ShakudoRegenCooldown 440
execute if score @s shakudo_regen matches 4 run return run scoreboard players set @s ShakudoRegenCooldown 360

# Regen 2
execute if score @s shakudo_regen matches 5 run return run scoreboard players set @s ShakudoRegenCooldown 400
execute if score @s shakudo_regen matches 6 run return run scoreboard players set @s ShakudoRegenCooldown 320
execute if score @s shakudo_regen matches 7 run return run scoreboard players set @s ShakudoRegenCooldown 240
execute if score @s shakudo_regen matches 8.. run return run scoreboard players set @s ShakudoRegenCooldown 160
