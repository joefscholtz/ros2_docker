#starship
eval "$(starship init bash)"

#source ros
. /opt/ros/humble/setup.bash
#eval "$(register-python-argcomplete3 colcon)"
. /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash

#aliases
alias l="ls -a"
alias ll="ls -al"
