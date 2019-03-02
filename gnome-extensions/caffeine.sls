Run caffeine:
  cmd.script:
    - name: caffeine 517 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul