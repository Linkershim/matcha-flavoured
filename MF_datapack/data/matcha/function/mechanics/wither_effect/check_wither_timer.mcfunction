#IF they no longer have wither, remove them from the scoreboard
execute if score @s wither_timer matches 0.. run execute unless predicate matcha:effects/has_wither run scoreboard players reset @s wither_timer

#If they have the wither effect (Bc the advnamcnet can trigger when the effect is cleared) add the wither timer score
#If players are on the wither timer scorboard add 1 to them
execute if score @s wither_timer matches 0.. run execute if predicate matcha:effects/has_wither run scoreboard players add @s wither_timer 1
execute if score @s wither_timer matches 0..7 run execute if predicate matcha:effects/has_wither run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5

execute if score @s wither_timer matches 1 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE048\uE046\uE046\uE047",color:"white"}]
execute if score @s wither_timer matches 2 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE048\uE046\uE046\uE049",color:"white"}]
execute if score @s wither_timer matches 3 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE048\uE046\uE04B\uE049",color:"white"}]
execute if score @s wither_timer matches 4 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE048\uE046\uE044\uE049",color:"white"}]
execute if score @s wither_timer matches 5 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE048\uE04B\uE044\uE049",color:"white"}]
execute if score @s wither_timer matches 6 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE048\uE044\uE044\uE049",color:"white"}]
execute if score @s wither_timer matches 7 run title @s actionbar [{text:"\uE010",color:"red"},{text:" \uE04A\uE044\uE044\uE049",color:"white"}]
execute if score @s wither_timer matches 8 run title @s actionbar {text:"\uE010 \uE04A\uE044\uE044\uE049",color:"red"}


# If they are at max withering decrement hearts, clear the wither effect and remove them from the scoreboard
execute if score @s wither_timer matches 8.. run effect clear @s wither
execute if score @s wither_timer matches 8.. run function matcha:mechanics/heart_container/hpdown
execute if score @s wither_timer matches 8.. run playsound minecraft:item.totem.use player @s ~ ~ ~ .25 0 0
execute if score @s wither_timer matches 8.. run damage @s 0.1
execute if score @s wither_timer matches 8.. run scoreboard players reset @s wither_timer

#Loop this function every second
execute if predicate matcha:effects/has_wither run schedule function matcha:mechanics/wither_effect/check_wither_timer 1s
