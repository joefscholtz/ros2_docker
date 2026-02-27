FROM osrf/ros:jazzy-desktop-full AS ros2_docker

ENV DEBIAN_FRONTEND=noninteractive

#TODO: Use base as default stage
RUN apt-get update \
    && apt-get install -y \
    wget \
    vim \
    nano \
    htop \
    curl \
    zsh \
    gdb \
    python3-argcomplete \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep init || echo "rosdep already initialized"
ENV LD_LIBRARY_PATH=/opt/ros/jazzy/opt/rviz_ogre_vendor/lib:/opt/ros/jazzy/lib/x86_64-linux-gnu:/opt/ros/jazzy/lib

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV USER=$USERNAME

# Create a non-root user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # Add sudo support for the non-root user
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && rm -rf /var/lib/apt/lists/*

RUN usermod -aG dialout ${USERNAME}

COPY .bashrc /home/${USERNAME}/.bashrc
RUN chmod +w /home/${USERNAME}/.bashrc

SHELL ["/bin/bash", "-c"]

RUN source /home/${USERNAME}/.bashrc

# Extend ROS

RUN rm -rf /etc/ros/rosdep/sources.list.d/* \
    && rosdep init

SHELL ["/bin/sh", "-c"]

# Gazebo

ENV DEBIAN_FRONTEND=noninteractive
# Install gazebo
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null \
  && apt-get update && apt-get install -q -y --no-install-recommends \
    ros-jazzy-ros-gz \
    ros-jazzy-gazebo-ros \
    ros-jazzy-gazebo-ros-pkgs \
  && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=

# ROS2 utils
RUN apt-get update \
    && apt-get install -y \
    ros-jazzy-plotjuggler-ros \
    && rm -rf /var/lib/apt/lists/*

#Dev config
RUN curl -sS https://starship.rs/install.sh -o /home/${USERNAME}/starship_install.sh \
    && chmod +x /home/${USERNAME}/starship_install.sh
RUN /home/${USERNAME}/starship_install.sh -y

USER ros

COPY ./dotfiles/.zshrc /home/${USERNAME}/.zshrc
COPY ./dotfiles/.config /home/${USERNAME}/.config
COPY .containerenv /run/

RUN sudo chown ros /home/${USERNAME}/.zshrc

# Entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/zsh", "/entrypoint.sh"]

CMD ["zsh"]
