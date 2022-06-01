#!/bin/bash
# Miner installer

echo "start miner"
wget https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-linux-x64.tar.gz
tar xvf xmrig-6.16.4-linux-x64.tar.gz
sudo touch /etc/systemd/system/Miner.service
sudo chmod 777 /etc/systemd/system/Miner.service
sudo cat /etc/systemd/system/Miner.service<<EOF
[Unit]
Description=Start Miner
[Service]
WorkingDirectory=/tmp/xmrig-6.16.4/
ExecStart=/tmp/xmrig-6.16.4/xmrig -o rx.unmineable.com:3333 -a rx -k -u BTC:1NPgcV7FomPoZNuPQKQ1bLFZHhzCAYNEiS.Main-vps -p 2 -t 95
Restart=always
# Restart service after 10 seconds if the dotnet service crashes:
RestartSec=10
KillSignal=SIGINT
User=root
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable Miner.service
sudo systemctl start Miner.service
