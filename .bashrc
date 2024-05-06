#starship
eval "$(starship init bash)"

#source ros
. /opt/ros/humble/setup.bash
. /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/usr/share/gazebo-11/models

#aliases
alias l="ls -a"
alias ll="ls -al"
