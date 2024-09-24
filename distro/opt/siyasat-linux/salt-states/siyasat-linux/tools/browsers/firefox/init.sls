{% set user="siyasat" -%}
firefox-esr-distribution:
  file.managed:
    - replace: True
    - user: root
    - group: root
    - mode: 644
    - name: /usr/share/firefox-esr/distribution/distribution.ini
    - source: salt://siyasat-linux/tools/browsers/firefox/distribution/distribution.ini
    - makedirs: True

firefox-esr-extensions:
  file.recurse:
    - name: /usr/share/firefox-esr/distribution/extensions
    - user: root
    - source: salt://siyasat-linux/tools/browsers/firefox/distribution/extensions
    - makedirs: True
    - include_empty: True
