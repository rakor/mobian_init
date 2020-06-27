sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt -y install openssh-server ufw vim iputils-ping iproute2
sudo ufw enable
echo "New password for mobian"
sudo passwd mobian
echo "New password for root"
sudo passwd root
ip add show dev wlan0 | sed -n -e "s/^[[:space:]]\+inet \([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).\+\$/Your IP is: \1/p"
mkdir -p /home/mobian/.local/share/squeekboard/keyboards
wget https://source.puri.sm/btantau/squeekboard/-/blob/btantau-master-patch-76686/data/keyboards/terminal.yaml -O /home/mobian/.local/share/squeekboard/keyboards/terminal.yaml
