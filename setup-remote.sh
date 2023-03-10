#!/bin/bash  
echo "==================================="  
echo " Author: github.com/lamtota40
echo " Choose menu answer with number !"  
echo "==================================="
echo "1. SSH server(Port 22)"
echo "2. VNC server (Port 5901)"
echo "3. XRDP server (Port 3389)"
echo "4. Chrome Remote Desktop only 64bit (STUN)"
echo "5. TeamViewer (Port 5938)"
echo "6. No Machine (Port 4000)"
echo "7. Ngrok v3"
echo "8. Firewall setup"
echo "9. Fix apt update error/dpkg lock"
echo "0. Quit"
echo "==================================="
read -p "choose [0-9]:" num
     until [[ -z "$num" || "$num" =~ ^[0-9]$ ]]; do
	echo "$num: invalid selection."
	read -p "choose [0-9]: " num
     done

case $num in  
    "1")  
        sudo apt-get install openssh-server -y
	sudo systemctl enable ssh --now
	sudo systemctl restart ssh
        ;;  
    "2")  
        sudo apt install xrdp -y
	adduser xrdp ssl-cert
	sudo systemctl restart xrdp
        ;;
    "0")  
        exit 1
        ;;
esac


sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install /tmp/chrome-remote-desktop_current_amd64.deb -y
echo "and now open https://remotedesktop.google.com/access"

sudo wget -O nomachine32.deb https://www.nomachine.com/free/linux/32/deb
sudo wget -O nomachine64.deb https://www.nomachine.com/free/linux/64/deb
sudo apt install -f /tmp/nomachine.deb

sudo wget download.teamviewer.com/download/linux/teamviewer_i386.deb -P /tmp
sudo wget download.teamviewer.com/download/linux/teamviewer_amd64.deb -P /tmp
sudo apt install /tmp/teamviewer_amd64.deb -y
sudo teamviewer passwd pas12345
sudo teamviewer info | grep "TeamViewer ID"

#sudo apt install tightvncserver -y
sudo apt install tigervnc-standalone-server -y
vncserver
##pass
##pass
#n

vncserver -kill :1
nano ~/.vnc/xstartup
####

chmod +x ~/.vnc/xstartup
vncserver -localhost no :1
sudo nano /etc/systemd/system/vncserver@.service
####
sudo systemctl enable vncserver@1.service

