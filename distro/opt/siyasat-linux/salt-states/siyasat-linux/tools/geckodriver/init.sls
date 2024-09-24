{% set user='siyasat' -%}
{% set target="/home/siyasat/.local/tools/geckodriver" -%}
{% set version="0.35.0" -%}
{% set hash = "ac26e9ba8f3b8ce0fbf7339b9c9020192f6dcfcbf04a2bcd2af80dfe6bb24260" -%}

tools-geckodriver:
  archive.extracted:
    - name: {{ target }}
    - source: https://github.com/mozilla/geckodriver/releases/download/v{{ version }}/geckodriver-v0.35.0-linux64.tar.gz
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - enforce_toplevel: false
    - user: {{ user }}
    - group: {{ user }}

tools-geckodriver-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/geckodriver
    - target: {{ target }}/geckodriver
    - mode: 755