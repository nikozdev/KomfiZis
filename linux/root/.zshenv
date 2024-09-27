# .zshenv - zshell environment setup;

# files

## xdg

export XDG_DESKTOP_DIR="${HOME}/Desktop"
export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
export XDG_TEMPLATES_DIR="${HOME}/Templates"
export XDG_PUBLICSHARE_DIR="${HOME}/Public"
export XDG_DOCUMENTS_DIR="${HOME}/Documents"
export XDG_MUSIC_DIR="${HOME}/Music"
export XDG_PICTURES_DIR="${HOME}/Pictures"
export XDG_VIDEOS_DIR="${HOME}/Videos"

export XDG_LOCAL_HOME="${HOME}/.local"
export XDG_SHARE_HOME="${XDG_LOCAL_HOME}/share"
export XDG_DATA_HOME="${XDG_SHARE_HOME}"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

## zsh

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/zcompdump"

## std

export LESSHISTFILE="${XDG_CACHE_HOME}/lesshst"

export WGET_HSTS_FILE="${XDG_CACHE_HOME}/wget-hsts"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"

export GNUPGHOME="${XDG_DATA_HOME}/gnupg"

export OPCUA_PKI_PATH='${XDG_DATA_HOME}/pki'

export EDITRC=$XDG_CONFIG_HOME/editrc
export INPUTRC=$XDG_CONFIG_HOME/inputrc

## dev

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/gitconfig"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

export GOPATH="${XDG_DATA_HOME}/go"

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npmrc"

alias docker="/usr/bin/docker --config ${XDG_CONFIG_HOME}/docker"

export PYTHONHISTFILE=$XDG_CACHE_HOME/python_history

export MYSQL_HISTFILE=$XDG_CACHE_HOME/mysql_history

## ext

export ZK_NOTEBOOK_DIR="${XDG_DATA_HOME}/zk"

export TASKRC="${XDG_CONFIG_HOME}/taskrc"

## exe

export PATH="/bin:/usr/bin:/usr/local/bin"
export PATH="${PATH}:/usr/games:/usr/local/games"

export PATH="${PATH}:${HOME}/.local/bin"

export PATH="${PATH}:${CARGO_HOME}/bin"
for script in $(/bin/ls ${HOME}/.local/bin/); do
    alias $script=". ${script}"
done

export PATH="${PATH}:${GOPATH}/bin"

export PATH="${PATH}:${XDG_DATA_HOME}/npm/bin"

export PATH="${PATH}:${XDG_DATA_HOME}/nvim/mason/bin"

# tools

#if [[ -n "$DISPLAY" ]] || [[ "$XDG_CURRENT_DESKTOP" ]]; then
#    export VISUAL="nvim-neovide.sh"
#else
#    export VISUAL="nvim.sh"
#fi
export VISUAL="nvim"
export VIDIFF="${VISUAL} -R -f -d -c 'cd ${GIT_PREFIX}' -c 'wincmd w' -c 'wincmd J' -c 'set wrap' ${LOCAL} ${REMOTE}"
export VIMERG="${VISUAL} -f -d -c 'wincmd w' -c 'wincmd J' ${LOCAL} ${REMOTE} ${MERGED} -c 'set wrap'"
alias vieditor=$VISUAL
alias viconfig=$VISUAL ${XDG_CONFIG_HOME}/nvim/init.lua

export EDITOR=$VISUAL
export SUDO_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export PAGER="/usr/bin/less -N -P \"%f[%p]=%l > \""
export MANPAGER='nvim +Man!'

export MERGETOOL=$VIMERG

export BROWSER="firefox"

# utils

export FZF_CONFIG="${XDG_CONFIG_HOME}/.fzf.zsh"
[ -f "${FZF_CONFIG}" ] && source "${FZF_CONFIG}"
#export FZF_DEFAULT_COMMAND='rg --hidden --ignore-case .git --ignore-case .cache'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND}"
alias fzf="/usr/bin/fzf -x -i --no-mouse    \
    --preview=\"exa -s type --icons {}\"    \
    --bind=\"ctrl-space:toggle-preview\"    \
    --preview-window=,30:hidden             \
    "

alias cp="/bin/cp -riv"
alias rm="/bin/rm -riv"
alias ls="/bin/ls -ghXbq1 --almost-all --file-type --color=auto --indicator-style=slash --time-style=+y%ym%md%d"

alias man="/usr/bin/man -P \"${MANPAGER}\""

alias less="${PAGER}"

alias lsblk="/usr/bin/lsblk --ascii --output NAME,LABEL,PARTLABEL,FSTYPE,FSVER,MOUNTPOINTS"

alias mpv="/usr/bin/mpv --keep-open=yes"

# emulation

export WINEARCH=win64
export WINEPREFIX="${HOME}/.steam/steam/steamapps/compatdata/570940/pfx"

# navigation

set -o vi

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# visual

export PS1="\$ "

# network

export vIpAddrLoc=$(ifconfig \
    | grep "inet " \
    | grep -Fv 127.0.0.1 \
    | awk '{print $2}'
)
