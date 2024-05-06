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
eval "$(starship init zsh)"

#source ros
. /opt/ros/humble/setup.zsh
# argcomplete for ros2 & colcon
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
#. /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

#aliases
alias l="ls -a"
alias ll="ls -al"
