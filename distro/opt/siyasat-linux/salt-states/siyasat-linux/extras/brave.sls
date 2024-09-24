brave-repo:
  pkgrepo.managed:
    - humanname: Brave Browser
    - name: deb https://brave-browser-apt-release.s3.brave.com/ stable main
    - file: /etc/apt/sources.list.d/brave.list
    - key_url: https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    - refresh: true

brave-browser:
  pkg.installed:
    - pkgrepo: brave-repo
    - name: brave-browser

