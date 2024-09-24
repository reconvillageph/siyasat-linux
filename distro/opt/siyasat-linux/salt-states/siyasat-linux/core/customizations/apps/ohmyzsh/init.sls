{% set user="siyasat" -%}
oh_my_zsh_git:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - rev: master
    - target: "/home/{{ user }}/.oh-my-zsh"
    - unless: "test -d /home/{{ user }}/.oh-my-zsh"
    - onlyif: "test -d /home/{{ user }}"
    - require_in:
      - file: oh_my_zsh_zshrc
#    - require:
#      - pkg: zsh

oh_my_zsh_permissions:
  file.directory:
    - name:  "/home/{{ user }}/.oh-my-zsh"
    - user: {{user}}
    - group: {{ user }}
    - file_mode: 744
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - git: oh_my_zsh_git
    - require_in:
      - file: oh_my_zsh_zshrc
    - onlyif: "test -d /home/{{ user }}"

oh_my_zsh_zshrc:
  file.managed:
    - replace: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - name: /home/{{ user }}/.zshrc
    - source: salt://siyasat-linux/core/customizations/apps/ohmyzsh/zshrc
    - makedirs: True

oh_my_zsh_user_home:
  file.replace:
    - name: /home/{{ user }}/.zshrc
    - pattern: 'export ZSH="/home/siyasat/.oh-my-zsh"'
    - repl: 'export ZSH="/home/{{ user }}/.oh-my-zsh"'
    - prepend_if_not_found: True
    - count: 1

oh_my_zsh_gau_fix:
  file.replace:
    - name: /home/{{ user }}/.oh-my-zsh/plugins/git/git.plugin.zsh
    - pattern: "alias gau='git add --update'"
    - repl: "#alias gau='git add --update'"
    - prepend_if_not_found: True
    - count: 1
