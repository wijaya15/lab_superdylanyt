#include <stdio.h>
#include <stdlib.h>

#define SHELLSCRIPT "\
#/bin/bash \n\
echo -e \"\" \n\
echo -e \"Hemos añadido bash en codigo C!!\" \n\
read ENTER \"Pulsa <enter> para continuar\" \n\
clear\
"

int main() {

system(SHELLSCRIPT);
return 0;
}
