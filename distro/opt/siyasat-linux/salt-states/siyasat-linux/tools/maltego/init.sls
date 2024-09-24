{% set source="https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.8.0.deb" -%}

tools-maltego:
  pkg.installed:
    - sources:
      - maltego:  {{ source }}

tools-maltego-config-desktop:
  file.append:
    - name: /usr/share/applications/maltego_config.desktop
    - text: |
        NoDisplay=true