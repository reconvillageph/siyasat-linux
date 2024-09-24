{% set user='siyasat' -%}
{% set target="/home/siyasat/.local/tools/phantomjs" -%}
{% set version="2.1.1" -%}
{% set hash = "86dd9a4bf4aee45f1a84c9f61cf1947c1d6dce9b9e8d2a907105da7852460d2f" -%}

tools-phantomjs:
  archive.extracted:
    - name: {{ target }}
    - source: https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-{{ version }}-linux-x86_64.tar.bz2
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - user: {{ user }}
    - group: {{ user }}
    
tools-phantomjs-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/phantomjs
    - target: {{ target }}/phantomjs-{{ version }}-linux-x86_64/bin/phantomjs
    - mode: 755