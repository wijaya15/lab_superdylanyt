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

termux-fix-shebang $bin
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
