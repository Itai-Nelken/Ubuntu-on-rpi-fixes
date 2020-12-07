#!/bin/bash

#check system info to determine if script can run
echo "checking system info to determine if script can run"
./sys-info-check.sh 

#update
sudo apt update

#add armhf architecture (multiarch)
sudo dpkg --add-architecture armhf
sudo apt update
sudo apt upgrade -y


#check if you are running Ubuntu 20.04 or 20.10
if [[ $(lsb_release -rs) == "20.04" ]]; then 

       echo "you are running Ubuntu 20.04"
	   echo "installing dependencies for 20.04"
	   sleep 2
	   sudo apt install libc6:armhf  libx11-6:armhf  libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf osspd:armhf pulseaudio:armhf libjpeg62:armhf libudev1:armhf libgl1-mesa-dev:armhf libsnappy1v5:armhf libx11-dev:armhf libsmpeg0:armhf libboost-filesystem1.67.0:armhf libboost-program-options1.67.0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libmyguiengine3debian1v5:armhf libboost-iostreams1.67.0:armhf  libsdl2-mixer-2.0-0:armhf -y || error "failed to install dependencies! are you connected to the internet?"
       
elif [[ $(lsb_release -rs) == "20.10" ]]; then
	
      
     echo "you are running Ubuntu 20.10"
	 echo "installing dependencies for 20.10"
	 sleep 2
	 sudo apt install libc6:armhf  libx11-6:armhf  libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf osspd:armhf pulseaudio:armhf libjpeg62:armhf libudev1:armhf libgl1-mesa-dev:armhf libsnappy1v5:armhf libx11-dev:armhf libsmpeg0:armhf libboost-filesystem1.71.0:armhf libboost-program-options1.71.0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libmyguiengine3debian1v5:armhf libboost-iostreams1.71.0:armhf  libsdl2-mixer-2.0-0:armhf || error "failed to install dependencies! are you connected to the internet?"

else 
	error "you are not running Ubuntu 20.04 or 20.10, this script is only intended for 20.04 or 20.10"

fi

#compile and install box86
cd ~
git clone https://github.com/ptitSeb/box86 || error "failed to download box86 repo!"
cd box86 || error "failed to enter box86 directory!"
mkdir build; cd build
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo || error "cmake failed!"
make -j24 || error "make failed!"
sudo make install || error "sudo make install failed!"
sudo systemctl restart systemd-binfmt

