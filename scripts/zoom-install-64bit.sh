#!/bin/bash

#check system info to determine if script can run
echo "checking system info to determine if script can run"
./sys-info-test.sh

echo "checking if box86 is installed..."
#check if box86 is installed
if [ -d ~/box86 ];then
  read -p "box86 is already installed. Do you want to reinstall (recommended) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "box86 will be reinstalled"; ./install-box86-ubuntu-64bit.sh ;;
  n|N ) echo "box86 won't be reinstalled" && exit   ;;
  * ) echo "invalid";;
esac


echo "installing dependencies"
#install dependencies
sudo apt install libxcb-shape0:armhf libxcb-randr0:armhf libxcb-image:armhf libxcb-image0:armhf libxcb-xtest0:armhf libxcb-keysyms1:armhf libdbus-1-3:armhf -y

echo "downloading zoom..."
#download zoom
wget https://github.com/Itai-Nelken/Pi-Assistant/raw/main/apps/zoom/files/zoom.tar.xz
tar -xf zoom.tar.xz /home/$USER
rm zoom.tar.xz

echo "creating launcher script"
#download my launcher script
wget -q wget https://github.com/Itai-Nelken/Pi-Assistant/blob/main/apps/zoom/startzoom.sh
mv startzoom.sh ~/zoom

echo "creating desktop shortcut, enter your password when asked"
#download my desktop shortcut
wget -q wget https://github.com/Itai-Nelken/Pi-Assistant/blob/main/apps/zoom/files/zoom.desktop
sudo mv zoom.desktop /usr/share/applications

sleep 3
echo "




"
echo "script finished"
