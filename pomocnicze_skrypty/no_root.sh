#!/bin/bash

sudo systemd stop flaga.service > /dev/null
sudo systemd disable flaga.service > /dev/null
sudo systemd daemon-reload > /dev/null
sudo rm /var/www/flaga/flaga.sock > /dev/null

mkdir -p ~/.config/systemd/user/
mv /etc/systemd/system/flaga.service /var/www/flaga/pliki_serwerowe/*.backup

cat << EOF > ~/.config/systemd/user/flaga.service
[Unit]
After=network.target
Description=Flaga - Programowanie xD

[Service]
WorkingDirectory=/var/www/flaga
Environment="PATH=/var/www/flaga/flagaenv/bin"

ExecStart=/var/www/flaga/flagaenv/bin/gunicorn --workers 3 --bind unix:flaga.sock -m 007 app:app
ExecStartPost=sleep 5
ExecStartPost=chown :www-data /var/www/flaga/flaga.sock

Restart=on-failure
ExecReload=/bin/kill -s HUP $MAINPID
KillMode=mixed
TimeoutStopSec=5

Restart=always
RestartSec=60
PrivateTmp=true

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user status flaga.service
systemctl --user start flaga.service
loginctl enable-linger $USER

