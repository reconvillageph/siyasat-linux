{% set user='siyasat' -%}
{% set target="/home/siyasat/.local/tools/trufflehog" -%}
{% set hash = "b4360a24078d17be78353d3eaf78329f67f10d15a3eef4c5cbf775bd79e0b0a4" -%}

tools-trufflehog:
  archive.extracted:
    - name: {{ target }}
    - source: https://github.com/trufflesecurity/trufflehog/releases/download/v3.82.2/trufflehog_3.82.2_linux_amd64.tar.gz
    - source_hash: sha256={{ hash }}
    - overwrite: true
    - enforce_toplevel: false
    - user: {{ user }}
    - group: {{ user }}
    
tools-trufflehog-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/trufflehog
    - target: {{ target }}/trufflehog
    - mode: 755