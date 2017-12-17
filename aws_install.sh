#/bin/bash
su ubuntu
cd ~/

#get sources
git clone https://github.com/honza-klu/tensorflow-test
cd tensorflow-test

#install
. ./linux_install.sh

uptime
echo "INIT COMPLETE"