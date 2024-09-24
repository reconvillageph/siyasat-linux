{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/webscreenshot" -%}

tools-webscreenshot:
  git.latest:
    - name: https://github.com/maaaaz/webscreenshot
    - target: {{ target }}
    - user: {{ user }}

tools-webscreenshot-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-webscreenshot-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/webscreenshot
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'WS_DIR="$HOME/.local/tools/webscreenshot"'
      - 'cd $WS_DIR'
      - 'source venv/bin/activate'
      - 'python webscreenshot.py  "$@"'
      - 'exit'
