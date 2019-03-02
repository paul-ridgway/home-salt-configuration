Run sensory-perception:
  cmd.script:
    - name: sensory-perception 1145 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul