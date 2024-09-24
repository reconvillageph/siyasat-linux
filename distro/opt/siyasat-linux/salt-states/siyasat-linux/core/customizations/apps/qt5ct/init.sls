{% set user="siyasat" -%}
qt5ct-env:
  file.managed:
    - replace: True
    - user: root
    - group: root
    - mode: 644
    - name: /etc/environment.d/100qt5ct-dark-theme.conf
    - source: salt://siyasat-linux/core/customizations/apps/qt5ct/100qt5ct-dark-theme.conf
    - makedirs: True

qt5ct-config:
  file.recurse:
    - name: /home/{{ user }}/.config/qt5ct
    - user: {{ user }}
    - source: salt://siyasat-linux/core/customizations/apps/qt5ct/config
    - makedirs: True
    - include_empty: True
