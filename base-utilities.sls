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
      - autojump

base_to_purge:
  pkg.purged:
    - pkgs:
      - nano
