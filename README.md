# lab_superdylanyt
[![Build Status](https://img.shields.io/github/stars/dylan14567/lab_superdylanyt.svg)](https://github.com/dylan14567/lab_superdylanyt)
[![License](https://img.shields.io/github/license/dylan14567/lab_superdylanyt.svg)](https://github.com/dylan14567/lab_superdylanyt/blob/master/LICENSE)
[![dylan14567](https://img.shields.io/badge/author-dylan14567-green.svg)](https://github.com/dylan14567)
[![bug_report](https://img.shields.io/badge/bug-report-red.svg)](https://github.com/dylan14567/lab_superdylanyt/blob/master/.github/ISSUE_TEMPLATE/bug_report.md)
[![security_policy](https://img.shields.io/badge/security-policy-cyan.svg)](https://github.com/dylan14567/lab_superdylanyt/blob/master/SECURITY.md)
[![Bash](https://img.shields.io/badge/language-Bash-blue.svg)](https://www.gnu.org/software/bash/)
![alt text](https://github.com/dylan14567/lab_superdylanyt/raw/master/20201008_114639.jpg)

Lab_superdylanyt es un sistema creado por SUPERDYLANYT, que funciona en sistemas operativos GNU/Linux, el sistema lab_superdylanyt te ayuda instalar
programas en linux.

Al ejecutar el script ./lab_superdylanyt, tienes que escribir start para iniciar el sistema de esta manera ./lab_superdylanyt start y para actualizar el sistema escribe este comando ./lab_superdylanyt update.

# Instalación

Para instalar lab_superdylanyt en linux ejecuta estos comandos en tu Terminal Linux.

```shell

apt-get install wget -y
wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt
chmod +x lab_superdylanyt
./lab_superdylanyt start

```

Para instalar lab_superdylanyt en TermuxAlpine, ejecuta estos comandos.

```shell

apk add bash 
apk add wget
wget https://raw.githubusercontent.com/dylan14567/lab_superdylanyt/master/lab_superdylanyt
chmod +x lab_superdylanyt
./lab_superdylanyt start

```

# Instalar Ubuntu en Termux

Para instalar Ubuntu en Termux, ingresa al menu del sistema lab_superdylanyt, y escribe 7, luego pulsa en ENTER, y se comenzara a instalar Ubuntu.

Una vez instalado Ubuntu, debes iniciar el sistema Ubuntu con el comando startubuntu.

/FIN/

# Solución de error con dpkg en Ubuntu

Si haz tenido un problema al instalar un paquete apt, y te salido error de dpkg.
La solución es esta:

```shell
cd /var/lib/dpkg/info
rm -rf *;ls
cd --
sudo apt install -f

```

# Contribuyendo

¿Interesado en contribuir en el proyecto? Nos encantaría tu ayuda. Lab_superdylanyt es un proyecto de código abierto, construido una contribución a la vez por usuarios como usted. Consulte <a href="https://github.com/dylan14567/lab_superdylanyt/blob/master/CONTRIBUTING.md">el archivo CONTRIBUTING</a> para obtener instrucciones sobre cómo contribuir.

# Licencia

La licencia de este proyecto es <a href="https://github.com/dylan14567/lab_superdylanyt/blob/master/LICENSE">MIT</a>




