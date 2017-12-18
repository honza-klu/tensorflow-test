#!/bin/bash
echo "INIT STARTED"

#instal application as ordinary user to his home directory
sudo -H -u ubuntu /bin/bash << 'EOF'
cd ~

#get sources
git clone https://github.com/honza-klu/tensorflow-test
cd tensorflow-test

#install
. ./linux_install.sh
EOF

uptime
echo "INIT COMPLETE"