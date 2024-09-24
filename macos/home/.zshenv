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

export HOMEBREW_HOME="/opt/homebrew"

## zsh

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/zcompdump"

## std

export EDITRC=$XDG_CONFIG_HOME/editrc
export INPUTRC=$XDG_CONFIG_HOME/inputrc

export LESSHISTFILE="${XDG_CACHE_HOME}/lesshst"

export WGET_HSTS_FILE="${XDG_CACHE_HOME}/wget-hsts"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"

export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
alias gpg="gpg --homedir ${GNUPGHOME}"

export KEYCHAIN_HOME="${XDG_CONFIG_HOME}/keychain"
alias keychain="keychain --dir ${KEYCHAIN_HOME}"

export OPCUA_PKI_PATH='${XDG_DATA_HOME}/pki'

## dev

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/gitconfig"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

export GOPATH="${XDG_DATA_HOME}/go"

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npmrc"

alias docker="/usr/bin/docker --config ${XDG_CONFIG_HOME}/docker"

export PYTHONHISTORY="${XDG_CACHE_HOME}/python_history"
export CONDARC="${XDG_CONFIG_HOME}/condarc"
export MPLCONFIGDIR=$XDG_CONFIG_HOME/matplotlib

export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history
export PSQL_HISTORY=$XDG_CACHE_HOME/psql_history

export DOTNET_ROOT=$XDG_DATA_HOME/dotnet
export MONO_CONFIG=$XDG_CONFIG_HOME/mono

export MITMPROXY_CONFIG=$XDG_CONFIG_HOME/mitmproxy

## ext

export ZK_NOTEBOOK_DIR="${XDG_DATA_HOME}/zk"

export TASKRC="${XDG_CONFIG_HOME}/taskrc"
export TASKDATA="${XDG_DATA_HOME}/task"
export TASKCONF="${XDG_CONFIG_HOME}/task"
alias tasktui="taskwarrior-tui --report=prev"

alias livanota="jrnl livanota"

export ZELLIJ_CONFIG_FILE="${XDG_CONFIG_HOME}/zellij/config.yaml"

## exe

fAddExePath() {
    if [ -d $1 ]; then
        if [[ ":$PATH:" != *":$1:"* ]]; then
            export PATH="$PATH:$1"
        else
            echo "path has already been added ($1)"
        fi
    else
        echo "path is missing ($1)"
    fi
}
fAddExePath "${HOMEBREW_HOME}/bin"
fAddExePath "${HOMEBREW_HOME}/sbin"

fAddExePath "${XDG_LOCAL_HOME}/bin"

fAddExePath "${CARGO_HOME}/bin"
fAddExePath "${GOPATH}/bin"
fAddExePath "${XDG_DATA_HOME}/npm/bin"

fAddExePath "${XDG_DATA_HOME}/nvim/mason/bin"

# tools

export VISUAL="nvim"
export VIDIFF="${VISUAL} -R -f -d -c 'cd ${GIT_PREFIX}' -c 'wincmd w' -c 'wincmd J' -c 'set wrap' ${LOCAL} ${REMOTE}"
export VIMERG="${VISUAL} -f -d -c 'wincmd w' -c 'wincmd J' ${LOCAL} ${REMOTE} ${MERGED} -c 'set wrap'"
alias nvim-config="nvim ${XDG_CONFIG_HOME}/nvim/init.lua"

export EDITOR="${VISUAL}"
export SUDO_EDITOR="${EDITOR}"

export PAGER="/usr/bin/less -N -P \"%f[%p]=%l > \""
export MANPAGER="/usr/bin/less -N"

export MERGETOOL="${VIMERG}"

export BROWSER="safari"

# utils

export GIT_EDITOR="${EDITOR}"

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

alias mpv="${HOMEBREW_HOME}/bin/mpv --keep-open=yes --screenshot-directory=${XDG_PICTURES_DIR}"

# navigation

set -o vi

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# visual

export PS1="\$ "
