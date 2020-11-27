#!/bin/bash

# create samba share directory
mkdir /home/shares
mkdir /home/shares/Public
chown -R root:users /home/shares/Public
chmod -R ug=rwx,o=rx /home/shares/Public

# install samba
apt install samba samba-common-bin

# save smb.conf
FILE=/etc/samba/smb.conf.save
[ ! -f "$FILE" ] && cp /etc/samba/smb.conf "$FILE"
# cat public samba
cat "$FILE" ./install/public.smb > /etc/samba/smb.conf
# set security to user
sed '/####### Authentication #######/\   security = user' /etc/samba/smb.conf

# copy udev files
cd "${0%/*}"
cp ./install/usb-mount.sh /usr/local/bin/usb-mount.sh
chmod +x /usr/local/bin/usb-mount.sh
cp ./install/usb-mount@.service /etc/systemd/system/usb-mount@.service
cp /install/99-local.rules /etc/udev/rules.d/99-local.rules

# reload rules & services
udevadm control --reload-rules
systemctl daemon-reload
systemctl smbd restart
