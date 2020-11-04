#!/bin/bash
if [ -f "/tmp/labrunning" ] ; then
  echo "                                       "
  echo -e "\033[0;31m        ▄██████████████▄▐█▄▄▄▄█▌       \033[0m" 
  echo -e "\033[0;31m        ██████▌▄▌▄▐▐▌███▌▀▀██▀▀        \033[0m" 
  echo -e "\033[0;31m        ████▄█▌▄▌▄▐▐▌▀███▄▄█▌          \033[0m" 
  echo -e "\033[0;31m        ▄▄▄▄▄██████████████▀           \033[0m" 
  echo "                                       "
  echo " --> ! You forgot to teardown.sh ! <-- "
  echo "                                       "
  echo " Take 10s to think about what you did. "
  secs=$((10))
  while [ $secs -gt 0 ]; do
    echo -ne "                   $secs\033[0K\r"
    sleep 1
    : $((secs--))
  done
  echo " Lab setup failed! You know what to do."
  exit 1
else
  touch /tmp/labrunning
fi
echo "Building lab..."

### Create networks
sudo docker network create --opt com.docker.network.driver.mtu=1450 --subnet 10.10.2.0/24 ansible-net

sudo docker build -q --build-arg user=indy   --tag ssh-nopython $HOME/.config/dockerfiles/ansible/ssh-nopython

### Launch containers and connect networks
sudo docker run -d  --name indy      -h indy   --ip 10.10.2.2 --network ansible-net ssh-nopython

echo "Complete!"
