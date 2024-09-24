{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/github-search" -%}

tools-github-search:
  git.latest:
    - name: https://github.com/gwen001/github-search
    - target: {{ target }}
    - user: {{ user }}


tools-github-search-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-github-search-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/github-search
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'ENV_PATH="$HOME/.local/tools/github-search/venv/bin/activate"'
      - 'GITSEARCH_DIR="$HOME/.local/tools/github-search"'
      - 'cd $GITSEARCH_DIR'
      - 'clear'
      - 'echo "########################################"'
      - 'echo "#        GitHub tools collection       #"'
      - 'echo "########################################"'
      - 'echo "-> "'
      - 'echo "-> Available tools:"'
      - 'echo "-> "'
      - 'ls *.sh | while read line; do' 
      - '  echo "[✅] bash $line"'
      - 'done'
      - 'ls *.py | while read line; do'
      - '  echo "[✅] python $line -y"'
      - 'done'
      - 'echo "-> "'
      - 'echo "-> python venv activated. [✅]"'
      - 'echo "-> "'
      - 'bash --rcfile $ENV_PATH -i'
