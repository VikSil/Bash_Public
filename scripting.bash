#!/bin/sh #indicates that the script should be interpreted by sh
#!/bin/bash #indicates that the script should be interpreted by bash


echo 'echo "Hello world"' >script.sh # create a script file
sh script.sh # execute the script
./script.sh # 'opening' a script file runs it, but by default .sh files are nonexecutable
chmod +x ./script.sh # add executable property to a file
chmod a+x ./script.sh # make a file executable for all users

exit 1 # exit with code 1 (can be retrieved via $? variable)

#-------------------------------------------
# IF STATEMENT

if somecommand; then # i.e. if somecommand returns exit code 0
    # do stuff here
elif othercommand; then
    # do stuff here
else
    # do other stuff here
fi

#-------------------------------------------
# IF TESTS

test -f /path/somefile # test if the file exists
test ! -f /path/somefile # test if the file does not exist
test -d /dirname # test if the directory exists
test -x `which somecommand` # find the command file and check (-x) if user has permission to execute
test 1 -eq 1 -a "$1" = "a" # equality check with AND (-a) and argument input 
test 1 -ne 1 -o "$1" != "a" # inequality check with OR (-o) and argument input 
test file1 -gt file2 # compare file by dates  

# test is substituted by square brackets
if [ -f /path/somefile ]; then  # spaces inside square brackets are important!!

#-------------------------------------------
# CASE STATEMENT

case "$1" in
hello|hi)
    echo "hello yourself"
    ;;
goodbye)
    echo "nice to have met you"
    ;;
*)
    echo "I don't understand that"
esac

#-------------------------------------------
# FOR LOOP

SERVERS="servera serverb serverc"
for S in $SERVERS; do
    echo "Doing something to $S"
done

for num in `seq 1 12`; # sequence/range
do
    touch test$num # make 12 numbered files with 'test' prefix in filename
done  

#-------------------------------------------
# WHILE LOOP
i=0
while [ $i -lt 10 ]; do # spaces inside square brackets are important!!
    echo $i
    i=$(($i +1)) # the $(()) holds an arithmetic command 
done