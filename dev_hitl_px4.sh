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
	--name=px4-dev px4io/px4-dev-simulation-focal bash -c 'cd /src/PX4-Autopilot/ && source Tools/simulation/gazebo-classic/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default && gazebo Tools/simulation/gazebo-classic/sitl_gazebo-classic/worlds/hitl_iris.world'

