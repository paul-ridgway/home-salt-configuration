Run shortcuts:
  cmd.script:
    - name: gnome-settings
    - source: salt://scripts/caffeine-settings.sh
    - runas: paul
    - stateful: True
