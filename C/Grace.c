#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#define CONTENT "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$c#define CONTENT %3$c%2$s%3$c%1$c#define FILE %3$cGrace_kid.c%3$c%1$c#define GRACE() int main() {int fd = open(FILE, O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU); if (fd < 0) return (1); dprintf(fd, CONTENT, 10, CONTENT, 34, 32, 4);close(fd);}%1$c%1$c/*%1$c%4$*5$cYou're still in the honeymoon stage. Enjoy it. 'Cause it ain't gonna last forever. - Grace%1$c*/%1$c%1$cGRACE()"
#define FILE "Grace_kid.c"
#define GRACE() int main() {int fd = open(FILE, O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU); if (fd < 0) return (1); dprintf(fd, CONTENT, 10, CONTENT, 34, 32, 4);close(fd);}

/*
    You're still in the honeymoon stage. Enjoy it. 'Cause it ain't gonna last forever. - Grace
*/

GRACE()