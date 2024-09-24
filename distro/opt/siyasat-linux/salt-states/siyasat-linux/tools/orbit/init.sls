{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/orbit" -%}

tools-orbit:
  git.latest:
    - name: https://github.com/s0md3v/Orbit.git
    - target: {{ target }}
    - user: {{ user }}

tools-orbit-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install requests
    - cwd: {{ target }}
    - runas: {{ user }}

tools-orbit-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/orbit
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'ORBIT_DIR="$HOME/.local/tools/orbit"'
      - 'cd $ORBIT_DIR'
      - 'source venv/bin/activate'
      - 'python orbit.py "$@"'
      - 'exit'
    