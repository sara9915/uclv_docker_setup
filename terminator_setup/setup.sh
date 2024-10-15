#!/bin/bash

core="cd ~/pick_and_place_ws/docker_bringup/bridge_setup; ./core_bringup.sh; bash"
bridge="cd ~/pick_and_place_ws/docker_bringup/bridge_setup; ./bridge_bringup.sh; $SHELL"
yaskawa="cd ~/pick_and_place_ws/docker_bringup/yaskawa_setup; ./yaskawa_bringup.sh; $SHELL"
wsg="cd ~/pick_and_place_ws/docker_bringup/wsg_setup; ./wsg_bringup.sh; $SHELL"
tactile="cd ~/pick_and_place_ws/docker_bringup/tactile_setup; ./tactile_bringup.sh; $SHELL"

## Modify terminator's config
sed -i.bak "s#COMMAND1#$core#; s#COMMAND2#$bridge#; s#COMMAND3#$yaskawa#; s#COMMAND4#$wsg#; s#COMMAND5#$tactile#;" ~/.config/terminator/config

## Launch a terminator instance using the new layout
terminator -l docker_setup

## Return the original config file
mv ~/.config/terminator/config.bak ~/.config/terminator/config
