#!/data/data/com.termux/files/usr/bin/bash -e
clear
apt-get install -y tar proot wget 
menu()
{
clear
setterm -foreground green
echo -e "\n\e[93m@lab_tool\n"
echo -e "\n\e[5;91m   1- Licencia"
echo -e "\e[5;96m   2- Instalar GENERADOR DE PAYLOAD Basico"
echo -e "\e[5;92m   3- Instalar Tool-X"
echo -e "\e[5;92m   4- Instalar Black Hydra"
echo -e "\e[5;92m   5- Instalar IPGeolocation"
echo -e "\e[5;92m   6- Instalar Metasploit_Framework"
echo -e "\e[5;92m   7- Instalar Java en Ubuntu"
echo -e "\e[5;92m   8- Instalar MR Linux"
echo -e "\e[5;92m   9- Instalar lab_banner"
echo -e "\e[5;92m   10- Instalar login"
echo -e "\e[5;92m   11- Instalar Ubuntu"
echo -e "\e[5;92m   12- Instalar sqlmap"
echo -e "\e[5;92m   13- Instalar Kali-Linux"
echo -e "\e[5;92m   14- Instalar RouterSploit"
echo -e "\e[5;92m   15- Instalar Servidor-WEB-Termux"
echo -e "\e[5;92m   16- Instalar Servidor PHP"
echo -e "\e[5;92m   17- Instalar NetHunter"
echo -e "\e[5;92m   18- Instalar Debian"
echo -e "\e[5;92m   19- Instalar BackBox"
echo -e "\e[5;92m   20- Instalar fbvid"
echo -e "\e[5;92m   21- Instalar navegador w3m"
echo -e "\e[5;92m   22- Instalar wifite"
echo -e "\e[5;92m   23- Instalar aircrack-ng"
echo -e "\e[5;92m   24- Instalar Weeman"
echo -e "\e[5;92m   25- Instalar snap"
echo -e "\e[5;92m   26- Instalar tor"
echo -e "\e[5;92m   27- Crear servidor ssh"
echo -e "\e[5;92m   28- Copiar codigo fuente de url"
echo -e "\e[5;92m   29- Instalar EvilURL"
echo -e "\e[5;92m   30- Instalar websploit"
echo -e "\e[5;92m   31- Instalar spiderbot"
echo -e "\e[5;92m   32- Instalar nmap"
echo -e "\e[5;92m   33- Instalar hydra"
echo -e "\e[5;92m   34- Instalar RED_HAWK"
echo -e "\e[5;92m   35- Salir"
echo -e -n "\e[5;92m \n >>> "
read res
case $res in
"1")
clear
setterm -foreground red
echo " Licencia "
setterm -foreground cyan
echo " [ code by dylan14567 ] "
echo " El creador del script, no se hace responsable "
echo " por el mal uso de este script, la unica intención "
echo " de este tool es para instalar herramientas en termux "
setterm -foreground yellow
echo " El conocimiento es libre "
setterm -foreground green
echo " voy a compartirlo "
echo " [ Buen Hacking Etico ] "
setterm -foreground white
echo " Bandera Blanca "
setterm -foreground green
echo " Escribe y si confirmas esta licensia "
setterm -foreground red 
echo " Escribe n si no confirmas esta licensia "
setterm -foreground green
echo " ###################### "
read ENTER
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"2")
clear
wget https://dylan14567.github.io/Laboratorio-SUPERDYLANYT/Bash/GENERADORDEPAYLOAD.sh
chmod 777 GENERADORDEPAYLOAD.sh
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"3")
clear
pkg update && pkg upgrade
pkg install git -y
git clone https://github.com/rajkumardusad/Tool-X
ls
cd Tool-X
chmod 777 *;ls
cd --
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"4")
clear
pkg install hydra -y
pkg install git -y
git clone https://github.com/Gameye98/Black-Hydra
ls
cd Black-Hydra
ls
pkg install python
pkg install python2
chmod 777 blackhydra.py
cd --
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"5")
clear
pkg update && pkg upgrade
pkg install fish git python
git clone https://github.com/maldevel/IPGeoLocation
pip install --upgrade pip
cd IPGeoLocation;ls
pip install -r requirements.txt
chmod 777 ipgeolocation.py
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"6")
clear
pkg update && pkg upgrade
pkg install ruby -y
clear
pkg install unstable-repo
pkg install metasploit
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"7")
clear
echo " Para instalar java en ubuntu "
echo " debes ejecutar el comando apt install wget -y "
echo " Luego ejecuta wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/install-java.sh "
echo " Luego ejecuta chmod 777 install-java.sh "
echo " Ejecuta el script con ./install-java.sh "
echo " Pulsa ENTER para salir de aqui "
read ENTER
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"8")
clear
pkg install wget -y
wget https://dylan14567.github.io/Laboratorio-SUPERDYLANYT/MR.-Linux.zip
unzip MR.-Linux.zip
rm MR.-Linux.zip
cd MR.-Linux;ls
chmod 777 menu.sh
ls
cd --
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"9")
clear
pkg install wget -y
wget https://dylan14567.github.io/Laboratorio-SUPERDYLANYT/Bash/lab_banner.sh
chmod 777 lab_banner.sh
ls
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"10")
clear
setterm -foreground green
figlet Login
echo " Tienes que cambiar la contraseña editando el script con vim "
echo " la contraseña por defecto del script es root "
echo " Una vez que has instalado login, debes ir a"
echo " cd ../usr/etc;ls en esta ubicación editar bash.bashrc con vim"
echo " dentro de bash.bashrc en la parte arriba de banner y de PS1 "
echo " escribe sh login.sh "
echo " Ejemplo: "
echo " command_not_found_handle() { "
echo "        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1" "
echo "} "
echo " "
echo " setterm -foreground green "
echo " "
echo "python login.py "
echo " "
echo "clear "
echo "neofetch "
echo "echo ""   "
echo "setterm -foreground green "
echo "PS1='\033[1;91mroot@termux[\033[1;93m\W\033[1;91m]:# \033[1;92m'" "
echo " ########################################"
echo " Pulsa ENTER para confirmar la instalación de login "
echo " Escribe CTRL C para salir de aqui "
read ENTER
clear
pkg update && pkg upgrade
pkg install python -y
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/login.py
chmod 777 login.py
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"11")
clear
pkg update && pkg upgrade
mkdir ISO_Ubuntu
cd $HOME/ISO_Ubuntu
pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Ubuntu/ubuntu.sh && bash ubuntu.sh
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"12")
clear
pkg update && pkg upgrade
pkg install python2 -y
pkg install git -y
git clone https://github.com/sqlmapproject/sqlmap
ls
cd sqlmap
chmod +x *;ls
cd --
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"13")
clear
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/kali-linux.sh
chmod 777 kali-linux.sh
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"14")
clear
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/RouterSploit
chmod 777 RouterSploit
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"15")
clear
pkg install git -y
git clone https://github.com/dylan14567/Servidor-WEB-Termux
cd $HOME/Servidor-WEB-Termux;ls
chmod 777 install.sh
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"16")
clear
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/install_php.sh
chmod 777 install_php.sh
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"17")
clear
pkg install wget
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"18")
clear
setterm -foreground green
echo " Para instalar Debian "
echo " En cd $HOME debes ejecutar este comando "
echo " install-debian "
echo " Pulsa ENTER para salir de aqui "
read ENTER
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"19")
clear
mkdir $HOME/BackBox
cd $HOME/BackBox
pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/BackBox/backbox.sh && bash backbox.sh
clear
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"20")
clear
pkg install php -y
pkg install git -y
git clone https://github.com/Tuhinshubhra/fbvid
cd $HOME/fbvid
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"21")
clear
pkg update && pkg upgrade
pkg install w3m -y
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"22")
clear
pkg install git -y
pkg install python -y
pkg install python2 -y
git clone https://github.com/derv82/wifite2
cd $HOME/wifite2
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"23")
clear
apt-get update && apt-get upgrade
pkg install proot -y
pkg install root-repo -y
apt-get install aircrack-ng -y
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"24")
clear
pkg install git -y
pkg install python -y
pkg install python2 -y
git clone https://github.com/evait-security/weeman
cd $HOME/weeman
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"25")
clear
pkg install git -y
pkg install python -y
pkg install python2 -y
git clone https://github.com/noob-hackers/snap
cd $HOME/snap
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"26")
clear
pkg install tor -y
pkg install proxychains-ng -y
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"27")
clear
pkg install openssh -y
pkg install nmap -y
nmap localhost
sshd
nmap localhost
echo " Copia el puerto y pegalo aquí, luego pulsa ENTER "
read port
whoami
echo " Copia tu nombre de usuario y pegalo aquí, luego pulsa ENTER "
read user
clear
passwd $user
ifconfig wlan0
echo " Copia la dirección IP y pegalo aquí, luego pulsa ENTER "
read ip
clear
echo " Copia este comando y ejecutalo en cualquier terminal para acceder al server ssh "
echo " ssh $user@$ip -p $port "
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"28")
clear
echo " Copia la url aquí y pulsa ENTER "
read url
wget -rpk $url
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"29")
clear
pkg update && pkg upgrade
pkg install git python python2 -y
git clone https://github.com/UndeadSec/EvilURL
cd $HOME/EvilURL
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"30")
clear
pkg update && pkg upgrade
pkg install git python2 -y
git clone https://github.com/The404Hacking/websploit
cd $HOME/websploit
chmod +x *;ls
python2 -m pip install scapy
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"31")
clear
pkg update && pkg upgrade
pkg install git php -y
git clone https://github.com/Cvar1984/SpiderBot
cd $HOME/SpiderBot
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"32")
clear
pkg update && pkg upgrade
pkg install nmap -y
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"33")
clear
pkg update && pkg upgrade
pkg install hydra -y
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"34")
clear
pkg update && pkg upgrade
pkg install php -y
pkg install git -y
git clone https://github.com/Tuhinshubhra/RED_HAWK
cd $HOME/RED_HAWK
chmod +x *;ls
cd $HOME
clear
echo -e "\e[5;96m Regresar al menu s/n?"
read s
if [ "$s" = "s" ]; then 
menu
else
echo "saliendo.."
exit
fi
;;
"35")
exit
;;
esac
}
menu
