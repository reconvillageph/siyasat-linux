{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/duckduckgo" -%}

tools-duckduckgo:
  git.latest:
    - name: https://github.com/its0x08/duckduckgo.git
    - target: {{ target }}
    - user: {{ user }}

tools-duckduckgo-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/ddg
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DDG_DIR="$HOME/.local/tools/duckduckgo"'
      - 'cd $DDG_DIR'
      - 'source venv/bin/activate'
      - 'python ddg.py  "$@"'
      - 'exit'
