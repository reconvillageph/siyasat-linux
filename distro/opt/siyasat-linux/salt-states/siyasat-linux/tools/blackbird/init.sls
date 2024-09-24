{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/blackbird" -%}

tools-blackbird:
  git.latest:
    - name: https://github.com/p1ngul1n0/blackbird
    - target: {{ target }}
    - user: {{ user }}

tools-blackbird-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-blackbird-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/blackbird
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'BLACKBIRD_DIR="$HOME/.local/tools/blackbird"'
      - 'cd $BLACKBIRD_DIR'
      - 'source venv/bin/activate'
      - 'python blackbird.py  "$@"'
      - 'exit'
