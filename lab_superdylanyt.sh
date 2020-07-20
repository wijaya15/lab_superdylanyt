#!/bin/bash -e

														                red='\033[1;31m'      
                green='\033[1;32m'        
                yellow='\033[1;33m'                  
                blue='\033[1;34m'            
                magenta='\033[1;35m'     
                cyan='\033[1;36m'        
                reset='\033[0m'


clear
menu()
{
clear
printf $green
figlet lab_superdylanyt
echo -e -n "\e[5;92m \n >>>  "
read res
case $res in
"create private-web-server -ubuntu")
clear
echo " creando un servidor web privado. verificando archivos "
echo -e "\e[5;96m quieres crear este servidor privado  s/n?"
read y
if [ "$s" = "s" ]; then 
echo " verificando los archivos de Python si no tiene Python instalado, el sistema instalará Python "
apt-get install python -y
clear
echo " Al crear este servidor web privado, necesitamos un puerto, por ejemplo, el puerto 8080. El servidor creará un localhost con el puerto que usted escribió. escribe un puerto para localhost "
read port
echo " creando un servidor web privado con el puerto $port "
clear
echo " El servidor privado se esta ejecutando en el sitio web localhost:$port "
echo " Pulsa CTRl C para salir de aquí y apagar el servidor web privado "
python -m SimpleHTTPServer $port
else
echo "saliendo.."
clear
menu
fi
clear
menu
;;
"create ssh-server -termux")
clear
echo -e "\e[5;96m Quieres crear un servidor ssh s/n?"
read s
if [ "$s" = "s" ]; then 
echo " Creando servidor ssh "
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
echo " Pulsa ENTER para salir de aqui "
read ENTER
else
clear
echo "saliendo.."
clear
menu
fi
clear
menu
;;
"exit")
echo " bye ..... :) "
exit
;;
esac
}
menu
