Run dash-to-panel:
  cmd.script:
    - name: dash-to-panel 1160 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul