#!/bin/bash
clear
apt-get install -y tar proot wget 
setterm -foreground green
menu()
{
clear
echo -e "\n\e[93m@lab_superdylanyt\n"
echo -e "\n\e[5;91m   1- Instalar Banner en Termux"
echo -e "\e[5;96m   2- Instalar Root en Termux"
echo -e "\e[5;92m   3- Crear Servidor SSH en Termux"
echo -e "\e[5;92m   4- Actualizar lab_superdylanyt"
echo -e "\e[5;92m   5- Crear Servidor WEB en Termux"
echo -e "\e[5;92m   6- Salir"
echo -e -n "\e[5;92m \n >>>  "
read res
case $res in
"1")
clear
apt update && apt upgrade -y
pkg install wget -y
pkg install vim -y
pkg install neofetch -y
cd $PREFIX/etc;ls
rm motd
rm bash.bashrc
bin=bash.bashrc
cat > $bin <<- EOM
command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

setterm -foreground green

echo -e "\e[1;32m"
neofetch
echo ""   
setterm -foreground green
PS1='\033[1;91m\u\[@localhost[\033[1;93m\W\033[1;91m]:\$ \033[1;92m'

EOM

chmod +x $bin
cd $HOME
clear
echo -e "\n\e[5;96m Regresar al menu s/n?"
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
pkg update && pkg upgrade
clear
pkg install root-repo -y
pkg install figlet -y
pkg install unstable-repo -y
clear
setterm -foreground green
pkg install proot -y
pkg install vim -y
pkg install wget -y
pkg install tsu -y && hash -r
clear
bin=start-root.sh
cat > $bin <<- EOM
#!/bin/bash
setterm -foreground green
clear
#bash.bashrc
proot -0 -w ~ $PREFIX/bin/bash
EOM

termux-fix-shebang $bin
chmod +x $bin
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
pkg install openssh -y
pkg install nmap -y
nmap localhost
sshd
nmap localhost
echo -e "\e[5;92m Copia el puerto y pegalo aquí, luego pulsa ENTER "
read port
whoami
echo -e "\e[5;92m Copia tu nombre de usuario y pegalo aquí, luego pulsa ENTER "
read user
clear
passwd $user
ifconfig wlan0
echo -e "\e[5;92m Copia la dirección IP y pegalo aquí, luego pulsa ENTER "
read ip
clear
echo -e "\e[5;92m Copia este comando y ejecutalo en cualquier terminal para acceder al server ssh "
echo -e "\e[5;92m ssh $user@$ip -p $port "
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
pkg update && pkg upgrade
update=update-lab_superdylanyt.sh
cat > $update <<- EOM
clear
rm lab_superdylanyt.sh
wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
chmod +x lab_superdylanyt.sh
clear
rm -rf update-lab_superdylanyt.sh
EOM

chmod +x $update
./$update
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
pkg install php-apache -y
pkg install mariadb -y
pkg install vim -y
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
exit
;;
esac
}
menu
