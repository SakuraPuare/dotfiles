PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

# Added by Toolbox App
export PATH="$PATH:/home/sakurapuare/.local/share/JetBrains/Toolbox/scripts"


# FIDDLER_EVERYWHERE_SCRIPT_START
if [ -n "$FE_STARTED" ] && [ -s '/tmp/.mount_fiddlehxksNp/resources/app/out/assets/scripts/startup-linux.sh' ] && [ "$STARTUP_SOURCED" != "true" ] ; then
    source '/tmp/.mount_fiddlehxksNp/resources/app/out/assets/scripts/startup-linux.sh'
    STARTUP_SOURCED="true"
fi
# FIDDLER_EVERYWHERE_SCRIPT_END