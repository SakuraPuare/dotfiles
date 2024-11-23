export EDITOR='vim'

if [ -e /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash ]; then . /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash; fi

PATH=~/.console-ninja/.bin:$PATH

export WORKON_HOME=~/.virtualenvs

source /home/sakurapuare/.local/share/vcpkg/scripts/vcpkg_completion.bash


##-----------------------------------------------------
## synth-shell-greeter.sh
if [ -f /home/sakurapuare/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sakurapuare/.config/synth-shell/synth-shell-greeter.sh
fi

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/sakurapuare/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sakurapuare/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/sakurapuare/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sakurapuare/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/sakurapuare/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sakurapuare/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/sakurapuare/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sakurapuare/.config/synth-shell/better-history.sh
fi

source /opt/ros/noetic/setup.bash
source /usr/share/gazebo/setup.sh
. /usr/share/bash-prompt/prompt.sh
export NVM_DIR=/home/sakurapuare/.nvm
[ -s /home/sakurapuare/.nvm/nvm.sh ] && \. /home/sakurapuare/.nvm/nvm.sh  # This loads nvm
[ -s /home/sakurapuare/.nvm/bash_completion ] && \. /home/sakurapuare/.nvm/bash_completion  # This loads nvm bash_completion
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sakurapuare/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sakurapuare/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/sakurapuare/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sakurapuare/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/sakurapuare/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/sakurapuare/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

[ -f /opt/miniforge/etc/profile.d/conda.sh ] && source /opt/miniforge/etc/profile.d/conda.sh
source /usr/share/nvm/init-nvm.sh
