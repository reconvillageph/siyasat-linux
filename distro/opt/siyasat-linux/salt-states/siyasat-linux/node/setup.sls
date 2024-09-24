nodejs-repo:
  pkgrepo.managed:
    - humanname: nodejs
    - name: deb https://deb.nodesource.com/node_20.x nodistro main
    - file: /etc/apt/sources.list.d/nodesource.list
    - key_url: https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key
    - gpgcheck: 1
    - refresh: true

nodejs:
  pkg.installed:
    - pkgrepo: nodejs-repo

