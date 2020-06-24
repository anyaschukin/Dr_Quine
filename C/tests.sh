#!/bin/sh

## COLLEEN
clang -Wall -Wextra -Werror -o Colleen Colleen.c; ./Colleen > tmp_Colleen ; diff tmp_Colleen Colleen.c
rm Colleen tmp_Colleen

# ## GRACE
clang -Wall -Wextra -Werror -o Grace Grace.c; ./Grace ; diff Grace.c Grace_kid.c
rm Grace Grace_kid.c

# ## SULLY
clang -Wall -Wextra -Werror Sully.c -o Sully ; ./Sully; ls -al | grep Sully | wc -l
rm Sully Sully_*