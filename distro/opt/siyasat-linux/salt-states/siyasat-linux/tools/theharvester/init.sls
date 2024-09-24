{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/theharvester" -%}

tools-theharvester:
  git.latest:
    - name: https://github.com/laramies/theHarvester
    - target: {{ target }}
    - user: {{ user }}


tools-theharvester-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-theharvester-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/theHarvester
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'TH_DIR="$HOME/.local/tools/theharvester"'
      - 'cd $TH_DIR'
      - 'source venv/bin/activate'
      - 'python theHarvester.py  "$@"'
      - 'exit'
