{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/pagodo" -%}

tools-pagodo:
  git.latest:
    - name: https://github.com/opsdisk/pagodo
    - target: {{ target }}
    - user: {{ user }}


tools-pagodo-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-pagodo-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/pagodo
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'PAGODO_DIR="$HOME/.local/tools/pagodo"'
      - 'cd $PAGODO_DIR'
      - 'source venv/bin/activate'
      - 'python pagodo.py  "$@"'
      - 'exit'

tools-ghdb-scraper-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/ghdb_scraper
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'PAGODO_DIR="$HOME/.local/tools/pagodo"'
      - 'cd $PAGODO_DIR'
      - 'source venv/bin/activate'
      - 'python ghdb_scraper.py "$@"'
      - 'exit'