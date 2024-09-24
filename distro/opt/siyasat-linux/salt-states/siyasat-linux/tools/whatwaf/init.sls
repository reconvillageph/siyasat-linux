{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/whatwaf" -%}

tools-whatwaf:
  git.latest:
    - name: https://github.com/ekultek/whatwaf
    - target: {{ target }}
    - user: {{ user }}


tools-whatwaf-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-whatwaf-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/whatwaf
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'WHATWAF_DIR="$HOME/.local/tools/whatwaf"'
      - 'cd $WHATWAF_DIR'
      - 'source venv/bin/activate'
      - 'python whatwaf.py  "$@"'
      - 'exit'
