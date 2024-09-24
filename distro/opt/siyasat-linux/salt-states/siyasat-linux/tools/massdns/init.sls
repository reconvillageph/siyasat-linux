{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/massdns" -%}

tools-massdns:
  git.latest:
    - name: https://github.com/blechschmidt/massdns.git
    - target: {{ target }}
    - user: {{ user }}

tools-massdns-compile-and-install:
  cmd.run:
    - name: cd massdns; make ; make install
    - cwd: {{ target }}
    - runas: root