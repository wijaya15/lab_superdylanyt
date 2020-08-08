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
echo -e "\e[5;92m   3- Salir"
echo -e -n "\e[5;92m \n >>>  "
read res
case $res in
"1")
clear
apt update && apt upgrade -y
pkg install wget -y
pkg install vim -y
pkg install neofetch -y
cd ../usr/etc;ls
rm motd
rm bash.bashrc
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/Termux/bash.bashrc
cd --
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
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/Termux/start-root.sh
clear
chmod 777 start-root.sh
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
exit
;;
esac
}
menu
