{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/interlace" -%}

tools-interlace:
  git.latest:
    - name: https://github.com/codingo/Interlace.git
    - target: {{ target }}
    - user: {{ user }}

tools-interlace-setup:
  cmd.run:
    - name: python3 setup.py install
    - cwd: {{ target }}
    - runas: root
