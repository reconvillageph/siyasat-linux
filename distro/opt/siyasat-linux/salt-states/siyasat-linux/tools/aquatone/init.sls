{% set user='siyasat' -%}
{% set target="/home/siyasat/.local/tools/aquatone" -%}
{% set hash = "077119d9ccc5e19bb7323a65402aeb4f3460297fb8107efaeeb428e0982fdeac" -%}

tools-aquatone:
  archive.extracted:
    - name: {{ target }}
    - source: https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - enforce_toplevel: false
    - user: {{ user }}
    - group: {{ user }}


tools-aquatone-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/aquatone
    - target: {{ target }}/aquatone
    - mode: 755