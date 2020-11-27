# piShare
LAN/WAN Pi Samba share automount USB

Partage de fichiers/disque sur réseau avec montage automatique des disques/clés USB

## installation

Exécuter l'installation :

    sudo ./install.sh
    
Créer les comptes utilisateur Samba

    sudo smbpasswd -a pi
    
## Utilisation

pour une clé/disque USB inséré, avec le nom "CLE-TEST", l'appareil est disponible sur le réseau :

    \\hostname\Public\CLE_TEST
    
n.b. hostname correspond au nom du raspberry
