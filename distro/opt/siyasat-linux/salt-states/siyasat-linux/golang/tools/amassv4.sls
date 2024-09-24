{% set user = "siyasat" %}
{% set version = "4.2.0" -%}
{% set target = '/home/siyasat/.local/tools/amass' -%}
{% set hash = "abef624f84b21fb45d4b9d39693863c6bf4e9ddb94830f797c129d03937a7f03" -%}

tools-amass:
  archive.extracted:
    - name: {{ target }}
    - enforce_toplevel: true
    - source: https://github.com/owasp-amass/amass/releases/download/v{{ version }}/amass_Linux_amd64.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - user: {{ user }}
    - group: {{ user }}

tools-amass-bin-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/amassv4
    - target: {{ target }}/amass_Linux_amd64/amass
    - mode: 755

