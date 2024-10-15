gnome-terminal --tab --title="core" -- bash -c 'cd ~/Desktop/docker_bringup/bridge_setup; ./core_bringup.sh; $SHELL'

gnome-terminal --tab --title="bridge" -- bash -c 'cd ~/Desktop/docker_bringup/bridge_setup; ./bridge_bringup.sh; $SHELL'

gnome-terminal --tab --title="yaskawa" -- bash -c 'cd ~/Desktop/docker_bringup/yaskawa_setup; ./yaskawa_bringup.sh; $SHELL'

