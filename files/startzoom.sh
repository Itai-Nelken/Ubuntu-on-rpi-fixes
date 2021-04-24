#!/bin/bash
function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

if ! command -v box86 >/dev/null ; then
  error "Box86 missing! please install"
else
  echo "box86 is installed..."
fi

if [ -d ~/zoom ]; then
  echo "zoom folder exists..."
else
  error "zoom folder is missing! please reinstall zoom."
fi

#go to zoom directory (~/zoom)
cd $HOME/zoom || error 'Failed to change directory to ~/zoom!'
echo "$(tput setaf 3)close this window to exit zoom$(tput sgr 0)"
sleep 1
echo "$(tput setaf 2)starting zoom...$(tput sgr 0)"
sleep 1
#start zoom with box86
#pulseaudio --start
box86 zoom || error "can't start zoom!"
echo "$(tput setaf 2)exiting in 5 seconds.$(tput sgr 0)"
sleep 5
exit
