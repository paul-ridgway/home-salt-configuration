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

# Trying to force myself to learn vim!
base_to_purge:
  pkg.purged:
    - pkgs:
      - nano
