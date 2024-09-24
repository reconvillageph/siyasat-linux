{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/certgraph" -%}
{% set hash = "2863503d929bbe2b7175f2acbdc494a0712046e8bb46a5c1d04cb56f4a27780c" -%}

tools-certgraph:
  archive.extracted:
    - name: {{ target }}
    - source: https://github.com/lanrat/certgraph/releases/download/20220513/certgraph-linux-amd64-20220513.zip
    - source_hash: sha256={{ hash }}
    - user: {{ user }}
    - group: {{ user }}
    - enforce_toplevel: false
    - overwrite: True

tools-certgraph-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/certgraph
    - target: {{ target }}/certgraph
    - mode: 755