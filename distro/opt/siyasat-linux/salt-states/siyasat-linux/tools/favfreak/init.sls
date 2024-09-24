{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/favfreak" -%}

tools-favfreak:
  git.latest:
    - name: https://github.com/devanshbatham/FavFreak
    - target: {{ target }}
    - user: {{ user }}


tools-favfreak-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install mmh3
    - cwd: {{ target }}
    - runas: {{ user }}

tools-favfreak-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/favfreak
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'FAVFREAK_DIR="$HOME/.local/tools/favfreak"'
      - 'cd $FAVFREAK_DIR'
      - 'source venv/bin/activate'
      - 'python favfreak.py  "$@"'
      - 'exit'
