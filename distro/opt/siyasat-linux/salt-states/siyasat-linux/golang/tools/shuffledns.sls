{% set user = "siyasat" -%}
{% set repo = "github.com/projectdiscovery/shuffledns/cmd/shuffledns"-%}

# ENV Variables
{% set go_path = "/usr/local/go/bin" -%}
{% set env_path = salt['environ.get']('PATH') -%}
{% set env_path = env_path ~ ':' ~ go_path -%}

tools-golang-shuffledns:
  cmd.run:
    - name:  go install {{ repo }}@latest; 
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - env:
      - PATH: {{ env_path }}
      - GOPATH: /home/{{ user }}/go
