
#### -- Dr Quine Test -- ####
echo "\n\x1b[1mLaunching Dr Quine Python tests...\x1B[0m\n"

#### -- Colleen -- ####
colleen_cmd="python3 Colleen.py > tmp_Colleen ; diff tmp_Colleen Colleen.py"
colleen_output=$(eval "$colleen_cmd")
if [ "$colleen_output" == "" ]
then
	echo "\x1b[32mPython:\tColleen\tOK\x1b[0m"
else
	echo "\x1b[31mPython:\tColleen\tERROR:\x1b[0m"
	echo "$colleen_output"
fi

rm tmp_Colleen

#### -- Grace -- ####
grace_cmd="python3 Grace.py; diff Grace.py Grace_kid.py"
grace_output=$(eval "$grace_cmd")
if [ "$grace_output" == "" ]
then
	echo "\x1b[32mPython:\tGrace\tOK\x1b[0m"
else
	echo "\x1b[31mPython:\tGrace\tERROR:\x1b[0m"
	echo "$grace_output"
fi

chmod 000 Grace_kid.py; python3 Grace.py
chmod 777 Grace_kid.py

rm Grace_kid.py

#### -- Sully -- ####
sully_cmd="python3 Sully.py; ls -al | grep Sully | wc -l"
sully_output=$(eval "$sully_cmd")

diff_5="diff Sully.py Sully_5.py"
diff_5_output=$(eval "$diff_5")

diff_4="diff Sully.py Sully_4.py"
diff_4_output=$(eval "$diff_4")
diff_4_desired="6c6
<         x=5
---
>         x=4"

diff_3="diff Sully.py Sully_3.py"
diff_3_output=$(eval "$diff_3")
diff_3_desired="6c6
<         x=5
---
>         x=3"

diff_2="diff Sully.py Sully_2.py"
diff_2_output=$(eval "$diff_2")
diff_2_desired="6c6
<         x=5
---
>         x=2"

diff_1="diff Sully.py Sully_1.py"
diff_1_output=$(eval "$diff_1")
diff_1_desired="6c6
<         x=5
---
>         x=1"

diff_0="diff Sully.py Sully_0.py"
diff_0_output=$(eval "$diff_0")
diff_0_desired="6c6
<         x=5
---
>         x=0"

if [ "$sully_output" == "       7" -a "$diff_5_output" == "" -a "$diff_4_output" == "$diff_4_desired"  -a "$diff_3_output" == "$diff_3_desired"  -a "$diff_2_output" == "$diff_2_desired"  -a "$diff_1_output" == "$diff_1_desired"  -a "$diff_0_output" == "$diff_0_desired" ]
then
	echo "\x1b[32mPython:\tSully\tOK\x1b[0m"
else
	echo "\x1b[31mPython:\tSully\tERROR:\x1b[0m"
	echo "$sully_output"
	echo "$diff_5_output"
	echo "$diff_4_output"
	echo "$diff_3_output"
	echo "$diff_2_output"
	echo "$diff_1_output"
	echo "$diff_0_output"
fi

chmod 000 Sully_5.py; python3 Sully.py
chmod 000 Sully_4.py; python3 Sully.py
chmod 000 Sully_3.py; python3 Sully.py
chmod 000 Sully_2.py; python3 Sully.py
chmod 000 Sully_1.py; python3 Sully.py
chmod 000 Sully_0.py; python3 Sully.py
chmod 777 Sully_5.py
chmod 777 Sully_4.py
chmod 777 Sully_3.py
chmod 777 Sully_2.py
chmod 777 Sully_1.py
chmod 777 Sully_0.py

rm Sully_*

## To run:
## ./test.sh
