# enable access to xhost from the container
xhost +

# Run docker and open bash shell
docker run -it --rm --privileged \
	--env=LOCAL_USER_ID="$(id -u)" \
        -v ./PX4-Autopilot:/src/PX4-Autopilot/:rw \
	-v /dev:/dev \
        -v $HOME/.Xauthority:/root/.Xauthority:rw \
	-e DISPLAY=$DISPLAY \
	--network host \
	--name=px4-ros-dev px4io/px4-dev-ros-noetic bash -c 'cd /src/PX4-Autopilot/ && source Tools/simulation/gazebo-classic/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default && roslaunch gazebo_ros empty_world.launch world_name:=/src/PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_gazebo-classic/worlds/hitl_iris.world'

