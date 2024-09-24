{% set image = "alaa0x2/serpscan:latest" -%}
{% set user = "siyasat" %}

docker-pull-serpscan:
  cmd.run:
    - name: docker pull {{ image }}
    - runas: root

docker-serpscan-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/serpscan
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: true
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DIR="$HOME/.local/tools/serpscan"'
      - 'mkdir $DIR > /dev/null 2>&1'
      - 'cd $DIR'
      - 'sudo docker run -it --rm  alaa0x2/serpscan:latest php /usr/src/SerpScan/start.php "$@"'
      - 'exit'
