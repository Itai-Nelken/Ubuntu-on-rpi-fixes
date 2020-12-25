# Ubuntu on Raspberry Pi fixes (and more)
<b>apps, fixes, and optimizations I did on my rpi running Ubuntu desktop.</b><br>
<br>
<img src="https://raw.githubusercontent.com/Itai-Nelken/Ubuntu-on-rpi-fixes/main/screenshots/20.10.png" alt="20.10.png">

## Flash Ubuntu
1) Download Ubuntu from here: [https://ubuntu.com/download/raspberry-pi](https://ubuntu.com/download/raspberry-pi)<br>
> <b>NOTE:</b> Only Ubuntu 20.10 has a version with a desktop, to use other Versions, download Ubuntu server and use [Desktopify](https://github.com/wimpysworld/desktopify) to install the Ubuntu desktop on it.
2) flash the file to a SD card (or SSD/USB stick if you want to USB boot) with [etcher](https://www.balena.io/etcher/) or [rpi imager](https://www.raspberrypi.org/software/).

>- a few notes:<br>1) USB booting needs the september 2020 version of the rpi bootloader or newer.<br>2) you can use any flashing software you want, I tested etcher and rpi imager and know they work. you can also use [USBImager](https://gitlab.com/bztsrc/usbimager).

## Install pi-apps

pi-apps is a raspberry pi app store for open source projects,.<br>it is made for 32bit systems, but has a lot of apps for 64bit systems.
links: [pi-apps github](https://github.com/botspot/pi-apps)
follow the instructions to install from the readme in the [pi-apps github](https://github.com/botspot/pi-apps), I added them bellow as well:
```sh
git clone https://github.com/botspot/pi-apps.git
~/pi-apps/install
```
>**NOTE:**<br>no modifications needed, but some apps will malfunction or not install correctly

## fix choppy audio <br>

Ubuntu Desktop on the RPi has a choppy audio problem. it usually starts to happen a few hours after installation.
**fix:**
1) open terminal and type:
```sh
sudo gedit /etc/pulse/default.pa 
```
the text editor will open, if you get a error similar to `gedit: command not found`, change `gedit` with your text editor or if you are not sure `nano` (nano is a terminal based text editor).

2) find this line: `load-module module-udev-detect` and add to it's end this: `tsched=0` so it looks like this at the end:
```
load-module module-udev-detect tsched=0
```
[(source)](https://www.raspberrypi.org/forums/viewtopic.php?f=131&t=289126&p=1769729#p1769729)

## Fix missing codecs for Videos app (GNOME videos, totem = same app) <br>

The GNOME Videos (also known as Totem) has a problem that makes it say its missing codecs,<br>I found out how to fix mp4 video (you can watch frm the built in channels and mp4 video files) but performance is really bad.<br>I recommend to use VLC (`sudo apt install vlc` in terminal to install) or MPV (`sudo apt install mpv` in terminal to install), they peerform much better.

### fixes:
<b>full error:</b> `the playback of this movie requires a H.264 (Main Profile) decoder which is not installed`<br>

<b>fix:</b><br>
```sh
sudo apt install gstreamer1.0-libav ffmpeg
```
<b>IF YOU KNOW ANY OTHER FIXES FOR MISSING CODECS IN THE VIDEOS APP, [OPEN A ISSUE](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new/) AND TELL ME HOW TO INSTALL IT, SO I CAN ADD IT.</b>

## Install [box86](https://ptitseb.github.io/box86/)
Linux Userspace x86 Emulator with a twist
Box86 lets you run x86 Linux programs (such as games) on non-x86 Linux, like ARM (host system needs to be 32bit little-endian).
> You NEED a 32-bit subsystem to run and build Box86. Box86 is useless on 64-bit only systems. Also, you NEED a 32-bit toolchain to build Box86. A toolchain that only support 64-bit will not compile Box86, and you'll get errors (typically on aarch64, you get "-marm" not recognized, and you'll need a multiarch or chroot environnement).

### installation instructions (for ubuntu 64bit, using multiarch):
<b>add armhf architecture (multiarch):</b><br>
open terminal and type:
```sh
sudo dpkg --add-architecture armhf
sudo apt update
```
<b>Install dependencies:</b><br>
<br>
<b>for Ubuntu 20.04:</b>
```sh
sudo apt install libc6:armhf  libx11-6:armhf  libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf osspd:armhf pulseaudio:armhf libjpeg62:armhf libudev1:armhf libgl1-mesa-dev:armhf libsnappy1v5:armhf libx11-dev:armhf libsmpeg0:armhf libboost-filesystem1.67.0:armhf libboost-program-options1.67.0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libmyguiengine3debian1v5:armhf libboost-iostreams1.67.0:armhf  libsdl2-mixer-2.0-0:armhf
```

<b>For Ubuntu 20.10:</b>
```sh
sudo apt install libc6:armhf  libx11-6:armhf  libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf osspd:armhf pulseaudio:armhf libjpeg62:armhf libudev1:armhf libgl1-mesa-dev:armhf libsnappy1v5:armhf libx11-dev:armhf libsmpeg0:armhf libboost-filesystem1.71.0:armhf libboost-program-options1.71.0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libmyguiengine3debian1v5:armhf libboost-iostreams1.71.0:armhf  libsdl2-mixer-2.0-0:armhf
```
<b>Compile and install box86:</b>

open terminal and type:
```sh
git clone https://github.com/ptitSeb/box86
cd box86
sudo apt update
sudo apt install gcc-arm-linux-gnueabihf
mkdir build; cd build; cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo; make -j4
sudo make install
sudo systemctl restart systemd-binfmt
```
**update box86:**<br> use the box86 updater (installation instructions bellow) or follow the manual instructions (recompile):<br>
open terminal and type:
```
cd ~/box86
git pull
cd build; cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo; make -j4
sudo make install
sudo systemctl restart systemd-binfmt
```

### Install box86 updater

box86 updater keeps your box86 installation updated on a weekly basis.
it avoids having to compile box86 on your Pi, thanks to Pale's automated weekily builds.
### installation instructions
Go to the [box86 updater github](https://github.com/Botspot/box86-updater)<br>
and follow the instructions there. I added them bellow as well:
  
<b>Download:</b>
```sh
git clone https://github.com/Botspot/box86-updater
```
<b>Configure:</b>
```sh
~/box86-updater/configure
```
## Install and configure GNOME software

The Ubuntu software app store is actually only the snap store, so to have more apps from flatpak and the Ubuntu archive
use gnome software (if you prefer a graphical "app store"):

<b>Install GNOME software:</b>
```sh
sudo apt install gnome-software
```
<b>add snap and flatpak:</b>
```sh
#install the snap daemon, it probably already installed, but just in case
sudo apt install snapd

#install flatpak
sudo apt install flatpak

#install the snap and flatpak plugins for GNOME software
sudo apt install gnome-software-plugin-flatpak gnome-software-plugin-snap
```

## Install Zoom
Zoom cloud meetings Linux x86 (32bit) client running with box86
### installation instructions
1) make sure you have box86 installed and updated, if not scroll up and follow the instructions to install it.

2) Install dependencies:
```sh
sudo apt install libxcb-shape0:armhf libxcb-randr0:armhf libxcb-image:armhf libxcb-image0:armhf libxcb-xtest0:armhf libxcb-keysyms1:armhf libdbus-1-3:armhf
```
3) Download Zoom:
as of writing, the [zoom website download](https://zoom.us/client/latest/zoom_i686.tar.xz) is down. you can download a copy I have from [here](https://github.com/Itai-Nelken/Pi-Assistant/raw/main/apps/zoom/files/zoom.tar.xz), save it to your `Downloads` folder.

4) open terminal and type:
```sh
cd ~/Downloads
tar -xf zoom.tar.xz /home/$USER
```
5) create launcher script:<br>
download my [launcher script](https://github.com/Itai-Nelken/Pi-Assistant/blob/main/apps/zoom/startzoom.sh) with this command
```sh
wget https://raw.githubusercontent.com/Itai-Nelken/Pi-Assistant/main/apps/zoom/startzoom.sh
```
and move it to the zoom folder with this command:
```sh
mv startzoom.sh ~/zoom
```
if you want to create your own script, copy the script bellow to a new file and name it `startzoom.sh` (you can change whatever you want, but only if you know what you are doing):
```
#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}


if [ -d ~/box86 ]; then

  echo "box86 installed..."

else
  echo "Box86 missing, please install"
  exit 1 

fi

	
#go to zoom directory (~/zoom)
cd ~/zoom
echo "$(tput setaf 3)close this window to exit zoom$(tput sgr 0)"
sleep 2
echo "$(tput setaf 2)starting zoom, ignore any errors...$(tput sgr 0)"
sleep 1
#start zoom with box86
pulseaudio --start
box86 zoom || error "can't start zoom!"
echo "$(tput setaf 2)exiting in 5 seconds:($(tput sgr 0)"
sleep 5
```

6) create desktop shortcut:<br>
Download my [desktop shortcut file](https://github.com/Itai-Nelken/Pi-Assistant/blob/main/apps/zoom/files/zoom.desktop) with this command:
```sh
wget https://raw.githubusercontent.com/Itai-Nelken/Ubuntu-on-rpi-fixes/main/files/zoom.desktop
```
and move it to /usr/share/applications with this command:
```sh
sudo mv zoom.desktop /usr/share/applications
```
you'll be asked for your password.

if you prefer to create your own shortcut, copy the text bellow to a new file and call it `zoom.desktop` (you can change whatever you want, but only if you know what you are doing):
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Zoom
Comment=Linux x86 version of Zoom cloud meetings running using Box86
Exec=~/zoom/startzoom.sh
Icon=~/Pi-Assistant/icons/zoom-icon.png
Path=~/Pi-Assistant/apps/zoom
Terminal=true
StartupNotify=false
Categories=Network;
```
><b>NOTE:</b><br> you can call the file whatever you want, but remember to add the `.desktop` file extension

## Install vdesktop
1) go to the [vdesktop github](https://github.com/botspot/vdesktop) and follow the download instructions, I added them bellow as well:
```sh
git clone https://github.com/Botspot/vdesktop
```
before running there are a few steps to follow if you plan to boot OS's to Desktop as well and not only CLI:

1) <b>Compile VirGL:</b><br>
 -`sudo apt purge libepoxy0:armhf; sudo apt purge libepoxy-dev:armhf` <br>
 -`sudo apt install -y libepoxy0; sudo apt install libepoxy-dev`<br>
 -`sudo apt install -y meson libdrm-dev cmake libgbm-dev`<br>
 -`git clone https://gitlab.freedesktop.org/virgl/virglrenderer.git`<br>
 -`cd virglrenderer`<br>
 -`meson --prefix=/usr/local -Dbuildtype=release build`<br>
 -`cd build`<br>
 -`ninja install`<br>
 -`cd ~ && sudo -E ldconfig`<br>
 

2) <b>run vdesktop:</b>
use the instructions in the [vdesktop github](https://github.com/botspot/vdesktop) to use it, I'm using a usb stick flashed with [TwisterOS](https://twisteros.com), and I want to launch the desktop, so to launch vdesktop, I use `sudo ~/vdesktop/vdesktop /dev/sdb gui`.
follow the prompts to install the dependencies. if you get errors, and vdesktop exits, type in terminal this:
```sh
sudo apt install -f
```
(to fix any broken packages)
and run vdesktop again.

## Install RPi Imager

0) you could always install the snap or flatpak version, but this is to install the real official version and is more up to date (not that it matters that much, but this version will perform better)

1) go to this [link](http://archive.raspberrypi.org/debian/pool/main/r/rpi-imager/) and scroll down untill you see `rpi-imager_1.4_arm64.deb` (as of writing, v1.4 is the newest version, if there is a newer version, than click on it of course (this version won't be there)) now click on it to download it. 
><b>NOTE:</b><br>It's completley safe to download from this site, it's the rpi-archive. every time you run `sudo apt install <something>` on RPiOS, apt downloads the `.deb` file from this site, and than installs it (on Ubuntu, apt downloads from [here](https://packages.ubuntu.com)).

2) once finished Downloading open terminal in the folder where you downloaded the file to (unless you changed it it will be the Dowloads folder in your home folder) and type the following in:
```sh
sudo apt install --fix-broken the-deb-file-name.deb
```
but replace `the-deb-file-name.deb` with the name of the file you downloaded, for example this is how it will look as of writing this:
```sh
sudo apt install --fix-broken rpi-imager_1.4_arm64.deb
```
><b>NOTE:</b>
>you can also install by double clicking the `.deb` file. it will open in the package manager (in Ubuntu `software install`) and you simply have to click `Install`, but I think it's better to install from Terminal, personal preference. do whatever method you prefer.


## Experimental scripts

the experimental scripts located in the scripts folder in this repo ask you if you want to install each app, if yes they install it. they will stay experimental untill they can also fix stuff (like the choppy audio problem). I plan on adding a GUI in the future.<br>
<b>To run:</b><br>
open terminal and type:
```
git clone https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes.git; cd Ubuntu-on-rpi-fixes; sudo chmod +x main.sh; ./main.sh
```

## Contribute
- if you have something you want to be added, open a issue [here](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new/choose) and use the `feature request` template
- if you found something that doesn't work, [open a issue](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new/choose) and use the `bug report` template. if you have a fix , add it.
- anything else? use the `open a blank issue` option when [opening a issue](https://github.com/Itai-Nelken/Ubuntu-on-rpi-fixes/issues/new/choose).
