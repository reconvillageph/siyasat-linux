{% set image = "sundowndev/phoneinfoga:latest" -%}
{% set user = "siyasat" %}

docker-pull-phoneinfoga:
  cmd.run:
    - name: docker pull {{ image }}
    - runas: root

docker-phoneinfoga-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/phoneinfoga
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: true
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DIR="$HOME/.local/tools/phoneinfoga"'
      - 'mkdir $DIR > /dev/null 2>&1'
      - 'cd $DIR'
      - 'sudo docker run --rm -it sundowndev/phoneinfoga "$@"'
      - 'exit'
