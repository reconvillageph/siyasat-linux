{% set user = "siyasat" -%}
{% set dbus = "unix:path=/run/user/1000/bus" -%}
{% set wallpaper="/usr/share/backgrounds/siyasat-default.png" -%}
{% set gtk_theme="Adwaita-dark" -%}

gnome-button-layout:
  cmd.run:
    - name: gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 

gnome-background-default:
  file.managed:
    - replace: False
    - user: root
    - group: root
    - mode: 755
    - name: {{ wallpaper }}
    - source: /opt/siyasat-linux/salt-states/siyasat-linux/core/customizations/assets/backgrounds/siyasat-default.png
    - makedirs: True

gnome-background-dark:
  cmd.run:
    - name: gsettings set org.gnome.desktop.background picture-uri-dark "file://{{ wallpaper }}"
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 

gnome-background:
  cmd.run:
    - name: gsettings set org.gnome.desktop.background picture-uri "file://{{ wallpaper }}"
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 

gnome-dark-theme:
   cmd.run:
    - name: gsettings set org.gnome.desktop.interface gtk-theme {{ gtk_theme }}
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}"  

gnome-dark-theme-prefer:
   cmd.run:
    - name: gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}"  


gnome-favorites:
   cmd.run:
    - name: gsettings set org.gnome.shell favorite-apps "[ 'org.gnome.Nautilus.desktop', 'qterminal.desktop', 'firefox-esr.desktop', 'md.obsidian.Obsidian.desktop', 'code.desktop']"
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}"  

gnome-icons-extract:
  archive.extracted:
    - name: /usr/share/icons
    - source: salt://siyasat-linux/core/customizations/assets/icons/Flat-Remix-Blue.tar.xz
    - overwrite: False

gnome-icons:
   cmd.run:
    - name: gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Blue'
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}"  

gnome-power-settings:
  cmd.run:
    - name: gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 
