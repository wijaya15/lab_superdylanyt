#!/bin/bash
clear
rm lab_superdylanyt.sh
echo " [+] Actualizando lab_superdylanyt "
curl --progress-bar -L --fail --retry 4 -O https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt.sh
chmod +x lab_superdylanyt.sh
clear
rm -rf update-lab_superdylanyt.sh
             
