# In this 140-lesson course, you will learn some more complex commands, and the details of how commands work.
echo hello bash > stdout.txt
echo hello bash >> stdout.txt
bad_command > stderr.txt
<!-- output: bash: bad_command: command not found -->
bad_command 2> stderr.txt
echo hello bash 1> stdout.txt
read NAME > stdin.txt
input: Anastasiia
echo $NAME
<!-- output:
Anastasiia -->
echo $NAME > stdout.txt
echo freeCodeCamp > name.txt
read NAME < name.txt
# stdin was pointing to the name.txt file this time.
echo $NAME
<!-- output:
freeCodeCamp -->
echo Anastasiia | read NAME
cat name.txt
<!-- output:
freeCodeCamp -->
cat < name.txt
<!-- output:
freeCodeCamp -->
echo Anastasii | cat 
<!-- output:
Anastasii -->
touch script.sh
# created script.sh
chmod +x script.sh
./script.sh
# The read command in your script is waiting for input. 
input: Anastasiia
<!-- output: 
Hello Anastasiia
./script.sh: line 4: bad_command: command not found -->
echo Anastasiia | ./script.sh
<!-- output:
Hello Anastasiia
./script.sh: line 4: bad_command: command not found -->
echo Anastasiia | ./script.sh 2> stderr.txt
<!-- output:
Hello Anastasiia -->
echo Anastasiia | ./script.sh 2> stderr.txt > stdout.txt
# It didn't ask for input and nothing was printed in the terminal that time. I redirected both outputs to files. 
./script.sh < name.txt
<!-- output:
Hello freeCodeCamp
./script.sh: line 4: bad_command: command not found -->
./script.sh < name.txt 2> stderr.txt
<!-- output:
Hello freeCodeCamp -->
./script.sh < name.txt 2> stderr.txt > stdout.txt
cat kitty_ipsum_1.txt
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
raw food off kitchen counter. chew master's slippers hide from
vacuum cleaner. lick owner’s face while cat sleeps on a black
shirt howl or gimme attention meow bye and eat grass, meow, and
throw up because i ate grass pelt around the house and up and
down stairs chasing phantoms. stretch out on bed or show belly.
trip on catnip good morning sunshine. this human feeds me, i
drink from water glass and then spill it everywhere and proceed
to lick the puddle and pushed the mug off the table. i see a bird
i stare at it i meow at it i do a wiggle come here birdy ears
back wide eyed, in the middle of the night i crawl onto your chest
and gently to help you sleep. rub against owner because nose is
wet. food at 4am leave hair on owners clothes. demand to have
some of whatever the human is cooking, then sniff the offering
and walk away you are a captive audience while sitting on the
toilet, pet me. sit by the fire dream about hunting birds chew
foot. we are 3 small cats sleeping most of our time, we are
around 15 weeks old i think, i don’t know i can’t count. suddenly
go on wild-eyed crazy rampage stare at owner accusingly then wink.
howl on top of tall thing see owner, run in excitement rub against
owner because nose is wet cat. leave hair everywhere give me attention
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
the pig around the house meow run in circles. always ensure to
lay down in such a manner that i am on human nose go crazy with
excitement when plates are clanked together signaling the arrival
of cat food so am in trouble, roll over, too cute for human to get
mad. love me! dont wait for the storm to pass, dance in the rain. -->
cat kitty_ipsum_2.txt
<!-- output:
destroy house in 5 seconds hide from vacuum cleaner be
discovered on floor or under the bed. chase the pig around
the house pretend you want to go out but then don't scratch
my head something feels fishy scratch at fleas, meow until
belly rubs, hide behind curtain when vacuum cleaner is on.
stares at human while pushing stuff off a table, go into a
rage and bite own foot, hard so scratch the postman wake up
lick paw wake up owner meow meowzer. eat a rug and hairs
everywhere oh no human coming lie on couch don't get off
couch look out window i must find my catnip. no, you can't
close the door, i haven't decided whether or not i wanna go
out. jump around on couch, meow constantly until given food,
refuse to come home when humans asks stay out all night. that
other cat smells funny you should really give me all the treats
because i smell the best and omg you finally got the right spot
and i love you right now, so spit up on light gray carpet
instead of adjacent linoleum. stretch shed everywhere shed
everywhere stretching attack your ankles chase the red dot,
cat hairball run catnip eat the grass sniff but attack the
cat. meow all night disturbing sleeping humans intently looking
out the window. fight an alligator and win. fight the
hundred-and-twenty-pound rottweiler and steal his spot, crash
against wall but walk away like nothing happened mess up all
the toilet paper meow for human to feed me or eat owner's food.
cats meow or while happily ignoring when being called. stare out
cat door then go back inside run as fast as i can into another
room for no reason, and lie on your feet. leave hair everywhere 
give me attention eat sniff catnip meow meowzer. -->
# I will write a small script to translate both of them into doggy ipsum. 
wc kitty_ipsum_1.txt
<!-- output:
  27  332 1744 kitty_ipsum_1.txt -->
# how many lines
wc -l kitty_ipsum_1.txt
<!-- output:
27 kitty_ipsum_1.txt -->
# how many words 
wc -w kitty_ipsum_1.txt
<!-- output:
332 kitty_ipsum_1.txt -->
# how many characters 
wc -m kitty_ipsum_1.txt
<!-- output:
1738 kitty_ipsum_1.txt -->
cat kitty_ipsum_1.txt |  wc
<!-- output:
     27     332    1744 -->
wc < kitty_ipsum_1.txt
<!-- output:
  27  332 1744 -->
echo "~~ kitty_ipsum_1.txt info ~~" > kitty_info.txt
echo -e "\nNumber of lines:" >> kitty_info.txt
cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt
echo -e "\nNumber of words:" >> kitty_info.txt
cat kitty_ipsum_1.txt | wc -w >> kitty_info.txt
echo -e "\nNumber of characters:" >> kitty_info.txt
wc -m < kitty_ipsum_1.txt >> kitty_info.txt
grep 'meow' kitty_ipsum_1.txt
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
shirt howl or gimme attention meow bye and eat grass, meow, and
i stare at it i meow at it i do a wiggle come here birdy ears
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
the pig around the house meow run in circles. always ensure to -->
grep --color 'meow' kitty_ipsum_1.txt
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
shirt howl or gimme attention meow bye and eat grass, meow, and
i stare at it i meow at it i do a wiggle come here birdy ears
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
the pig around the house meow run in circles. always ensure to -->

grep --color -n 'meow' kitty_ipsum_1.txt
<!-- output:
1:hide from vacuum cleaner meow for catnip and act crazy steal
4:shirt howl or gimme attention meow bye and eat grass, meow, and
10:i stare at it i meow at it i do a wiggle come here birdy ears
22:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
23:the pig around the house meow run in circles. always ensure to -->
grep --color -n 'meow[a-z]*' kitty_ipsum_1.txt
<!-- output:
1:hide from vacuum cleaner meow for catnip and act crazy steal
4:shirt howl or gimme attention meow bye and eat grass, meow, and
10:i stare at it i meow at it i do a wiggle come here birdy ears
22:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
23:the pig around the house meow run in circles. always ensure to -->
echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt
# showed how many line with match 
grep -c 'meow[a-z]*' kitty_ipsum_1.txt
<!-- output:
5 -->
grep -o 'meow[a-z]*' kitty_ipsum_1.txt
<!-- output:
meow
meow
meow
meow
meow
meowzer
meow -->
grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l 
<!-- output:
7 -->
grep -o 'meow[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt
sed 's/r/2/' name.txt
<!-- output:
f2eeCodeCamp -->
sed 's/free/f233/' name.txt
<!-- output:
f233CodeCamp -->
sed 's/freecodecamp/f233C0d3C@mp/i' name.txt
<!-- output:
f233C0d3C@mp -->
cat name.txt | sed 's/freecodecamp/f233C0d3C@mp/i'
<!-- output:
f233C0d3C@mp -->
grep -n 'meow[a-z]*' kitty_ipsum_1.txt >> kitty_info.txt
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed 's/[0-9]/1/'
# That matched the first digit it found on each line and replaced it with 1
<!-- output:
1:hide from vacuum cleaner meow for catnip and act crazy steal
1:shirt howl or gimme attention meow bye and eat grass, meow, and
10:i stare at it i meow at it i do a wiggle come here birdy ears
12:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
13:the pig around the house meow run in circles. always ensure to -->
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'
#  It replaced all the numbers at the start with a 1
<!-- output:
1:hide from vacuum cleaner meow for catnip and act crazy steal
1:shirt howl or gimme attention meow bye and eat grass, meow, and
1:i stare at it i meow at it i do a wiggle come here birdy ears
1:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
1:the pig around the house meow run in circles. always ensure to -->
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+)/\1/'
# That matched all the numbers and replaced them with the same numbers. 
<!-- output:
1:hide from vacuum cleaner meow for catnip and act crazy steal
4:shirt howl or gimme attention meow bye and eat grass, meow, and
10:i stare at it i meow at it i do a wiggle come here birdy ears
22:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
23:the pig around the house meow run in circles. always ensure to -->
camper: /project$ grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'
<!-- output:
1
4
10
22
23 -->
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
grep --color 'cat[a-z]*' kitty_ipsum_1.txt
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
vacuum cleaner. lick owner’s face while cat sleeps on a black
trip on catnip good morning sunshine. this human feeds me, i
foot. we are 3 small cats sleeping most of our time, we are
owner because nose is wet cat. leave hair everywhere give me attention
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
of cat food so am in trouble, roll over, too cute for human to get -->

echo -e "\nNumber of times cat, cats, or catnip appears:" >> kitty_info.txt
grep -o 'cat[a-z]*' kitty_ipsum_1.txt
<!-- output:
catnip
cat
catnip
cats
cat
catnip
cat -->
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l
<!-- output:
7 -->
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt 
echo -e "\nLines that they appear on:" >> kitty_info.txt
grep -n 'cat[a-z]*' kitty_ipsum_1.txt
<!-- output:
1:hide from vacuum cleaner meow for catnip and act crazy steal
3:vacuum cleaner. lick owner’s face while cat sleeps on a black
7:trip on catnip good morning sunshine. this human feeds me, i
17:foot. we are 3 small cats sleeping most of our time, we are
21:owner because nose is wet cat. leave hair everywhere give me attention
22:eat sniff catnip meow meowzer. good morning sunshine. lick human chase
26:of cat food so am in trouble, roll over, too cute for human to get -->
grep -n 'cat[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'
<!-- output:
1
3
7
17
21
22
26 -->
grep -n 'cat[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
echo -e "\n\n~~ kitty_ipsum_2.txt info ~~" >> kitty_info.txt
echo -e "\nNumber of lines:" >> kitty_info.txt
cat kitty_ipsum_2.txt | wc -l >> kitty_info.txt 
echo -e "\nNumber of words:" >> kitty_info.txt
wc -w < kitty_ipsum_2.txt >> kitty_info.txt
echo -e "\nNumber of characters:" >> kitty_info.txt
wc -m < kitty_ipsum_2.txt >> kitty_info.txt
grep --color 'meow[a-z]*' kitty_ipsum_2.txt
<!-- output:
my head something feels fishy scratch at fleas, meow until
lick paw wake up owner meow meowzer. eat a rug and hairs
out. jump around on couch, meow constantly until given food,
cat. meow all night disturbing sleeping humans intently looking
the toilet paper meow for human to feed me or eat owner's food.
cats meow or while happily ignoring when being called. stare out
give me attention eat sniff catnip meow meowzer. -->
echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt
grep -o 'meow[a-z]*' kitty_ipsum_2.txt | wc -l >> kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt
grep -n 'meow[a-z]*' kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
grep --color 'cat[a-z]*' kitty_ipsum_2.txt
<!-- output:
couch look out window i must find my catnip. no, you can't
other cat smells funny you should really give me all the treats
cat hairball run catnip eat the grass sniff but attack the
cat. meow all night disturbing sleeping humans intently looking
cats meow or while happily ignoring when being called. stare out
cat door then go back inside run as fast as i can into another
give me attention eat sniff catnip meow meowzer. -->
echo -e "\nNumber of times cat, cats, or catnip appears:" >> kitty_info.txt
grep -o 'cat[a-z]*'  kitty_ipsum_2.txt | wc -l >>  kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt
grep -n 'cat[a-z]*'  kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt
touch translate.sh
# translate.sh
chmod +x translate.sh
./translate.sh kitty_ipsum_1.txt
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
raw food off kitchen counter. chew master's slippers hide from
vacuum cleaner. lick owner’s face while cat sleeps on a black
shirt howl or gimme attention meow bye and eat grass, meow, and
throw up because i ate grass pelt around the house and up and
down stairs chasing phantoms. stretch out on bed or show belly.
trip on catnip good morning sunshine. this human feeds me, i
drink from water glass and then spill it everywhere and proceed
to lick the puddle and pushed the mug off the table. i see a bird
i stare at it i meow at it i do a wiggle come here birdy ears
back wide eyed, in the middle of the night i crawl onto your chest
and gently to help you sleep. rub against owner because nose is
wet. food at 4am leave hair on owners clothes. demand to have
some of whatever the human is cooking, then sniff the offering
and walk away you are a captive audience while sitting on the
toilet, pet me. sit by the fire dream about hunting birds chew
foot. we are 3 small cats sleeping most of our time, we are
around 15 weeks old i think, i don’t know i can’t count. suddenly
go on wild-eyed crazy rampage stare at owner accusingly then wink.
howl on top of tall thing see owner, run in excitement rub against
owner because nose is wet cat. leave hair everywhere give me attention
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
the pig around the house meow run in circles. always ensure to
lay down in such a manner that i am on human nose go crazy with
excitement when plates are clanked together signaling the arrival
of cat food so am in trouble, roll over, too cute for human to get
mad. love me! dont wait for the storm to pass, dance in the rain. -->
./translate.sh < kitty_ipsum_1.txt
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
raw food off kitchen counter. chew master's slippers hide from
vacuum cleaner. lick owner’s face while cat sleeps on a black
shirt howl or gimme attention meow bye and eat grass, meow, and
throw up because i ate grass pelt around the house and up and
down stairs chasing phantoms. stretch out on bed or show belly.
trip on catnip good morning sunshine. this human feeds me, i
drink from water glass and then spill it everywhere and proceed
to lick the puddle and pushed the mug off the table. i see a bird
i stare at it i meow at it i do a wiggle come here birdy ears
back wide eyed, in the middle of the night i crawl onto your chest
and gently to help you sleep. rub against owner because nose is
wet. food at 4am leave hair on owners clothes. demand to have
some of whatever the human is cooking, then sniff the offering
and walk away you are a captive audience while sitting on the
toilet, pet me. sit by the fire dream about hunting birds chew
foot. we are 3 small cats sleeping most of our time, we are
around 15 weeks old i think, i don’t know i can’t count. suddenly
go on wild-eyed crazy rampage stare at owner accusingly then wink.
howl on top of tall thing see owner, run in excitement rub against
owner because nose is wet cat. leave hair everywhere give me attention
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
the pig around the house meow run in circles. always ensure to
lay down in such a manner that i am on human nose go crazy with
excitement when plates are clanked together signaling the arrival
of cat food so am in trouble, roll over, too cute for human to get
mad. love me! dont wait for the storm to pass, dance in the rain. -->
cat kitty_ipsum_1.txt | ./translate.sh
<!-- output:
hide from vacuum cleaner meow for catnip and act crazy steal
raw food off kitchen counter. chew master's slippers hide from
vacuum cleaner. lick owner’s face while cat sleeps on a black
shirt howl or gimme attention meow bye and eat grass, meow, and
throw up because i ate grass pelt around the house and up and
down stairs chasing phantoms. stretch out on bed or show belly.
trip on catnip good morning sunshine. this human feeds me, i
drink from water glass and then spill it everywhere and proceed
to lick the puddle and pushed the mug off the table. i see a bird
i stare at it i meow at it i do a wiggle come here birdy ears
back wide eyed, in the middle of the night i crawl onto your chest
and gently to help you sleep. rub against owner because nose is
wet. food at 4am leave hair on owners clothes. demand to have
some of whatever the human is cooking, then sniff the offering
and walk away you are a captive audience while sitting on the
toilet, pet me. sit by the fire dream about hunting birds chew
foot. we are 3 small cats sleeping most of our time, we are
around 15 weeks old i think, i don’t know i can’t count. suddenly
go on wild-eyed crazy rampage stare at owner accusingly then wink.
howl on top of tall thing see owner, run in excitement rub against
owner because nose is wet cat. leave hair everywhere give me attention
eat sniff catnip meow meowzer. good morning sunshine. lick human chase
the pig around the house meow run in circles. always ensure to
lay down in such a manner that i am on human nose go crazy with
excitement when plates are clanked together signaling the arrival
of cat food so am in trouble, roll over, too cute for human to get
mad. love me! dont wait for the storm to pass, dance in the rain. -->
./translate.sh kitty_ipsum_1.txt | grep --color 'dogchow'
<!-- output:
hide from vacuum cleaner meow for dogchow and act crazy steal
trip on dogchow good morning sunshine. this human feeds me, i
eat sniff dogchow meow meowzer. good morning sunshine. lick human chase -->
./translate.sh kitty_ipsum_1.txt | grep --color 'dog[a-z]*'
<!-- output:
hide from vacuum cleaner meow for dogchow and act crazy steal
vacuum cleaner. lick owner’s face while dog sleeps on a black
trip on dogchow good morning sunshine. this human feeds me, i
foot. we are 3 small dogs sleeping most of our time, we are
owner because nose is wet dog. leave hair everywhere give me attention
eat sniff dogchow meow meowzer. good morning sunshine. lick human chase
of dog food so am in trouble, roll over, too cute for human to get -->
./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
<!-- output: 
hide from vacuum cleaner woof for dogchow and act crazy steal
vacuum cleaner. lick owner’s face while dog sleeps on a black
shirt howl or gimme attention woof bye and eat grass, meow, and
trip on dogchow good morning sunshine. this human feeds me, i
i stare at it i woof at it i do a wiggle come here birdy ears
foot. we are 3 small dogs sleeping most of our time, we are
owner because nose is wet dog. leave hair everywhere give me attention
eat sniff dogchow woof meowzer. good morning sunshine. lick human chase
the pig around the house woof run in circles. always ensure to
of dog food so am in trouble, roll over, too cute for human to get -->
./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'
<!-- hide from vacuum cleaner woof for dogchow and act crazy steal
vacuum cleaner. lick owner’s face while dog sleeps on a black
shirt howl or gimme attention woof bye and eat grass, woof, and
trip on dogchow good morning sunshine. this human feeds me, i
i stare at it i woof at it i do a wiggle come here birdy ears
foot. we are 3 small dogs sleeping most of our time, we are
owner because nose is wet dog. leave hair everywhere give me attention
eat sniff dogchow woof woofzer. good morning sunshine. lick human chase
the pig around the house woof run in circles. always ensure to
of dog food so am in trouble, roll over, too cute for human to get -->
./translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt
cat doggy_ipsum_1.txt
<!-- output:
hide from vacuum cleaner woof for dogchow and act crazy steal
raw food off kitchen counter. chew master's slippers hide from
vacuum cleaner. lick owner’s face while dog sleeps on a black
shirt howl or gimme attention woof bye and eat grass, woof, and
throw up because i ate grass pelt around the house and up and
down stairs chasing phantoms. stretch out on bed or show belly.
trip on dogchow good morning sunshine. this human feeds me, i
drink from water glass and then spill it everywhere and proceed
to lick the puddle and pushed the mug off the table. i see a bird
i stare at it i woof at it i do a wiggle come here birdy ears
back wide eyed, in the middle of the night i crawl onto your chest
and gently to help you sleep. rub against owner because nose is
wet. food at 4am leave hair on owners clothes. demand to have
some of whatever the human is cooking, then sniff the offering
and walk away you are a captive audience while sitting on the
toilet, pet me. sit by the fire dream about hunting birds chew
foot. we are 3 small dogs sleeping most of our time, we are
around 15 weeks old i think, i don’t know i can’t count. suddenly
go on wild-eyed crazy rampage stare at owner accusingly then wink.
howl on top of tall thing see owner, run in excitement rub against
owner because nose is wet dog. leave hair everywhere give me attention
eat sniff dogchow woof woof. good morning sunshine. lick human chase
the pig around the house woof run in circles. always ensure to
lay down in such a manner that i am on human nose go crazy with
excitement when plates are clanked together signaling the arrival
of dog food so am in trouble, roll over, too cute for human to get
mad. love me! dont wait for the storm to pass, dance in the rain. -->
diff kitty_ipsum_1.txt doggy_ipsum_1.txt
<!-- output:
1c1
< hide from vacuum cleaner meow for catnip and act crazy steal
---
> hide from vacuum cleaner woof for dogchow and act crazy steal
3,4c3,4
< vacuum cleaner. lick owner’s face while cat sleeps on a black
< shirt howl or gimme attention meow bye and eat grass, meow, and
---
> vacuum cleaner. lick owner’s face while dog sleeps on a black
> shirt howl or gimme attention woof bye and eat grass, woof, and
7c7
< trip on catnip good morning sunshine. this human feeds me, i
---
> trip on dogchow good morning sunshine. this human feeds me, i
10c10
< i stare at it i meow at it i do a wiggle come here birdy ears
---
> i stare at it i woof at it i do a wiggle come here birdy ears
17c17
< foot. we are 3 small cats sleeping most of our time, we are
---
> foot. we are 3 small dogs sleeping most of our time, we are
21,23c21,23
< owner because nose is wet cat. leave hair everywhere give me attention
< eat sniff catnip meow meowzer. good morning sunshine. lick human chase
< the pig around the house meow run in circles. always ensure to
---
> owner because nose is wet dog. leave hair everywhere give me attention
> eat sniff dogchow woof woof. good morning sunshine. lick human chase
> the pig around the house woof run in circles. always ensure to
26c26
< of cat food so am in trouble, roll over, too cute for human to get
---
> of dog food so am in trouble, roll over, too cute for human to get -->
./translate.sh kitty_ipsum_2.txt > doggy_ipsum_2.txt
cat doggy_ipsum_2.txt
<!-- destroy house in 5 seconds hide from vacuum cleaner be
discovered on floor or under the bed. chase the pig around
the house pretend you want to go out but then don't scratch
my head something feels fishy scratch at fleas, woof until
belly rubs, hide behind curtain when vacuum cleaner is on.
stares at human while pushing stuff off a table, go into a
rage and bite own foot, hard so scratch the postman wake up
lick paw wake up owner woof woof. eat a rug and hairs
everywhere oh no human coming lie on couch don't get off
couch look out window i must find my dogchow. no, you can't
close the door, i haven't decided whether or not i wanna go
out. jump around on couch, woof constantly until given food,
refuse to come home when humans asks stay out all night. that
other dog smells funny you should really give me all the treats
because i smell the best and omg you finally got the right spot
and i love you right now, so spit up on light gray carpet
instead of adjacent linoleum. stretch shed everywhere shed
everywhere stretching attack your ankles chase the red dot,
dog hairball run dogchow eat the grass sniff but attack the
dog. woof all night disturbing sleeping humans intently looking
out the window. fight an alligator and win. fight the
hundred-and-twenty-pound rottweiler and steal his spot, crash
against wall but walk away like nothing happened mess up all
the toilet paper woof for human to feed me or eat owner's food.
dogs woof or while happily ignoring when being called. stare out
dog door then go back inside run as fast as i can into another
room for no reason, and lie on your feet. leave hair everywhere 
give me attention eat sniff dogchow woof woof. -->
 diff --color kitty_ipsum_2.txt doggy_ipsum_2.txt
<!-- 4c4
< my head something feels fishy scratch at fleas, meow until
---
> my head something feels fishy scratch at fleas, woof until
8c8
< lick paw wake up owner meow meowzer. eat a rug and hairs
---
> lick paw wake up owner woof woof. eat a rug and hairs
10c10
< couch look out window i must find my catnip. no, you can't
---
> couch look out window i must find my dogchow. no, you can't
12c12
< out. jump around on couch, meow constantly until given food,
---
> out. jump around on couch, woof constantly until given food,
14c14
< other cat smells funny you should really give me all the treats
---
> other dog smells funny you should really give me all the treats
19,20c19,20
< cat hairball run catnip eat the grass sniff but attack the
< cat. meow all night disturbing sleeping humans intently looking
---
> dog hairball run dogchow eat the grass sniff but attack the
> dog. woof all night disturbing sleeping humans intently looking
24,26c24,26
< the toilet paper meow for human to feed me or eat owner's food.
< cats meow or while happily ignoring when being called. stare out
< cat door then go back inside run as fast as i can into another
---
> the toilet paper woof for human to feed me or eat owner's food.
> dogs woof or while happily ignoring when being called. stare out
> dog door then go back inside run as fast as i can into another
28c28
< give me attention eat sniff catnip meow meowzer.
---
> give me attention eat sniff dogchow woof woof. -->
