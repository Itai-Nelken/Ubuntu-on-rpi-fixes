#check if CPU is ARM 64bit
echo "checking if your CPU architecture is ARM 64bit"
sleep 1
ARCH=$(uname -m)
if [ "${ARCH}" != "aarch64" ]; then
  echo "This script is only intended to run on ARM 64bit devices."
  echo "exiting in 10 seconds"
  sleep 10
  exit
else
  echo "CPU architecture is ARM 64bit☑️"; sleep 2
fi



echo "checking if your OS is Ubuntu"
sleep 1
IS_UBUNTU=$(lsb_release -is)
if [ "${IS_UBUNTU}" != "Ubuntu" ]; then
  echo "This script is made for Ubuntu."
  read -p "do you want to proceed anyway (y/n)?" choice
  case "$choice" in 
    y|Y ) echo "proceeding anyway"; sleep 1 ;;    
	n|N ) echo "exiting in 2 seconds"; sleep 2; exit   ;;
    * ) echo "invalid";;
  esac 
else
 echo "OS is Ubuntu☑️"; sleep 2
fi

#check if you are running Ubuntu 20.04 or 20.10
if [[ $(lsb_release -rs) == "20.04" ]]; then 

        echo "you are running Ubuntu 20.04"
	sleep 2
       
elif [[ $(lsb_release -rs) == "20.10" ]]; then
	
	 echo "you are running Ubuntu 20.10"
	 sleep 2

else 
	echo "you are not running Ubuntu 20.04 or 20.10, this script is only intended for 20.04 or 20.10"
fi
