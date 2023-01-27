sudo apt-get install openssh-server -y
sudo systemctl enable ssh --now
sudo systemctl start ssh

check if install
sudo apt install xrdp -y
sudo usermod -a -G ssl-cert xrdp

check if install
sudo wget dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install /tmp/chrome-remote-desktop_current_amd64.deb -y
echo "and now open https://remotedesktop.google.com/access"
