
FROM ros:noetic-ros-base

RUN apt-get update && apt-get install -y \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

ENV ROS_WORKSPACE=/home/mohamed/chats
WORKDIR $ROS_WORKSPACE

COPY . $ROS_WORKSPACE

RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /chats/devel/setup.bash" >> ~/.bashrc

CMD ["/bin/bash", "-c", "source /chats/devel/setup.bash && roslaunch chat_system chat.launch"]
