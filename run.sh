#!/bin/bash
if [[ $USER != "fs" ]]; then
    export COPPELIASIM_ROOT=${HOME}/CoppeliaSim
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$COPPELIASIM_ROOT
    export QT_QPA_PLATFORM_PLUGIN_PATH=$COPPELIASIM_ROOT
fi

mkdir -p logs/

tasks=(
# "close_box"
# "empty_dishwasher"
# "open_drawer"
# "slide_block_to_target"
# "stack_cups"
# "put_shoes_in_box"
# "take_shoes_out_of_box"
# "basketball_in_hoop"
# "set_the_table"
# "put_books_on_bookshelf"
# "put_bottle_in_fridge"
# "place_cups"
# "empty_container"
# "put_plate_in_colored_dish_rack"
# "put_item_in_drawer"
# "take_item_out_of_drawer"
# "screw_nail"
# "stack_chairs"
# "hockey"
# "put_knife_on_chopping_board"
# "put_toilet_roll_on_stand"
# "hang_frame_on_hanger"
# "stack_wine"
# "put_knife_in_knife_block"
# "take_frame_off_hanger"
# "get_ice_from_fridge"
# "meat_off_grill"
# "meat_on_grill"
# "phone_on_base"
# "put_all_groceries_in_cupboard"
# "put_groceries_in_cupboard"
# "put_money_in_safe"
# "put_rubbish_in_bin"
# "setup_checkers"
# "setup_chess"
# "solve_puzzle"

## New tasks on 0711
"move_hanger"
"place_hanger_on_rack"
"pour_from_cup_to_cup"
"put_tray_in_oven"
"put_umbrella_in_umbrella_stand"
"remove_cups"
"stack_blocks"
"take_tray_out_of_oven"
"toilet_seat_up"
"turn_tap"
"tv_on"
"water_plants"
"weighing_scales"
)

for task in ${tasks[@]}; do
    ## Record object states
    # python tools/collect_demo.py --episode_num=500 --headless --task=$task --record_object_states
    # nohup python tools/replay_object_states.py --headless --task $task > logs/$task.out &

    ## Render
    python tools/replay_object_states.py --headless --task $task 2>&1 | tee logs/$task.out

    ## Test
    # python tools/collect_demo.py --episode_num=1 --headless --task=$task --record_object_states | tee logs/$task.out
    # python tools/replay_object_states.py --headless --task $task 2>&1 --max_demo 1 --overwrite | tee -a logs/$task.out
done
