{% set user = "siyasat" %}
{% set target="/home/siyasat/.local/tools/discoshell" -%}

tools-discoshell:
  git.latest:
    - name: https://github.com/foozzi/discoshell
    - target: {{ target }}
    - user: {{ user }}

tools-discoshell-symlink:
  file.symlink:
    - name: /home/{{ user }}/.local/bin/discoshell
    - target: {{ target }}/discoshell.sh
    - mode: 755