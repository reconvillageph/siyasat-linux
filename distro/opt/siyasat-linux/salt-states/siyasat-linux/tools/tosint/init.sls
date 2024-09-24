{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/tosint" -%}

tools-tosint:
  git.latest:
    - name: https://github.com/drego85/tosint.git
    - target: {{ target }}
    - user: {{ user }}

tools-tosint-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-tosint-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/tosint
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'TOSINT_DIR="$HOME/.local/tools/tosint"'
      - 'cd $TOSINT_DIR'
      - 'source venv/bin/activate'
      - 'python tosint.py "$@"'
      - 'exit'
    