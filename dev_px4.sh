# enable access to xhost from the container
xhost +

# Run docker and open bash shell
docker run -it --rm --privileged \
	--env=LOCAL_USER_ID="$(id -u)" \
        -v ./PX4-Autopilot:/src/PX4-Autopilot/:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v /dev:/dev \
	-e DISPLAY=:0 \
	--network host \
	--name=px4-dev px4io/px4-dev-simulation-focal bash

