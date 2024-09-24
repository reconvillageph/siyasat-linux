{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/httpscreenshot" -%}

tools-httpscreenshot:
  git.latest:
    - name: https://github.com/breenmachine/httpscreenshot
    - target: {{ target }}
    - user: {{ user }}

tools-httpscreenshot-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt; pip uninstall --yes selenium; pip install --no-input selenium==4.9.0
    - cwd: {{ target }}
    - runas: {{ user }}

tools-httpscreenshot-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/httpscreenshot
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'HSS_DIR="$HOME/.local/tools/httpscreenshot"'
      - 'cd $HSS_DIR'
      - 'source venv/bin/activate'
      - 'python httpscreenshot.py  "$@"'
      - 'exit'
