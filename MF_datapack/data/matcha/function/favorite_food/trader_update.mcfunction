# Store random number
# Last two numbers are the range the generator checks
execute store result storage id:temp num int 1 run random value 0..41

# Calling Macro to choose random food
function matcha:favorite_food/trader_update_macro with storage id:temp
