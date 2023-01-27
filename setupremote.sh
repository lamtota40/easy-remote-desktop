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
sudo teamviewer license accept
sudo chmod 777 /opt/teamviewer/config/global.conf
sudo teamviewer daemon restart
sudo teamviewer setup
sudo teamviewer passwd pas123
sudo teamviewer info
