#!/bin/sh
echo "=========="
echo "./Colleen"
echo "=========="
echo "COMMAND: ./Colleen > tmp_Colleen; diff ./Colleen.c ./tmp_Colleen"
echo "RESULT (expect empty line):"
./Colleen > tmp_Colleen; diff ./Colleen.c ./tmp_Colleen
echo ""
echo "=========="
echo "./Grace"
echo "=========="
echo "COMMAND: ./Grace; diff ./Grace.c ./Grace_kid.c"
echo "RESULT (expect empty line):"
./Grace; diff ./Grace.c ./Grace_kid.c
