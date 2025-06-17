#!/bin/bash
echo hello questionnaire 
ls -l
# Deleted everything but the shebang from my file so I can start making the questionnaire







#!/bin/bash
echo -e "\n~~ Questionnaire ~~\n"
QUESTION1="What's your name?"
# created variable
echo $QUESTION1
# to use and print a variable 
echo Hello $NAME. 
QUESTION2="Where are you from?"
read LOCATION 
echo Hello $NAME from $LOCATION.

if [[ $1 -gt 0 ]]
then
for (( i = $1; i > 0; i -- ))
do
echo $i
sleep 1
done
else
echo Include a positive integer as the first argument.
fi



