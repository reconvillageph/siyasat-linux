{% set user = "siyasat" -%}
{% set dbus = "unix:path=/run/user/1000/bus" -%}

gnome-folders:
  cmd.run:
    - name: gsettings set org.gnome.desktop.app-folders folder-children "['Analysis', 'Reporting', 'Media', 'Collection-tools', 'Utilities', 'System']"
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 

gnome-folder-utilities:
  cmd.run:
    - name: gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ name 'Utilities'
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 

gnome-utilities-apps:
  cmd.run:
    - name: gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Utilities/ apps "['gnome-abrt.desktop', 'gnome-system-log.desktop', 'nm-connection-editor.desktop', 'org.gnome.baobab.desktop', 'org.gnome.Connections.desktop', 'org.gnome.DejaDup.desktop', 'org.gnome.Dictionary.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.eog.desktop', 'org.gnome.Evince.desktop', 'org.gnome.FileRoller.desktop', 'org.gnome.fonts.desktop', 'org.gnome.seahorse.Application.desktop', 'org.gnome.tweaks.desktop', 'org.gnome.Usage.desktop', 'vinagre.desktop', 'org.gnome.Extensions.desktop', 'htop.desktop', 'im-config.desktop', 'yelp.desktop', 'galculator.desktop', 'org.gnome.Software.desktop', 'vim.desktop', 'software-properties-gtk.desktop', 'org.gnome.Screenshot.desktop', 'qt5ct.desktop', 'qterminal-drop.desktop', 'gnome-printers-panel.desktop', 'system-config-printer.desktop']"
    - runas: {{ user }}
    - cwd: /home/{{ user }}
    - shell: /bin/bash
    - env:
      - DBUS_SESSION_BUS_ADDRESS: "{{ dbus }}" 

