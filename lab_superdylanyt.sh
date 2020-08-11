#!/bin/bash
clear
case "$1" in
	  start)
	   echo " Iniciando Sistema "
            ;;
        
	*)
	    echo $"Usage: $0 {start}"
	    exit 2
	    ;;
esac
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
echo -e "\e[5;92m   6- Instalar lab_tool en Termux"
echo -e "\e[5;92m   7- Instalar Ubuntu en Termux"
echo -e "\e[5;92m   8- Instalar Alpine Linux en Termux"
echo -e "\e[5;92m   9- Instalar w3m en Termux"
echo -e "\e[5;92m   10- Instalar Arch Linux en Termux"
echo -e "\e[5;92m   11- Salir"
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
pkg install net-tools -y
pkg install procps -y
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
cd $PREFIX/share/apache2/default-site/htdocs;ls
rm -rf index.html
bin=index.html
cat > $bin <<- EOM
<!DOCTYPE html
<html>
<head>
      <title> Web server </title>
</head>
<body>
     <h1> It works! </h1><br />
     <br />
     <p> This is the default web page for this server. </p>
     <p> Visit apache page for more information: <a href="https://httpd.apache.org/">https://httpd.apache.org/</a>
<body>
</html>       
EOM

echo '<?php phpinfo();'> info.php
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
"6")
clear
pkg install wget -y
wget https://raw.githubusercontent.com/dylan14567/lab_tool/master/install-lab_tool.sh
ls
chmod +x install-lab_tool.sh
./install-lab_tool.sh
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
pkg update && pkg upgrade
mkdir $HOME/Ubuntu
cd $HOME/Ubuntu
pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Ubuntu/ubuntu.sh && bash ubuntu.sh
rm -rf ubuntu.sh
clear
bin=startubuntu
cat > $bin <<- EOM
clear
cd $PREFIX/share/Ubuntu
./start-ubuntu.sh
EOM

termux-fix-shebang $bin
chmod +x $bin
mv $bin $PREFIX/bin
cd $HOME
mv Ubuntu $PREFIX/share
cd $HOME
echo " Ejecuta el comando startubuntu para inciar Ubuntu en Termux "
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
cd $HOME
pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/Hax4us/TermuxAlpine/master/TermuxAlpine.sh && bash TermuxAlpine.sh
rm -rf TermuxAlpine.sh
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
"9")
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
"10")
clear
cd $HOME
pkg update && pkg upgrade
pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/TermuxArch/TermuxArch/master/setupTermuxArch.bash
chmod +x setupTermuxArch.bash
bash setupTermuxArch.bash
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
exit
;;
esac
}
menu
