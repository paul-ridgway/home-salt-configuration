Run status-area-horizontal-spacing:
  cmd.script:
    - name: status-area-horizontal-spacing 355 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul