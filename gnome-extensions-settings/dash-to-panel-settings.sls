Run dash-to-panel-settings:
  cmd.script:
    - name: dash-to-panel-settings '/org/gnome/shell/extensions/dash-to-panel/' dash-to-panel.dconf
    - source: salt://scripts/gnome-extension-settings.sh
    - runas: paul
    - stateful: True
