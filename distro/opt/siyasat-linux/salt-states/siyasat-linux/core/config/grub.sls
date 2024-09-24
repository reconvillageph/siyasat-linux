grub-config:
  file.replace:
    - name: /etc/default/grub
    - pattern: 'GRUB_TIMEOUT=5'
    - repl: 'GRUB_TIMEOUT=0'
    - prepend_if_not_found: True
    - count: 1

grub-update:
   cmd.run:
    - name: update-grub
    - runas: root
    - cwd: /root
    - shell: /bin/bash
