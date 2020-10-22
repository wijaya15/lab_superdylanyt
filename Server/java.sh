#!/bin/bash
clear
cd $HOME
jdk=openjdk-9-jdk.deb
jre=openjdk-9-jre.deb
echo " [+] Downloading the .deb files "
  case `dpkg --print-architecture` in
	aarch64)
		archname="aarch64"; jre1="aarch64" ;;
	arm64)
		archname="aarch64"; jre1="aarch64" ;;
	armhf)
		archname="arm"; jre1="arm" ;;
	armv7l)
		archname="arm"; jre1="arm" ;;
	arm)
		archname="arm"; jre1="arm" ;;
	*)
		echo " [+] unknown architecture"; exit 1 ;;
   esac
   wget -c --quiet --show-progress "https://archive.org/download/openjdk-9-jre-headless_9.2017.8.20-1_x86_64/openjdk-9-jdk-headless_9.2017.8.20-1_$archname.deb" -O $jdk
   wget -c --quiet --show-progress "https://archive.org/download/openjdk-9-jre-headless_9.2017.8.20-1_x86_64/openjdk-9-jre-headless_9.2017.8.20-1_$jre1.deb" -O $jre
   
   echo " [+] Installing Java... "
   apt update -y && apt upgrade -y
   apt install -y ./$jdk
   apt install -y ./$jre1

   echo " [+] Removing the .deb files to have more space. "
   cd $HOME
   rm -rf $jdk
   rm -rf $jre1

   echo " [+] Installation completed "
   rm -rf java.sh
   
