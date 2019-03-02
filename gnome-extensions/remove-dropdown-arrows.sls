Run remove-dropdown-arrows:
  cmd.script:
    - name: remove-dropdown-arrows 800 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul