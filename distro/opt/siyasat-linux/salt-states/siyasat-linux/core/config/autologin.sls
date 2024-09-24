{% set user = 'siyasat' %}

siyasat-linux-autologin-true:
  file.replace:
    - name: /etc/gdm3/daemon.conf
    - pattern: '#  AutomaticLoginEnable = true'
    - repl: 'AutomaticLoginEnable = true'
    - prepend_if_not_found: True
    - count: 1

siyasat-linux-autologin-user:
  file.replace:
    - name: /etc/gdm3/daemon.conf
    - pattern: '#  AutomaticLogin = user1'
    - repl: 'AutomaticLogin = {{ user }}'
    - prepend_if_not_found: True
    - count: 1
