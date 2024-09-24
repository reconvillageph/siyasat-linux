{% set user = "siyasat" -%}

docker-repo:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/debian bookworm stable
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/debian/gpg 
    - refresh: true

docker-ce:
  pkg.installed:
    - pkgrepo: docker-repo

docker-compose:
  pkg.installed:
    - pkgrepo: docker-repo
    
docker-group:
  cmd.run:
    - name: usermod -aG docker {{ user }}
    - runas: root