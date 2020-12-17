#!/bin/bash

#disclaimer
echo "this script can't uninstall anything it installs, proceed at you own risk"
echo "press + to continue"
count=0
while : ; do
read -n 1 k <&1
if [[ $k = + ]] ; then
printf "\ncontinuing\n"
break
else
((count=$count+1))
printf "\nWrong key pressed for $count times\n"
echo "Press + to continue"
fi
done



#mark all aditional scripts as executables
echo "enter your password when or if asked to"
sudo chmod +x install-box86-ubuntu-64bit.sh
sudo chmod +x zoom-install-64bit.sh
sudo chmod +x vdesktop-install-64bit.sh
sudo chmod +x sys-info-check.sh

echo "updating..."
sudo apt update

#install pi-apps
read -p "Do you want to install pi-apps (raspberry pi app store for open source projects) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "pi-apps will be installed" && git clone https://github.com/botspot/pi-apps.git && ~/pi-apps/install ;;
  n|N ) echo "pi-apps won't be installed"   ;;
  * ) echo "invalid";;
esac

sleep 2
clear

#install box86
read -p "Do you want to install box86 (Linux Userspace x86 Emulator with a twist) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "box86 will be installed" && ./install-box86-ubuntu-64bit.sh ;;
  n|N ) echo "box86 won't be installed"   ;;
  * ) echo "invalid";;
esac

sleep 2
clear

#install box86 updater
read -p "Do you want to install box86 updater (automated box86 updater, set it and forget it.) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "box86 updater will be installed" && git clone https://github.com/Botspot/box86-updater && ~/box86-updater/configure ;;
  n|N ) echo "box86 updater won't be installed"   ;;
  * ) echo "invalid";;
esac

sleep 2
clear

#install and configure GNOME software
read -p "Do you want to install and configure GNOME software (better than Ubuntu software, same gui but has flatpak, snap, and apt packages) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Gnome software will be installed and configured" && sudo apt install gnome-software -y && sudo apt install snapd flatpak gnome-software-plugin-flatpak gnome-software-plugin-snap -y ;;
  n|N ) echo "GNOME software won't be installed and configured"   ;;
  * ) echo "invalid";;
esac

sleep 2
clear

#install zoom
read -p "Do you want to install Zoom (zoom x86 client running with box86, box86 required) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Zoom will be installed" && ./zoom-install-64bit.sh ;;
  n|N ) echo "Zoom won't be installed"   ;;
  * ) echo "invalid";;
esac

sleep 2
clear

#install vdesktop
read -p "Do you want to install vdesktop (run OS's inside a "VM", doesn't work with any OS) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "vdesktop will be installed" && ./vdesktop-install-64bit.sh ;;
  n|N ) echo "vdesktop won't be installed"   ;;
  * ) echo "invalid";;
esac

sleep 2
clear

#install rpi-imager
read -p "Do you want to install rpi-imager (from official repo) (y/n)?" choice
case "$choice" in 
  y|Y ) echo "rpi-imager will be installed" && wget http://archive.raspberrypi.org/debian/pool/main/r/rpi-imager/rpi-imager_1.4_arm64.deb && sudo apt install --fix-broken rpi-imager_1.4_arm64.deb ;;
  n|N ) echo "rpi-imager won't be installed"   ;;
  * ) echo "invalid";;
esac
