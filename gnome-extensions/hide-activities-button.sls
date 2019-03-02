Run hide-activities-button:
  cmd.script:
    - name: hide-activities-button 1128 --restart-shell --update --yes
    - source: salt://scripts/gnome-shell-extension-installer
    - runas: paul