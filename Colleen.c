#include <stdio.h>

/*
* print my source code
*/

void print(char *source) {
    printf(source,10,34,source);
}

int main() {
    /*
    * here is my source code
    */

    char *source="#include <stdio.h>%1$c/*%1$c print my source code%1$c*/void print(char *source){%1$c   printf(source,10,34,source);%1$c}%1$c%1$cint main() {%1$c   /*%1$c  *here is my source coode%1$c    */%1$c%1$c  char *source=%2$c"
    print(source);
    return(0);
}


# include <stdio.h>
/*
   whoami?
*/
void	express(char *self){
	printf(self,10,34,self);
}

int	main() {
	/*
	   I must define and express myself
	*/
	char *self="# include <stdio.h>%1$c/*%1$c   whoami?%1$c*/%1$cvoid	express(char *self){%1$c	printf(self,10,34,self);%1$c}%1$c%1$cint	main() {%1$c	/*%1$c	   I must define and express myself%1$c	*/%1$c	char *self=%2$c%3$s%2$c;%1$c	express(self);%1$c	return (0);%1$c}";
	express(self);
	return (0);
}

--------------------------

void	print(char *c){printf(c,10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, c, 34, 10, 9, 10, 9, 10);}

int		main(void)
{
	/*
	* commentaire dans le main
	*/
	char *c="#include <stdio.h>%c/*%c* test%c*/%cvoid	print(char *c){printf(c,10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, c, 34, 10, 9, 10, 9, 10);}%c%cint		main(void)%c{%c%c/*%c%c* commentaire dans le main%c%c*/%c%cchar *c=%c%s%c;%c%cprint(c);%c%creturn(0);%c}";
	print(c);
	return(0);
}

---------------------------

char	*other(void) {
	return ("#include <stdio.h>%1$c%1$c/*%1$c  One comment%1$c*/%1$c%1$cchar	*other(void) {%1$c	return (%3$c%2$s%3$c);%1$c}%1$c%1$cint		main(void) {%1$c/*%1$c  Two comment%1$c*/%1$c	printf(other(), 10, other(), 34);%1$c}%1$c");
}

int		main(void) {
/*
  Two comment
*/
	printf(other(), 10, other(), 34);
}