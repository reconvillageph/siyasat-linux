{% set user='siyasat' -%}
{% set version = "1.23.1" -%}
{% set hash = "49bbb517cfa9eee677e1e7897f7cf9cfdbcf49e05f61984a2789136de359f9bd" -%}
{% set base_dir = "/usr/local" -%}
{% set go_root = "/usr/local/go" -%}
{% set go_path = "/usr/local/go/bin" -%}
{% set root_go_path="/root/go" -%}
{% set env_path = salt['environ.get']('PATH') -%}
{% set env_path = env_path ~ ':' ~ go_path -%}

tools-golang:
  archive.extracted:
    - name: {{ base_dir }}
    - source: https://go.dev/dl/go{{ version }}.linux-amd64.tar.gz
    - source_hash: sha256={{ hash }}
    - overwrite: True

tools-golang-set-goroot:
  environ.setenv:
    - name: GOROOT
    - value: {{ go_root }}
    - update_minion: True

tools-golang-update-path:
  environ.setenv:
    - name: PATH
    - value: {{ env_path }}
    - update_minion: True

tools-golang-root-bashrc:
  file.append:
    - name: /root/.bashrc
    - text:
      - export GOROOT={{ go_root }}
      - export GOPATH={{ root_go_path }}
      - export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

tools-golang-user-bashrc:
  file.append:
    - name: /home/{{ user }}/.bashrc
    - text:
      - export GOROOT={{ go_root }}
      - export GOPATH=/home/{{ user }}/go
      - export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

tools-golang-root-zshrc:
  file.append:
    - name: /root/.zshrc
    - text:
      - export GOROOT={{ go_root }}
      - export GOPATH={{ root_go_path }}
      - export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

tools-golang-user-zshrc:
  file.append:
    - name: /home/{{ user }}/.zshrc
    - text:
      - export GOROOT={{ go_root }}
      - export GOPATH=/home/{{ user }}/go
      - export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

tools-golang-source:
  cmd.run:
    - name: source /home/{{ user }}/.bashrc
    - runas: {{ user }}
    - cwd: /home/{{ user }}
