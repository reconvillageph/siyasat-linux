{% set user = "siyasat" -%}
{% set repo = "github.com/owasp-amass/amass/v3/...@master"-%}

# ENV Variables
{% set go_path = "/usr/local/go/bin" -%}
{% set env_path = salt['environ.get']('PATH') -%}
{% set env_path = env_path ~ ':' ~ go_path -%}

tools-golang-amass:
  cmd.run:
    - name:  go install {{ repo }}; 
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - env:
      - PATH: {{ env_path }}
      - GOPATH: /home/{{ user }}/go
