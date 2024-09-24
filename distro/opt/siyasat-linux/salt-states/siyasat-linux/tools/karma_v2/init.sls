{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/karma_v2" -%}

tools-karma_v2:
  git.latest:
    - name: https://github.com/Dheerajmadhukar/karma_v2.git
    - target: {{ target }}
    - user: {{ user }}


tools-karma_v2-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install mmh3
    - cwd: {{ target }}
    - runas: {{ user }}

tools-karma_v2-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/karma_v2
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'KARMA_DIR="$HOME/.local/tools/karma_v2"'
      - 'cd $KARMA_DIR'
      - 'source venv/bin/activate'
      - 'bash karma_v2 "$@"'
      - 'exit'
