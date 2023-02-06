#!/bin/bash  
  
echo "Choose menu answer with number!"  
echo "1. SSH server(Port 22)"
echo "2. VNC server (Port 5901)"
echo "3. XRDP server (Port 3389)"
echo "4. Chrome Remote Desktop (Port 3478)"
echo "5. TeamViewer (Port 5938)"
echo "6. No Machine (Port 4000)"
echo "7. Ngrok v3"
echo "8. Firewall setup"
echo "9. Fix apt update error/dpkg lock"
echo "10. Unistal"
echo "0. Quit"
read "choose [0-10]:" num  
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

sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install /tmp/chrome-remote-desktop_current_amd64.deb -y
echo "and now open https://remotedesktop.google.com/access"

sudo wget https://www.nomachine.com/free/linux/64/deb -O nomachine.deb -P /tmp
sudo apt install /tmp/nomachine.deb -y

sudo wget download.teamviewer.com/download/linux/teamviewer_amd64.deb -P /tmp
sudo apt install /tmp/teamviewer_amd64.deb -y
sudo teamviewer passwd pas123
sudo teamviewer info
