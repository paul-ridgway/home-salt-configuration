Run cpu-power-manager:
  cmd.script:
    - name: cpu-power-manager 945 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul