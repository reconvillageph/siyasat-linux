{% set image = "six2dez/reconftw:main" -%}
{% set user = "siyasat" %}

docker-pull-reconftw:
  cmd.run:
    - name: docker pull {{ image }}
    - runas: root

docker-reconftw-wrapper:
  file.managed:
    - name: /home/{{ user }}/.local/bin/reconftw
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: true
    - mode: 755
    - contents:
      - '#!/bin/bash'
      - 'DIR="$HOME/.local/tools/reconftw"'
      - 'mkdir $DIR > /dev/null 2>&1'
      - 'cd $DIR'
      - 'sudo docker run -it --rm -v $DIR/OutputFolder/:/reconftw/Recon/  six2dez/reconftw:main "$@"'
      - 'exit'
