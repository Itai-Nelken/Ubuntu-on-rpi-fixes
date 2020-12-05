#!/bin/bash

echo "cloning vdesktop repo..."
git clone https://github.com/Botspot/vdesktop

echo "



"

echo "compiling VirGL (required for running OS's with desktop)"
sudo apt purge libepoxy0:armhf libepoxy-dev:armhf -y
sudo apt install -y libepoxy0 libepoxy-dev
sudo apt install -y meson libdrm-dev cmake libgbm-dev
git clone https://gitlab.freedesktop.org/virgl/virglrenderer.git
cd virglrenderer
meson --prefix=/usr/local -Dbuildtype=release build
cd build
ninja install
cd ~ && sudo -E ldconfig

sudo apt install sed
echo "replacing sudo -u pi with sudo -u $USER in ~/vdesktop/vdesktop"
cd ~/vdesktop
sed -i 's/sudo -u pi/sudo -u $USER/g' vdesktop
cd ~/Downloads/Ubuntu-on-rpi-fixes/scripts

echo "










"

echo "to run vdesktop, type in terminal ~/vdesktop/vdesktop"
echo "type in terminal sudo apt install -f if you get any errors"
echo  "

"
echo "press c to continue"
count=0
while : ; do
read -n 1 k <&1
if [[ $k = c ]] ; then
printf "\ncontinuing\n"
break
else
((count=$count+1))
printf "\nWrong key pressed for $count times\n"
echo "Press 'c' to continue"
fi
done