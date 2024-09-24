{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/metagoofil" -%}

tools-metagoofil:
  git.latest:
    - name: https://github.com/opsdisk/metagoofil
    - target: {{ target }}
    - user: {{ user }}


tools-metagoofil-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-metagoofil-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/metagoofil
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DIR="$HOME/.local/tools/metagoofil"'
      - 'cd $DIR'
      - 'source venv/bin/activate'
      - 'python metagoofil.py  "$@"'
      - 'exit'
