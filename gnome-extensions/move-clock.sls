Run move-clock:
  cmd.script:
    - name: move-clock 2 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul