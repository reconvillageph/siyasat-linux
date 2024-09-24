{% set user = 'siyasat' %}

sudoers:
  file.append:
    - name: /etc/sudoers.d/{{ user }}
    - text: "{{ user }} ALL=NOPASSWD: ALL\nDefaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\""
    - makedirs: True
