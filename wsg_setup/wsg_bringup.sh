docker start wsg
docker exec -it wsg /bin/bash -c "source /opt/ros/noetic/setup.bash;
			          $SHELL"
