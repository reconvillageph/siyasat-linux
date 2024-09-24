{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/eyewitness" -%}

tools-eyewitness:
  git.latest:
    - name: https://github.com/RedSiege/EyeWitness
    - target: {{ target }}
    - user: {{ user }}


tools-eyewitness-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r setup/requirements.txt
    - cwd: {{ target }}/Python
    - runas: {{ user }}

tools-eyewitness-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/eyewitness
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'EYEWITNESS_DIR="$HOME/.local/tools/eyewitness/Python"'
      - 'cd $EYEWITNESS_DIR'
      - 'source venv/bin/activate'
      - 'python EyeWitness.py  "$@"'
      - 'exit'
