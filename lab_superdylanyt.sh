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
"1")
clear
menu
;;
"2")
clear
menu
;;
"3")
exit
;;
esac
}
menu
