# enable access to xhost from the container
xhost +

# Run docker and open bash shell
docker run -it --rm --privileged \
        --env=LOCAL_USER_ID="$(id -u)" \
        -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
        -v /dev:/dev \
        -e DISPLAY=:0 \
        -e ROS_IP=127.0.0.1 \
        -e ROS_MASTER_URI=http://127.0.0.1:11311 \
        --network host \
        --name=rviz osrf/ros:noetic-desktop-full /bin/bash -c "rosrun rviz rviz"
