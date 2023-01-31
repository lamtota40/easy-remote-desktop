#!/bin/bash  
  
echo "Choose menu answer with number!"  
echo "1. SSH server(Port 22)"
echo "2. VNC server (Port 5901)"
echo "3. XRDP server (Port 3389)"
echo "4. Chrome Remote Desktop (Port 3478)"
echo "5. TeamViewer (Port 5938)"
echo "6. No Machine (Port 4000)"
echo "7. Ngrok v3 stable"
echo "8. Fix apt update error/dpkg lock"
echo "9. Unistal"
echo "0. Quit"
read -p "choose [1-6]:" Answer  
case $Answer in  
    Yes|yes|y|Y)  
        echo "That's amazing."  
        echo  
        ;;  
    No|no|N|n)  
        echo "It's easy. Let's start learning from javatpoint."  
        ;;  
esac


sudo apt-get install openssh-server -y
sudo systemctl enable ssh --now
sudo systemctl start ssh
sudo systemctl status ssh

check if install
sudo apt install xrdp -y
sudo usermod -a -G ssl-cert xrdp

check if install
sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install /tmp/chrome-remote-desktop_current_amd64.deb -y
echo "and now open https://remotedesktop.google.com/access"

sudo wget https://www.nomachine.com/free/linux/64/deb -O nomachine.deb -P /tmp
sudo apt install /tmp/nomachine.deb -y

sudo wget download.teamviewer.com/download/linux/teamviewer_amd64.deb -P /tmp
sudo apt install /tmp/teamviewer_amd64.deb -y
sudo teamviewer passwd pas123
sudo teamviewer info

sudo teamviewer license accept
sudo chmod 777 /opt/teamviewer/config/global.conf
sudo teamviewer daemon restart
sudo teamviewer setup
