{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/LinkScope" -%}

tools-linkscope:
  git.latest:
    - name: https://github.com/AccentuSoft/LinkScope_Client.git
    - target: {{ target }}
    - user: {{ user }}

tools-linkscope-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt --upgrade; playwright install
    - cwd: {{ target }}
    - runas: {{ user }}

tools-linkscope-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/linkscope
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'LINKSCOPE_DIR="$HOME/.local/tools/LinkScope"'
      - 'cd $LINKSCOPE_DIR'
      - 'source venv/bin/activate'
      - 'python LinkScope.py&'
      - 'exit'

tools-linkscope-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/linkscope.png
    - source: salt://siyasat-linux/tools/linkscope/linkscope.png
    - makedirs: True
      
tools-linkscope-desktop:
  file.managed:
    - replace: False
    - name: /usr/share/applications/linkscope.desktop
    - source: salt://siyasat-linux/tools/linkscope/linkscope.desktop
    - makedirs: True
    - watch:
      - file: tools-linkscope-icon-file