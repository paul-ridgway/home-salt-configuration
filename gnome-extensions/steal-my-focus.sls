Run steal-my-focus:
  cmd.script:
    - name: steal-my-focus 234 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul