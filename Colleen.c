#include <stdio.h>

/*
* print my source code
*/

void print(char *source) {
    printf(source,10,9,34,source);
}

int main() {
    /*
    * here is my source code
    */

    char *source="#include <stdio.h>%1$c%1$c/*%1$c* print my source code%1$c*/%1$c%1$cvoid print(char *source) {%1$c  printf(source,10,9,34,source);%1$c}%1$c%1$cint main() {%1$c  /*%1$c  * here is my source code%1$c  */%1$c%1$c  char *source=%2$c%4$s%2$c;%1$c  print(source);%1$c  return(0);%1$c}";
    print(source);
    return(0);
}