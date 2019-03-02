Run user-themes:
  cmd.script:
    - name: user-themes 19 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul