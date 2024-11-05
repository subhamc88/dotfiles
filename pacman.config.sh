#!/bin/bash

sudo rm -rf /etc/pacman.conf
cat <<EOL | sudo tee /etc/pacman.conf > /dev/null
[options]
HoldPkg     = pacman glibc
Architecture = auto

# Misc options
UseSyslog
Color
CheckSpace
VerbosePkgLists
ParallelDownloads = 10
ILoveCandy

# Signature options
SigLevel = Required DatabaseOptional
LocalFileSigLevel = Optional

# Enable caching for faster installations
CacheDir = /var/cache/pacman/pkg/
# Uncomment if you want to keep a specific number of versions
# CleanMethod = KeepInstalled

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist

# Optional: Uncomment to enable AUR support
[aur]
SigLevel = Optional
Include = /etc/pacman.d/aur-mirrorlist
