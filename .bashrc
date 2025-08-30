export EDITOR='vim'

if [ -e /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash ]; then . /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash; fi



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


. /usr/share/bash-prompt/prompt.sh
export NVM_DIR=/home/sakurapuare/.nvm
[ -s /home/sakurapuare/.nvm/nvm.sh ] && \. /home/sakurapuare/.nvm/nvm.sh  # This loads nvm
[ -s /home/sakurapuare/.nvm/bash_completion ] && \. /home/sakurapuare/.nvm/bash_completion  # This loads nvm bash_completion



[ -f /opt/miniforge/etc/profile.d/conda.sh ] && source /opt/miniforge/etc/profile.d/conda.sh
source /usr/share/nvm/init-nvm.sh
if [ -e /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash ]; then . /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash; fi

PATH=~/.console-ninja/.bin:$PATH
# FIDDLER_EVERYWHERE_SCRIPT_START
if [ -n "$FE_STARTED" ] && [ -s '/tmp/.mount_fiddlehxksNp/resources/app/out/assets/scripts/startup-linux.sh' ] && [ "$STARTUP_SOURCED" != "true" ] ; then
    source '/tmp/.mount_fiddlehxksNp/resources/app/out/assets/scripts/startup-linux.sh'
    STARTUP_SOURCED="true"
fi
# FIDDLER_EVERYWHERE_SCRIPT_END

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"
