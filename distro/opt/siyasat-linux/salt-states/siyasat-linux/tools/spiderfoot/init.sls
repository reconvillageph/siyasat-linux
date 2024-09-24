{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/spiderfoot" -%}

tools-spiderfoot:
  git.latest:
    - name: https://github.com/smicallef/spiderfoot.git
    - target: {{ target }}
    - user: {{ user }}

tools-spiderfoot-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-spiderfoot-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/spiderfoot
    - source: salt://siyasat-linux/tools/spiderfoot/spiderfoot
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    
tools-spiderfoot-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/spiderfoot.png
    - source: salt://siyasat-linux/tools/spiderfoot/spiderfoot.png
    - makedirs: True
      
tools-spiderfoot-desktop:
  file.managed:
    - replace: False
    - name: /usr/share/applications/spiderfoot.desktop
    - source: salt://siyasat-linux/tools/spiderfoot/spiderfoot.desktop
    - makedirs: True
    - watch:
      - file: tools-spiderfoot-icon-file