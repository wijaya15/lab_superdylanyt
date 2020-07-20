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
printf $cyan
figlet lab_superdylanyt
echo -e -n "\e[5;92m \n >>>  "
read res
case $res in
"create private-web-server -ubuntu")
clear
echo " creating a private web server. file checking. "
echo -e "\e[5;96m you want to create this private server  y/n?"
read s
if [ "$y" = "y" ]; then 
echo " check Python files if you don't have Python installed, the system will install Python "
pkg install python
clear
echo " When creating this private web server, we need a port, for example port 8080. the server will create a localhost with the port you wrote. write a port for localhost "
read port
echo " creating private web server with port $port "
clear
echo " press CTRl C to get out of here "
python -m SimpleHTTPServer $port
clear
menu
else
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
