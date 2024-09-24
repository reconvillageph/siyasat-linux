apt.packages:
    pkg.installed:
    - pkgs: 
        - apt-transport-https
        - debian-keyring
        - ca-certificates
        - software-properties-common
