#### -- ASM Tests -- ####
echo "\n\x1b[1mLaunching Dr Quine ASM tests...\x1B[0m\n"

#### -- Colleen -- ####
colleen_cmd="nasm -f macho64 Colleen.s; gcc Colleen.o -o Colleen; ./Colleen > tmp_Colleen ; diff tmp_Colleen Colleen.s"
colleen_output=$(eval "$colleen_cmd")
if [ "$colleen_output" == "" ]
then
	echo "\x1b[32mASM:\tColleen\tOK\x1b[0m"
else
	echo "\x1b[31mASM:\tColleen\tERROR:\x1b[0m"
	echo "$colleen_output"
fi

rm Colleen Colleen.o tmp_Colleen

#### -- Grace -- ####
grace_cmd="nasm -f macho64 Grace.s; gcc Grace.o -o Grace; ./Grace; diff Grace.s Grace_kid.s"
grace_output=$(eval "$grace_cmd")
if [ "$grace_output" == "" ]
then
	echo "\x1b[32mASM:\tGrace\tOK\x1b[0m"
else
	echo "\x1b[31mASM:\tGrace\tERROR:\x1b[0m"
	echo "$grace_output"
fi

chmod 000 Grace_kid.s; ./Grace
chmod 777 Grace_kid.s

rm Grace Grace.o Grace_kid.s

#### -- Sully -- ####
sully_cmd="nasm -f macho64 Sully.s; gcc Sully.o -o Sully; ./Sully; ls -al | grep Sully | wc -l"
sully_output=$(eval "$sully_cmd")

diff_5="diff Sully.s Sully_5.s"
diff_5_output=$(eval "$diff_5")

diff_4="diff Sully.s Sully_4.s"
diff_4_output=$(eval "$diff_4")
diff_4_desired="22c22
< 	mov r12, 5
---
> 	mov r12, 4"

diff_3="diff Sully.s Sully_3.s"
diff_3_output=$(eval "$diff_3")
diff_3_desired="22c22
< 	mov r12, 5
---
> 	mov r12, 3"

diff_2="diff Sully.s Sully_2.s"
diff_2_output=$(eval "$diff_2")
diff_2_desired="22c22
< 	mov r12, 5
---
> 	mov r12, 2"

diff_1="diff Sully.s Sully_1.s"
diff_1_output=$(eval "$diff_1")
diff_1_desired="22c22
< 	mov r12, 5
---
> 	mov r12, 1"

diff_0="diff Sully.s Sully_0.s"
diff_0_output=$(eval "$diff_0")
diff_0_desired="22c22
< 	mov r12, 5
---
> 	mov r12, 0"

if [ "$sully_output" == "      15" -a "$diff_5_output" == "" -a "$diff_4_output" == "$diff_4_desired"  -a "$diff_3_output" == "$diff_3_desired"  -a "$diff_2_output" == "$diff_2_desired"  -a "$diff_1_output" == "$diff_1_desired"  -a "$diff_0_output" == "$diff_0_desired" ]
then
	echo "\x1b[32mASM:\tSully\tOK\x1b[0m"
else
	echo "\x1b[31mASM:\tSully\tERROR:\x1b[0m"
	echo "$sully_output"
	echo "$diff_5_output"
	echo "$diff_4_output"
	echo "$diff_3_output"
	echo "$diff_2_output"
	echo "$diff_1_output"
	echo "$diff_0_output"
fi

# chmod 000 Sully_5.s; ./Sully
# chmod 777 Sully_5.s

rm Sully Sully.o Sully_*
