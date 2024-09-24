{% set user = 'siyasat' %}
{% set target="/home/siyasat/.local/bin/SpiderSuite" -%}
{% set hash = "601ef16c6ce0fe02eef3ce4a63d85fd47e1f0dff63a4027b40a697cc56e9f432" -%}

tools-spidersuite:
  file.managed:
    - source: https://github.com/3nock/SpiderSuite/releases/download/v1.0.4/SpiderSuite_v1.0.4_linux.AppImage
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - name: {{ target }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755
    
tools-spidersuite-icon-file:
  file.managed:
    - replace: False
    - name: /usr/share/icons/spidersuite.png
    - source: salt://siyasat-linux/tools/spidersuite/SpiderSuite.png
    - makedirs: True
      
tools-spidersuite-desktop:
  file.managed:
    - replace: False
    - name: /usr/share/applications/spidersuite.desktop
    - source:  salt://siyasat-linux/tools/spidersuite/SpiderSuite.desktop
    - makedirs: True
    - watch:
      - file: tools-spidersuite-icon-file
