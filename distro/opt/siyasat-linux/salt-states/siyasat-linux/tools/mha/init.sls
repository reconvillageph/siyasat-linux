{% set user = 'siyasat' %}
{% set target="/home/siyasat/.local/tools/mha" -%}

tools-mha:
  git.latest:
    - name: https://github.com/cyberdefenders/email-header-analyzer.git
    - target: {{ target }}
    - user: {{ user }}

tools-mha-venv:
  cmd.run:
    - name: python3 -m venv venv; source venv/bin/activate; pip install -r requirements.txt
    - cwd: {{ target }}
    - runas: {{ user }}

tools-mha-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/mha
    - source: salt://siyasat-linux/tools/mha/mha
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    
tools-mha-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/mha.png
    - source: salt://siyasat-linux/tools/mha/mha.png
    - makedirs: True
      
tools-mha-desktop:
  file.managed:
    - replace: False
    - name: /usr/share/applications/mha.desktop
    - source: salt://siyasat-linux/tools/mha/mha.desktop
    - makedirs: True
    - watch:
      - file: tools-mha-icon-file
