flatpak-obsidian:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'md.obsidian.Obsidian' 
    - runas: root

flatpak-xmind:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'net.xmind.XMind' 
    - runas: root

flatpak-sublimetext:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'com.sublimetext.three' 
    - runas: root

flatpak-torbrowser-launcher:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'org.torproject.torbrowser-launcher' 
    - runas: root

flatpak-onionshare:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'org.onionshare.OnionShare' 
    - runas: root

flatpak-drawio:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'com.jgraph.drawio.desktop' 
    - runas: root

flatpak-pinta:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'com.github.PintaProject.Pinta' 
    - runas: root

flatpak-regextester:
  cmd.run:
    - name: flatpak install --or-update --assumeyes 'com.github.artemanufrij.regextester' 
    - runas: root

