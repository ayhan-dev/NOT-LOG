#!/bin/bash

URL="https://raw.githubusercontent.com/ayhan-dev/NOT-LOG/main/URl/file.txt"
LOCAL_FILE="file.txt"
current_user=$(whoami)
wget -O "$LOCAL_FILE" "$URL"

script_path="/home/$current_user/Desktop/logurl/logurl.py"
service_name="logurl"

service_file="/etc/systemd/system/$service_name.service"
echo "[Unit]" > $service_file
echo "Description=My Script" >> $service_file
echo "" >> $service_file
echo "[Service]" >> $service_file
echo "Type=simple" >> $service_file
echo "ExecStart=/usr/bin/python3 $script_path" >> $service_file
echo "Restart=always" >> $service_file
echo "" >> $service_file
echo "[Install]" >> $service_file
echo "WantedBy=default.target" >> $service_file

chmod +x $script_path
chmod 644 $service_file

systemctl daemon-reload
sudo systemctl start $service_name
systemctl start $service_name
systemctl enable $service_name
systemctl status $service_name
