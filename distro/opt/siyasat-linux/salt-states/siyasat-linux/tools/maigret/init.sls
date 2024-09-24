{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/maigret" -%}

tools-maigret:
  git.latest:
    - name: https://github.com/soxoj/maigret
    - target: {{ target }}
    - user: {{ user }}


tools-maigret-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install .
    - cwd: {{ target }}
    - runas: {{ user }}

tools-maigret-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/maigret
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'MAIGRET_DIR="$HOME/.local/tools/maigret"'
      - 'cd $MAIGRET_DIR'
      - 'source venv/bin/activate'
      - 'maigret  "$@"'
      - 'exit'
