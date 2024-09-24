{% set user='siyasat' -%}
{% set target="/home/siyasat/.local/tools/glit" -%}
{% set hash = "cc1c408e2f65643fd4c4a92c59f15aef63da8fbf6bf88bda488af8b62e12efb5" -%}

tools-glit:
  archive.extracted:
    - name: {{ target }}
    - source: https://github.com/shadawck/glit/releases/download/v0.2.0/glit-x86_64-unknown-linux-gnu-v0.2.0.tgz
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - enforce_toplevel: true
    - user: {{ user }}
    - group: {{ user }}
    
tools-glit-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/glit
    - target: {{ target }}/glit-x86_64-unknown-linux-gnu-v/glit
    - mode: 755