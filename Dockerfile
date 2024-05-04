FROM osrf/ros:humble-desktop-full AS base

#TODO: Use base as default stage
RUN apt-get update \
    && apt-get install -y \
    vim \
    nano \
    curl \
    python3-argcomplete \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep init || echo "rosdep already initialized"
ENV LD_LIBRARY_PATH=/opt/ros/humble/opt/rviz_ogre_vendor/lib:/opt/ros/humble/lib/x86_64-linux-gnu:/opt/ros/humble/lib

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

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

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

CMD ["bash"]

FROM base as dev

RUN apt-get update \
    && apt-get install -y \
    zsh \
    && rm -rf /var/lib/apt/lists/*


COPY .zshrc /home/${USERNAME}/.zshrc
COPY .config /home/${USERNAME}/.config


RUN curl -sS https://starship.rs/install.sh -o /home/${USERNAME}/starship_install.sh \
    && chmod +x /home/${USERNAME}/starship_install.sh
RUN /home/${USERNAME}/starship_install.sh -y

USER ros
CMD ["zsh"]
