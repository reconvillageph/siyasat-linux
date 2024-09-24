{% set user="siyasat" -%}
vimrc:
  file.managed:
    - replace: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - name: /home/{{ user }}/.vimrc
    - source: salt://siyasat-linux/core/customizations/apps/vim/vimrc
    - makedirs: True
