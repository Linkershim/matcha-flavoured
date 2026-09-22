# Created using Python 3.14.7
import json, os

# Recipe paths for the generation
RECIPE_BASE_PATH = os.path.join("MF_datapack", "data", "matcha", "recipe")
RECIPE_PATHS = [
    os.path.join(RECIPE_BASE_PATH, "smithing"),
    os.path.join(RECIPE_BASE_PATH, "crafting"),
    os.path.join(RECIPE_BASE_PATH, "food", "campfire"),
    os.path.join(RECIPE_BASE_PATH, "food", "crafting"),
    os.path.join(RECIPE_BASE_PATH, "food", "kiln"),
    os.path.join(RECIPE_BASE_PATH, "food", "oven"),
    os.path.join("MF_datapack", "data", "matcha", "villager_trade")
    ]
# Update check_trigger.mcfunction
CHECK_TRIGGER_LOCATION = os.path.join("MF_datapack", "data", "matcha", "function", "update_old_items", "check_trigger.mcfunction")
print(f"check_trigger.mcfunction located at: {CHECK_TRIGGER_LOCATION}\n")
CHECK_TRIGGER_MCFUNCTION = [
    'execute as @a[scores={update_item=1..}] at @s run function matcha:update_old_items/update_held_item\n'
    'scoreboard players reset @a[scores={update_item=1..}] update_item\n',
    'scoreboard players enable @a update_item\n'
    ]

output = open(CHECK_TRIGGER_LOCATION, "w", encoding="utf-8")
output.writelines(CHECK_TRIGGER_MCFUNCTION)
output.flush()
output.close()

# Update the actual update_held_item.mcfunction
UPDATE_HELD_LOCATION = os.path.join("MF_datapack", "data", "matcha", "function", "update_old_items", "update_held_item.mcfunction")
print(f"update_held_item.mcfunction located at: {UPDATE_HELD_LOCATION}\n")
output = open(UPDATE_HELD_LOCATION, "w", encoding="utf-8")

# Save selected item identifiers to storage for more performance
output.write('data remove storage matcha:update_item translate\n')
output.write('data modify storage matcha:update_item translate set from entity @s SelectedItem.components.minecraft:item_name.translate\n')
# early return if item has no translate
output.write('execute unless data storage matcha:update_item translate run tellraw @s {"text":"The held item cannot be updated because it is missing a translation key.","color":"red"}\n')
output.write('execute unless data storage matcha:update_item translate run return fail\n')
output.write('data remove storage matcha:update_item item\n')
# Go trough recipe directories and copy data from the json files
skipped_file_count = 0
files_without_components = []
files_without_item_name = {}
item_ids_no_name_to_path = {}
item_ids_with_name = set()
known_names = set()
final_jsons = []
# recursively search files
def list_files_walk(path):
    found_files = []
    for entry in os.listdir(path):
        full_path = os.path.join(path, entry)
        if os.path.isdir(full_path):
            found_files = found_files + list_files_walk(full_path)
        else:
            found_files.append(full_path)
    return found_files
# filter jsons that don't have components or no item name
for folder in RECIPE_PATHS:
    files = list_files_walk(folder)
    for file in files:
        if not file.endswith(".json"): continue
        open_file = open(file, "r", encoding="utf-8")
        json_data = json.load(open_file)
        result_data = json_data["result"] if "result" in json_data else json_data["gives"]
        if not "components" in result_data:
            skipped_file_count += 1
            files_without_components.append(file)
            open_file.close()
            continue
        components = result_data["components"]
        if not "minecraft:item_name" in components:
            skipped_file_count += 1
            files_without_item_name[result_data["id"]] = file
            item_ids_no_name_to_path[result_data["id"]] = file
            open_file.close()
            continue
        if not "translate" in components["minecraft:item_name"]:
            print(f"{file} does have a name but does not contain a translation key and thus will be ignored.")
            open_file.close()
            continue
        # filter duplicates that can be crafted in multiple ways
        if components["minecraft:item_name"]["translate"] not in known_names:
            known_names.add(components["minecraft:item_name"]["translate"])
        else:
            open_file.close()
            continue
        final_jsons.append(file)
        item_ids_with_name.add(result_data["id"])
        open_file.close()

# create data commands using the final jsons and save enchantments for the next step
enchantments = {}
STORED_ENCH = "minecraft:stored_enchantments"
ENCH = "minecraft:enchantments"
NAME_CHECKED_START = 'execute if data storage matcha:update_item {translate:"'
NAME_CHECKED_END = '"}'
DATA_MERGE = ' run data modify storage matcha:update_item item set value '
for file in final_jsons:
    open_file = open(file, "r", encoding="utf-8")
    json_data = json.load(open_file)
    result_data = json_data["result"] if "result" in json_data else json_data["gives"]
    components = result_data["components"]
    item_id = result_data["id"]

    item_name = components["minecraft:item_name"]["translate"]
    hand_check = NAME_CHECKED_START + item_name + NAME_CHECKED_END
    # switch stored_enchantments to enchantments
    if STORED_ENCH in components:
        components[ENCH] = components[STORED_ENCH]
        components.pop(STORED_ENCH)
    # save enchantment data for later
    if ENCH in components:
        for enchantment in components[ENCH].keys():
            if enchantment not in enchantments: enchantments[enchantment] = {}
            enchantments[enchantment][hand_check] = components[ENCH][enchantment]

    output.write(hand_check + DATA_MERGE + str(result_data) + '\n')
    open_file.close()

# return if item couldn't be identified (item in storage doesn't exist)
output.write('execute unless data storage matcha:update_item item run tellraw @s {"text":"The held item cannot be updated.","color":"red"}\n')
output.write('execute unless data storage matcha:update_item item run return fail\n')

# merge components based on item (enchantments, durability, current name)
MERGE_DATA = [
    '\n# Merge Item Data \n',
    'data modify storage matcha:update_item item.count set from entity @s SelectedItem.count\n'
    'data modify storage matcha:update_item item.components.minecraft:custom_name set from entity @s SelectedItem.components.minecraft:custom_name\n',
    'execute store result score #damage update_item run data get entity @s SelectedItem.components.minecraft:damage\n',
    'scoreboard players operation #damage update_item *= #1000 update_item\n',
    'execute store result score #durability update_item run data get entity @s SelectedItem.components.minecraft:max_damage\n',
    'scoreboard players operation #damage update_item /= #durability update_item\n',
    'execute store result score #durability update_item run data get storage matcha:update_item item.components.minecraft:max_damage\n',
    'scoreboard players operation #damage update_item *= #durability update_item\n',
    'scoreboard players operation #damage update_item /= #1000 update_item\n',
    'execute store result storage matcha:update_item item.components.minecraft:damage int 1 run scoreboard players get #damage update_item\n',
    'data modify storage matcha:update_item item.components.minecraft:enchantments merge from entity @s SelectedItem.components.minecraft:enchantments\n',
    'data modify storage matcha:update_item item.components.minecraft:trim merge from entity @s SelectedItem.components.minecraft:trim\n',
    'data modify storage matcha:update_item item.components.minecraft:lodestone_tracker merge from entity @s SelectedItem.components.minecraft:lodestone_tracker\n',
    ]
output.writelines(MERGE_DATA)

# raise enchantments to intrinsic levels and lower fortune if not electrum
for enchantment in enchantments.keys():
    output.write(f'# {enchantment}\n')
    output.write(f'execute store result score #enchantmentLvl update_item run data get storage matcha:update_item item.components.minecraft:enchantments.{enchantment} 1\n')

    if enchantment == "minecraft:fortune":
        output.write('execute if score #enchantmentLvl update_item matches 1.. run scoreboard players set #enchantmentLvl update_item 1\n')
    #raise levels
    for check in enchantments[enchantment]:
        level = enchantments[enchantment][check]
        if level <= 1: continue
        output.write(f'{check} if score #enchantmentLvl update_item matches ..{level} run scoreboard players set #enchantmentLvl update_item {level}\n')
    #store level
    output.write(f'execute if score #enchantmentLvl update_item matches 1.. store result storage matcha:update_item item.components.minecraft:enchantments.{enchantment} int 1 run scoreboard players get #enchantmentLvl update_item\n')

# cleanup stone base item or hand item depending on whether the held item could be identified
CLEANUP = [
    '#remove mainhand item, summon new item and set data, display success message\n',
    'item replace entity @s weapon.mainhand with air\n',
    'summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone",count:1},Tags:["update_item"],PickupDelay:0s}\n',
    'data modify entity @n[type=item,tag=update_item] Item set from storage matcha:update_item item\n',
    'tellraw @s {"text":"The held item has been successfully updated.","color":"green"}\n',
    ]
output.writelines(CLEANUP)

output.flush()
output.close()

LIST_NO_COMP = "list comp"
LIST_NO_NAME = "list name"
QUIT = "quit"
print('\n')
print(f"Successfully generated the new mcfunction files! {skipped_file_count} files skipped")
print("Don't be alarmed! Most recipe files are just basic items that do not need to be considered.")
print('\n')

while True:
    user_input = input(f"Type '{LIST_NO_COMP}' to view files that were skipped because they have no components.\nType '{LIST_NO_NAME}' to view files that were skipped because they have no item name translation key.\nType '{QUIT}' to exit (or just close the program).\n")
    if user_input == LIST_NO_COMP:
        for file in files_without_components:
            print(file)
        print(f"\n listed {len(files_without_components)} files")
    elif user_input == LIST_NO_NAME:
        for file in files_without_item_name.keys():
            print(files_without_item_name[file])
        print(f"\n listed {len(files_without_item_name)} files")
    elif user_input == QUIT:
        break


