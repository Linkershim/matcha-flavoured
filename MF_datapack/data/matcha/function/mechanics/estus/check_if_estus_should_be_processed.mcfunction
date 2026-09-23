advancement revoke @s only matcha:mechanics/estus_obtained
execute as @s[gamemode=!creative] at @s run function matcha:mechanics/estus/process_estus

# In creative, items are refilled by the game. This means estus can never be cleared, and can cause serious issues, corrupting worlds.
# This is a band-aid fix for that issue. If you have a better idea, lmk
