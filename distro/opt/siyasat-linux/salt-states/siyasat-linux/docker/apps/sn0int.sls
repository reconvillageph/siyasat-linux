{% set image = "ghcr.io/kpcyrd/sn0int" -%}
{% set user = "siyasat" %}

docker-pull-sn0int:
  cmd.run:
    - name: docker pull {{ image }}
    - runas: root

docker-sn0int-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/sn0int
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: true
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DIR="$HOME/.local/tools/sn0int"'
      - 'mkdir $DIR > /dev/null 2>&1'
      - 'cd $DIR'
      - 'sudo docker run --rm --init -it -v "$DIR/cache:/cache" -v "$DIR/data:/data" ghcr.io/kpcyrd/sn0int "$@"'
      - 'exit'
