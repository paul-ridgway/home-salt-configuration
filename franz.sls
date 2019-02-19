Run franz:
  cmd.script:
    - name: franz
    - source: salt://scripts/franz.sh
    - cwd: /
    - stateful: True
