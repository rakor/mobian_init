sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y install openssh-server ufw vim iputils-ping iproute2
sudo ufw enable
echo "New password for mobian (remember to only use numbers!)"
sudo passwd mobian
echo "New password for root"
sudo passwd root
ip add show dev wlan0 | sed -n -e "s/^[[:space:]]\+inet \([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).\+\$/Your IP is: \1/p"
mkdir -p /home/mobian/.local/share/squeekboard/keyboards
wget https://source.puri.sm/btantau/squeekboard/-/raw/btantau-master-patch-76686/data/keyboards/terminal.yaml -O /home/mobian/.local/share/squeekboard/keyboards/terminal.yaml

DEVICE=`mount | sed -n -e "s/^\(\S\+\)p2 on \/ .*$/\1/p"`

read -p "Do you want to extend your root partition? (y/n) " yn
case $yn in
    [Yy]* ) echo "Use 'resize' to resize the partition to the desired size. You can also create a swap as partition 3 if you want." 
            sudo cfdisk $DEVICE
            sudo resize2fs ${DEVICE}p2
            break;;
    [nN]* ) break;;
    * ) echo "Please anser y or n ";;
esac

read -p "Have you created a swap as ${DEVICE}p3 and want to activate? (y/n) " yn
case $yn in
    [Yy]* ) sudo mkswap ${DEVICE}p3
            sudo echo "${DEVICE}p3  none    swap    sw  0   0" >> /etc/fstab
            break;;
    [nN]* ) break;;
    * ) echo "Please anser y or n ";;
esac
