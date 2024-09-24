{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/osif" -%}

tools-osif:
  git.latest:
    - name: https://github.com/fr4nc1stein/osint-framework
    - target: {{ target }}
    - user: {{ user }}


tools-osif-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-osif-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/osif
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'OSIF_DIR="$HOME/.local/tools/osif"'
      - 'cd $OSIF_DIR'
      - 'source venv/bin/activate'
      - 'python osif "$@"'
      - 'exit'
