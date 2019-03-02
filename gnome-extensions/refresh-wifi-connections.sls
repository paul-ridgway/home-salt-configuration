Run refresh-wifi-connections:
  cmd.script:
    - name: refresh-wifi-connections 905 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul