base_packages:
  pkg.installed:
    - pkgs:
      - htop
      - bwm-ng
      - git
      - curl
      - wget
      - p7zip-full
      - vim
      - zsh
      - nautilus-dropbox
      - tree
      - terminator
      - axel
      - autojump
      - smbclient
      - exfat-fuse
      - exfat-utils
      - vlc
      - audacity
      - kdenlive
      - libheif1
      - gimp
      - ufraw
      - ufraw-batch
      - gnome-tweak-tool
      - python-pip
      - iotop
      - net-tools
      - openssh-server
      - libreoffice
      - maven
      - openjdk-8-jdk
      - lightdm
      - ufraw
      - ufraw-batch
      - parallel
      - lm-sensors
      - xournal

# Trying to force myself to learn vim!
base_to_purge:
  pkg.purged:
    - pkgs:
      - nano
      - indicator-common
