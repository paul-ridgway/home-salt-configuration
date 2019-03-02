Run extensions:
  cmd.script:
    - name: extensions 1036 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul