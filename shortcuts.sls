Run shortcuts:
  cmd.script:
    - name: shortcuts
    - source: salt://scripts/shortcuts.sh
    - cwd: /
    - runas: paul
    - stateful: True
