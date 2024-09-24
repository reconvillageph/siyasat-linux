{% set image = "zricethezav/gitleaks:latest" -%}
{% set user = "siyasat" %}

docker-pull-gitleaks:
  cmd.run:
    - name: docker pull {{ image }}
    - runas: root

docker-gitleaks-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/gitleaks
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: true
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DIR="$HOME/.local/tools/gitleaks"'
      - 'mkdir $DIR > /dev/null 2>&1'
      - 'cd $DIR'
      - 'sudo docker run --rm -v $DIR:/path zricethezav/gitleaks:latest "$@"'
      - 'exit'
