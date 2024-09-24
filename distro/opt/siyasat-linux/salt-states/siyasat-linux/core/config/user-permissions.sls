{% set target="/opt/siyasat-linux" -%}
{% set user="siyasat" -%}

config-set-permissions:
  file.directory:
    - name: {{ target }}
    - user: {{ user }}
    - group: {{ user }}
    - mode: 755    
    - recurse:
      - user
      - group