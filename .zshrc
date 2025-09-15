# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -z "$ZPROFILE_SOURCED" ]]; then
    source ~/.zprofile
    export ZPROFILE_SOURCED=1
fi

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(pattern cursor)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# Created by newuser for 5.9

# export http_proxy='http://localhost:7890'
# export https_proxy='http://localhost:7890'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR='nvim'

export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN.UTF-8"

# 系统检测和平台信息
case "$(uname -s)" in
    Darwin*)
        OS="macos"
        ;;
    Linux*)
        if [ -f /etc/arch-release ]; then
            OS="arch"
        elif [ -f /etc/debian_version ]; then
            OS="ubuntu"
        else
            OS="linux"
        fi
        ;;
    *)
        OS="unknown"
        ;;
esac

# 显示系统信息 (可选，用于调试)
# echo "检测到系统: $OS ($(uname -s))"

# 插件加载 - 跨平台兼容 (Ubuntu/Arch/macOS)
# 注意：Zim 框架已经提供了这些插件，这里作为备用加载
if [[ "$OS" == "macos" ]]; then
    # macOS (Homebrew)
    [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ "$OS" == "arch" ]]; then
    # Arch Linux
    [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ "$OS" == "ubuntu" ]]; then
    # Ubuntu/Debian
    [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# autojump 配置 - 跨平台兼容
if [[ "$OS" == "macos" ]]; then
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
elif [[ "$OS" == "arch" ]]; then
    [ -f /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh
elif [[ "$OS" == "ubuntu" ]]; then
    [ -f /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh
fi

# JetBrains Toolbox 路径
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# nvim 和 Go 环境配置
export PATH="$PATH:$HOME/.config/nvim/bin"
# Go 环境配置 - 检查是否安装了 Go
if command -v go &> /dev/null; then
    export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
fi

alias vim='nvim'

# ls 命令别名
alias ls='lsd --color=auto'
alias ll='lsd -l --color=auto'
alias la='lsd -lad .* --color=auto'
alias lh='lsd -alths --color=auto'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias mkdir='mkdir -pv'
alias diff='colordiff'
alias now='date "+%Y-%m-%d %H:%M:%S.%s"'
alias timestamp='now; echo s: $(date +"%s"); echo ms: $(echo `expr \`date +%s%N\` / 1000000`)'
alias vi='vim'
alias svi='sudo vi'
# alias mv='mv -i'
# alias cp='cp -i'
# alias ln='ln -i'

# 系统命令别名 - 跨平台兼容
# 安全别名 (仅 Linux)
if [[ "$OS" != "macos" ]]; then
    # alias rm='rm --preserve-root'
    # alias chown='chown --preserve-root'
    # alias chmod='chmod --preserve-root'
    # alias chgrp='chgrp --preserve-root'
fi

# 进程和系统信息
if [[ "$OS" == "macos" ]]; then
    alias psg='ps aux | grep '
    alias psme='ps aux | grep $USER'
    alias meminfo='vm_stat'
    alias ports='netstat -an | grep LISTEN'
    alias reboot='sudo reboot'
    alias poweroff='sudo shutdown -h now'
    alias halt='sudo halt'
    alias shutdown='sudo shutdown -h now'
else
    alias psg='ps -ef | grep '
    alias psme='ps -ef | grep $USER --color=auto'
    alias meminfo='free -h -l -t'
    alias ports='netstat -tulanp'
    alias reboot='sudo /sbin/reboot'
    alias poweroff='sudo /sbin/poweroff'
    alias halt='sudo /sbin/halt'
    alias shutdown='sudo /sbin/shutdown'
    # systemd 服务管理 (仅 Linux)
    alias clashrestart='sudo systemctl restart clash.service'
fi

alias mount='mount | column -t'
alias wget='wget -c'
alias cp='rsync -arvP'

if command -v fdfind &> /dev/null; then
    alias fd='fdfind'
fi

# 包管理器别名 - 按系统区分
if [[ "$OS" == "arch" ]]; then
    alias pacman='sudo pacman'
    alias yay='paru'
elif [[ "$OS" == "ubuntu" ]]; then
    alias apt='sudo apt'
    alias apt-get='sudo apt-get'
    alias snap='sudo snap'
elif [[ "$OS" == "macos" ]]; then
    alias brew='brew'
    alias mas='mas'
fi

alias pack='cd ~/apollo/application-pnc/ && tar -zcvf ~/apollo/$(date +%Y_%m_%d_%H_%M_%S).tar.gz --exclude=\*.pt --exclude=\*.md --exclude=\*.png --exclude=\*.jpg modules/planning profiles/default' 
alias commiting='git add --all && git commit -m "Commit at $(date)" && pack'
alias github='github-desktop'

autoload bashcompinit
bashcompinit

# 跨平台工具函数
alias genpass="openssl rand -base64 30 | tr -d "\n" | cut -c1-15"

# 跨平台文件管理器
if [[ "$OS" == "macos" ]]; then
    alias open='open'
    alias o='open'
elif [[ "$OS" == "arch" || "$OS" == "ubuntu" ]]; then
    alias open='xdg-open'
    alias o='xdg-open'
fi

# 跨平台剪贴板
if [[ "$OS" == "macos" ]]; then
    alias pbcopy='pbcopy'
    alias pbpaste='pbpaste'
    alias copy='pbcopy'
    alias paste='pbpaste'
elif [[ "$OS" == "arch" || "$OS" == "ubuntu" ]]; then
    if command -v xclip &> /dev/null; then
        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'
        alias copy='xclip -selection clipboard'
        alias paste='xclip -selection clipboard -o'
    elif command -v xsel &> /dev/null; then
        alias pbcopy='xsel --clipboard --input'
        alias pbpaste='xsel --clipboard --output'
        alias copy='xsel --clipboard --input'
        alias paste='xsel --clipboard --output'
    fi
fi

export PATH="$PATH:$HOME/.local/bin"

# ccache 配置 - 跨平台兼容
if [[ "$OS" != "macos" ]]; then
    # Linux 系统的 ccache 配置
    #export PATH="/usr/lib/ccache/bin/:$PATH"
    #export PATH="/usr/lib/colorgcc/bin/:$PATH"
    export CCACHE_PATH="/usr/bin"
    alias clear="TERM=xterm /usr/bin/clear"
else
    # macOS 的 ccache 配置
    if command -v ccache &> /dev/null; then
        export CCACHE_PATH="/opt/homebrew/bin"
    fi
    alias clear="clear"
fi

# 开发工具环境配置 - 跨平台兼容
# Apollo 环境配置 (如果存在)
[ -s /opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash ] && \. "/opt/apollo/neo/packages/env-manager-dev/latest/scripts/auto_complete.bash"

# Apache Spark 配置 (如果存在)
[ -d /opt/apache-spark/bin ] && export PATH=$PATH:/opt/apache-spark/bin

# Console Ninja 配置 (如果存在)
[ -d ~/.console-ninja/.bin ] && PATH=~/.console-ninja/.bin:$PATH

export NVM_DIR="$HOME/.nvm"
unset npm_config_prefix
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm 配置 - 跨平台兼容
if [[ "$OS" == "macos" ]]; then
    export PNPM_HOME="/Users/sakurapuare/Library/pnpm"
else
    export PNPM_HOME="$HOME/.local/share/pnpm"
fi
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# timeout 命令别名 - 跨平台兼容
if [[ "$OS" == "macos" ]]; then
    # macOS 使用 gtimeout (需要安装 coreutils)
    if command -v gtimeout &> /dev/null; then
        alias timeout='gtimeout'
    fi
    export PATH="/opt/homebrew/bin:$PATH"
else
    # Linux 系统原生支持 timeout
    # timeout 命令已内置，无需别名
fi

# Docker CLI completions - 跨平台兼容
if [[ "$OS" == "macos" ]]; then
    # macOS Docker Desktop
    fpath=(/Users/sakurapuare/.docker/completions $fpath)
else
    # Linux Docker
    fpath=($HOME/.docker/completions $fpath)
fi
# compinit is already called by Zim framework, no need to call it again
# End of Docker CLI completions
