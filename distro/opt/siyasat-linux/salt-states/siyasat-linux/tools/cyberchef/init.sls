{% set user = 'siyasat' %}
{% set version = "10.19.2" -%}
{% set hash = "7838f713f69335fbdfd402764daf6c05f7848cf651f4b9e1a208c7993da1ec9e" -%}

tools-cyberchef:
  archive.extracted:
    - name: /home/{{ user }}/.local/tools/cyberchef
    - user: {{ user }}
    - group: {{ user }}
    - enforce_toplevel: false
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True

tools-cyberchef-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/cyberchef
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    - watch:
      - archive: tools-cyberchef
    - contents:
      - '#!/bin/bash'
      - firefox /home/{{ user }}/.local/tools/cyberchef/CyberChef_v{{ version }}.html &

tools-cyberchef-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/cyberchef.png
    - source: salt://siyasat-linux/tools/cyberchef/cyberchef.png
    - makedirs: True
      
tools-cyberchef-desktop:
  file.managed:
    - replace: False
    - name: /usr/share/applications/cyberchef.desktop
    - source: salt://siyasat-linux/tools/cyberchef/cyberchef.desktop
    - makedirs: True
    - watch:
      - file: tools-cyberchef-icon-file