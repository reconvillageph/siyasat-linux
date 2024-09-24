{% set user = 'siyasat' %}
pipx-ensurepath:
  cmd.run:
    - name: pipx ensurepath 
    - runas: {{ user }}

pipx-ghunt:
  cmd.run:
    - name: pipx install ghunt
    - runas: {{ user }}

pipx-sterra:
  cmd.run:
    - name: pipx install sterra
    - runas: {{ user }}

pipx-toutatis:
  cmd.run:
    - name: pipx install toutatis 
    - runas: {{ user }}

pipx-nexfil:
  cmd.run:
    - name: pipx install nexfil 
    - runas: {{ user }}

pipx-csvkit:
  cmd.run:
    - name: pipx install csvkit 
    - runas: {{ user }}

pipx-yt-dlp:
  cmd.run:
    - name: pipx install yt-dlp 
    - runas: {{ user }}

pipx-wafw00f:
  cmd.run:
    - name: pipx install git+https://github.com/EnableSecurity/wafw00f.git  
    - runas: {{ user }}

pipx-waybackpack:
  cmd.run:
    - name: pipx install waybackpack 
    - runas: {{ user }}

pipx-h8mail:
  cmd.run:
    - name: pipx install h8mail 
    - runas: {{ user }}

pipx-holehe:
  cmd.run:
    - name: pipx install holehe  
    - runas: {{ user }}

pipx-sherlock:
  cmd.run:
    - name: pipx install sherlock-project 
    - runas: {{ user }}

pipx-dnsgen:
  cmd.run:
    - name: pipx install dnsgen 
    - runas: {{ user }}

pipx-bbot:
  cmd.run:
    - name: pipx install bbot 
    - runas: {{ user }}

pipx-shodan:
  cmd.run:
    - name: pipx install shodan 
    - runas: {{ user }}

pipx-tubeup:
  cmd.run:
    - name: pipx install tubeup --include-deps
    - runas: {{ user }}