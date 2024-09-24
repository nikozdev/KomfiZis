rsync -avzi --progress "." "/"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

alias aPm="brew"
aPm update && aPm upgrade;

alias aPmRemove="aPm remove"

alias aPmInstall="aPm install"

aPmInstall zsh zsh-autosuggestions && chsh /bin/zsh;
aPmInstall adduser pass;
aPmInstall bat xxd fzf ripgrep vifm;
aPmInstall cpufetch cpufrequtils pciutils powerstat;
aPmInstall parted fdisk ncdu;
aPmInstall fenrir orca;

aPmInstall git clang clang-format cmake pkg-config bear golang nodejs npm;
aPmInstall openssh-client curl wget ftp inetutils-telnet net-tools netcat-traditional;
aPmInstall mysql sqlite3 docker docker-ce docker-ce-cli;

aPmInstall ffmpeg mpv cmus;

aPmInstall firefox-esr;

aPmInstall fonts-anonymous-pro

aPmInstall suckless-tools xclip xdg-desktop-portal-gnome xdg-user-dirs-gtk xinput xsel;

aPmInstall taskwarrior
