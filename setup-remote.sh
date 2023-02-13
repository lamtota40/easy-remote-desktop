#!/bin/bash  
echo "================================"  
echo "Choose menu answer with number !"  
echo "================================"
echo "1. SSH server(Port 22)"
echo "2. VNC server (Port 5901)"
echo "3. XRDP server (Port 3389)"
echo "4. Chrome Remote Desktop (STUN)"
echo "5. TeamViewer (Port 5938)"
echo "6. No Machine (Port 4000)"
echo "7. Ngrok v3"
echo "8. Firewall setup"
echo "9. Fix apt update error/dpkg lock"
echo "0. Quit"
read -p "choose [0-9]:" num
     until [[ -z "$num" || "$num" =~ ^[0-9]$ ]]; do
	echo "$num: invalid selection."
	read -p "choose [0-9]: " num
     done

case $num in  
    "1")  
        echo "That's amazing."
        ;;  
    "2")  
        echo "It's easy. Let's start learning from javatpoint."  
        ;;  
esac


sudo apt-get install openssh-server -y
sudo systemctl enable ssh --now
sudo systemctl start ssh

sudo apt install xrdp -y
sudo systemctl enable xrdp.service
sudo systemctl start xrdp.service
sudo usermod -a -G ssl-cert xrdp
adduser xrdp ssl-cert
sudo systemctl restart xrdb

sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install /tmp/chrome-remote-desktop_current_amd64.deb -y
echo "and now open https://remotedesktop.google.com/access"

sudo wget https://www.nomachine.com/free/linux/64/deb -O nomachine.deb -P /tmp
sudo apt install /tmp/nomachine.deb -y

sudo wget download.teamviewer.com/download/linux/teamviewer_amd64.deb -P /tmp
sudo apt install /tmp/teamviewer_amd64.deb -y
sudo teamviewer passwd pas12345
sudo teamviewer info | grep "TeamViewer ID"
