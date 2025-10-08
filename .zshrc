source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/zsh-vi-mode/zsh-vi-mode.zsh
ZVM_VI_HIGHLIGHT_FOREGROUND=#cdd6f4           # Hex value
ZVM_VI_HIGHLIGHT_BACKGROUND=#fc78c4           # Hex value
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold    # bold
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLOCK

export FPATH="$HOME/.config/zsh/eza/completions/zsh:$FPATH"
#starship
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }

#source ros
. /opt/ros/humble/setup.zsh
. /usr/share/gazebo/setup.sh
. /usr/share/gazebo-11/setup.sh
# argcomplete for ros2 & colcon
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/usr/share/gazebo-11/models
#. /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

#aliases
alias l="ls -a"
alias ll="ls -al"
alias ros2topics='watch -n 0.1 ros2 topic list'
