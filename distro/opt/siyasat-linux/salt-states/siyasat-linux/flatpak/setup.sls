flatpak-packages:
    pkg.installed:
    - pkgs: 
        - flatpak
        - gnome-software-plugin-flatpak

flatpak-flathub:
  cmd.run:
    - name: flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    