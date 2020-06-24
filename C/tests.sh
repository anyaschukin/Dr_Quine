#!/bin/sh

#### -- Dr Quine Test -- ####
echo "\n\x1b[1mLaunching Dr Quine C tests...\x1B[0m\n"

#### -- Colleen -- ####
colleen_cmd="clang -Wall -Wextra -Werror -o Colleen Colleen.c; ./Colleen > tmp_Colleen ; diff tmp_Colleen Colleen.c"
colleen_output=$(eval "$colleen_cmd")
if [ "$colleen_output" == "" ]
then
	echo "\x1b[32mC:\tColleen\tOK\x1b[0m"
else
	echo "\x1b[31mC:\tColleen\tERROR:\x1b[0m"
	echo "$colleen_output"
fi

rm Colleen tmp_Colleen

#### -- Grace -- ####
grace_cmd="clang -Wall -Wextra -Werror -o Grace Grace.c; ./Grace ; diff Grace.c Grace_kid.c"
grace_output=$(eval "$grace_cmd")
if [ "$grace_output" == "" ]
then
	echo "\x1b[32mC:\tGrace\tOK\x1b[0m"
else
	echo "\x1b[31mC:\tGrace\tERROR:\x1b[0m"
	echo "$grace_output"
fi

chmod 000 Grace_kid.c; ./Grace
chmod 777 Grace_kid.c

rm Grace Grace_kid.c

#### -- Sully -- ####
sully_cmd="clang -Wall -Wextra -Werror Sully.c -o Sully ; ./Sully; ls -al | grep Sully | wc -l"
sully_output=$(eval "$sully_cmd")

diff_5="diff Sully.c Sully_5.c"
diff_5_output=$(eval "$diff_5")

diff_4="diff Sully.c Sully_4.c"
diff_4_output=$(eval "$diff_4")
diff_4_desired="8c8
< 	int x = 5;
---
> 	int x = 4;"

diff_3="diff Sully.c Sully_3.c"
diff_3_output=$(eval "$diff_3")
diff_3_desired="8c8
< 	int x = 5;
---
> 	int x = 3;"

diff_2="diff Sully.c Sully_2.c"
diff_2_output=$(eval "$diff_2")
diff_2_desired="8c8
< 	int x = 5;
---
> 	int x = 2;"

diff_1="diff Sully.c Sully_1.c"
diff_1_output=$(eval "$diff_1")
diff_1_desired="8c8
< 	int x = 5;
---
> 	int x = 1;"

diff_0="diff Sully.c Sully_0.c"
diff_0_output=$(eval "$diff_0")
diff_0_desired="8c8
< 	int x = 5;
---
> 	int x = 0;"

if [ "$sully_output" == "      14" -a "$diff_5_output" == "" -a "$diff_4_output" == "$diff_4_desired" -a "$diff_3_output" == "$diff_3_desired"  -a "$diff_2_output" == "$diff_2_desired"  -a "$diff_1_output" == "$diff_1_desired"  -a "$diff_0_output" == "$diff_0_desired" ]
then
	echo "\x1b[32mC:\tSully\tOK\x1b[0m"
else
	echo "\x1b[31mC:\tSully\tERROR:\x1b[0m"
	echo "$sully_output"
	echo "$diff_5_output"
	echo "$diff_4_output"
	echo "$diff_3_output"
	echo "$diff_2_output"
	echo "$diff_1_output"
	echo "$diff_0_output"
fi

chmod 000 Sully_5.c; ./Sully
chmod 000 Sully_4.c; ./Sully
chmod 000 Sully_3.c; ./Sully
chmod 000 Sully_2.c; ./Sully
chmod 000 Sully_1.c; ./Sully
chmod 000 Sully_0.c; ./Sully
chmod 777 Sully_5.c
chmod 777 Sully_4.c
chmod 777 Sully_3.c
chmod 777 Sully_2.c
chmod 777 Sully_1.c
chmod 777 Sully_0.c

rm Sully Sully_*

## To run:
## sh test.sh