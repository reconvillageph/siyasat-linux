archive-tools.packages:
    pkg.installed:
    - pkgs: 
        - p7zip-full
        - unrar-free
        - unzip
        - zip
        - unp
        - tar
        
7zip-download-and-extract:
  archive.extracted:
    - name: /tmp/7zip
    - source: https://7-zip.org/a/7z2408-linux-x64.tar.xz
    - source_hash: md5=8908df4bec189cd1f314b54724911a36
    - enforce_toplevel: False

7zip-7zz-install:
  file.managed:
    - replace: True
    - user: root
    - group: root
    - mode: 755
    - name: /usr/local/bin/7zz
    - source: /tmp/7zip/7zz
    - makedirs: True
