Run dynamic-panel-transparency:
  cmd.script:
    - name: dynamic-panel-transparency 1011 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul