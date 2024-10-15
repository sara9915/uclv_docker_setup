################### STEP 1 ##########################
- Create yaskawa image
	cd ~/Desktop/docker_bringup/yaskawa_setup
	docker build -t ros_bridge:yaskawa -f ./Dockerfile.ros2 .
	
- Create wsg image
	cd ~/Desktop/docker_bringup/wsg_setup
	docker build -t ros_bridge:wsg -f ./Dockerfile.ros2 .
	
- Create tactile image
	cd ~/Desktop/docker_bringup/tactile_setup
	docker build -t ros_bridge:tactile -f ./Dockerfile.ros2 .




################### STEP 2 ##########################
- Configure docker subnet
	docker network create --subnet=172.18.0.0/16 docker_subnet
	
	
	
	
	

################### STEP 3 ##########################
- Create yaskawa container
	docker run --net docker_subnet --ip 172.18.0.2 -it --name yaskawa --env="NVIDIA_DRIVER_CAPABILITIES=all" --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" ros_bridge:yaskawa
	exit
	
- Create wsg container
	docker run --net docker_subnet --ip 172.18.0.3 -it --name wsg ros_bridge:wsg
	exit

- Create tactile container
	docker run --net docker_subnet --ip 172.18.0.4 -it --device=/dev/ttyUSB* -v /home/sfederico/workspaces/pushing_ws/ros/src/tactile_sensor_ros/sun_tactile_driver/Finger_files/:/home/tactile_ws/src/sun_tactile_sensor/sun_tactile_driver/Finger_files --env="NVIDIA_DRIVER_CAPABILITIES=all" --env="DISPLAY=$DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --name tactile ros_bridge:tactile
	

################### STEP 4 ##########################
- Launch all the container from ubuntu terminale (NOT FROM TERMINATOR!!!!!!)
	cd ~/Desktop/docker_bringup/terminator_setup
	./setup.sh





	
	



