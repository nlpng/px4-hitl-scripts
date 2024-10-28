# px4-hitl-scripts
Scripts for running the PX4 Hardware-in-the-Loop (HITL) gazebo simulation

# Usage
The processes of running HITL simulation are identical to the [PX4 doc](https://docs.px4.io/main/en/simulation/hitl.html), the scripts in this repo are based on the docker environment, therefore no dependency installations are required, no pollution to the local environment.

* Clone the PX4 repo into the same directory as the scripts, it is recommended to use the PX4 of version `1.14.0` or earlier. For now the scripts are assuming using the gazebo-classic simulation, may considering swtiching in the future.

```shell
git clone https://github.com/nlpng/px4-hitl-scripts.git 
cd path/to/px4-hitl-scripts
git clone --recursive -b v1.14.0 https://github.com/PX4/PX4-Autopilot.git
```

* Run the PX4 build environment from docker, at this stage, you could modify the PX4 HITL environment to fit your needs and build px4 with gazebo-classic

```shell
./dev_px4.sh
cd /src/PX4-Autopilot
DONT_RUN=1 make px4_sitl_default gazebo-classic
```

* Start HITL simulation

    - Run HITL locally
    ```shell
    ./dev_hitl_px4.sh
    ```

    - Run HITL with ROS node
    ```shell
    ./dev_hitl_ros_px4.sh
    ```
