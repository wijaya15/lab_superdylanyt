# lab_superdylanyt

if [ -e  /usr/lib/sudo ];then
  if [ -e /usr/bin/apt-get ];then
    if [ ! -e /bin/bash ];then
       sudo apt-get update -y
       sudo apt-get upgrade -y
       sudo apt-get install wget -y
       wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
       chmod +x lab_superdylanyt.sh
       mv lab_superdylanyt.sh /bin
       clear
     fi
  fi
else
  if [ -d /usr/bin ];then
    if [ -e /usr/bin/apt-get ];then
      if [ ! -e /bin/bash ];then
       apt-get update -y
       apt-get upgrade -y
       apt-get install wget -y
       wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
       chmod +x lab_superdylanyt.sh
       mv lab_superdylanyt.sh /bin
       clear
      fi
    fi
  fi
fi
if [ -d /data/data/com.termux/files/usr/bin ]; then
  if [ ! -e /data/data/com.termux/files/usr/bin/bash ];then
    pkg update -y
    pkg upgrade -y
    pkg install wget -y
    wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
    chmod +x lab_superdylanyt.sh
    mv lab_superdylanyt.sh $PREFIX/bin
    clear
  fi
fi
if [ -e  /usr/bin/apk ];then
  if [ ! -e /usr/bin ];then
     apk update 
     apk upgrade 
     apk add bash 
     apk add wget 
     wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
     chmod +x lab_superdylanyt.sh
     mv lab_superdylanyt.sh /bin
     clear    
   fi
fi
if [ -e  /usr/bin/apk ];then
  if [ ! -e /usr/bin ];then
     apk update 
     apk upgrade 
     apk add bash 
     apk add wget 
     wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
     chmod +x lab_superdylanyt.sh
     mv lab_superdylanyt.sh /bin
     clear    
   fi
fi
clear
echo " Ejecuta lab_superdylanyt start, para iniciar el sistema lab_superdylanyt "
exit
