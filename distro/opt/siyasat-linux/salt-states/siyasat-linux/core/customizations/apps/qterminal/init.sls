{% set user="siyasat" -%}

qterminal-dir:
  file.directory:
    - name:  "/home/{{ user }}/.config/qterminal.org"
    - user: {{user}}
    - group: {{ user }}
    - file_mode: 744
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

qterminal:
  file.managed:
    - replace: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - name: /home/{{ user }}/.config/qterminal.org/qterminal.ini
    - source: salt://siyasat-linux/core/customizations/apps/qterminal/qterminal.ini
    - makedirs: True
