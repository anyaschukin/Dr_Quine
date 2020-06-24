/*
** Grace reproduces herself in her image
*/

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

# define GRACE_KID "Grace_kid.c"
# define SOURCE "/*%1$c** Grace reproduces herself in her image%1$c*/%1$c%1$c#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$c# define GRACE_KID %2$cGrace_kid.c%2$c%1$c# define SOURCE %2$c%3$s%2$c%1$c# define GRACE() int main(){int fd = open(GRACE_KID, O_CREAT|O_WRONLY|O_TRUNC, 0644); if (fd < 0) return (1); dprintf(fd, SOURCE, 10, 34, SOURCE); close(fd);}%1$c%1$cGRACE()%1$c"
# define GRACE() int main(){int fd = open(GRACE_KID, O_CREAT|O_WRONLY|O_TRUNC, 0644); if (fd < 0) return (1); dprintf(fd, SOURCE, 10, 34, SOURCE); close(fd);}

GRACE()
