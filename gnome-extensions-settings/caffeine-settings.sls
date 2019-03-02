Run caffeine-settings:
  cmd.script:
    - name: caffeine-settings '/org/gnome/shell/extensions/caffeine/' caffeine.dconf
    - source: salt://scripts/gnome-extension-settings.sh
    - runas: paul
    - stateful: True
