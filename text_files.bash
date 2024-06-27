# display 13 first lines of a file
head -13 /path/filename.txt
# display all but last 6 lines
head -n -6 /path/filename.txt
# display 10 last lines of a file
tail -n 10 /path/filename.txt
tail /path/filename.txt # 10 is default
# display from 25th line onwards
tail -n +25 /path/filename.txt

# follow tail
tail -f /path/filename.txt

#-------------------------------------------

# output to file (with override)
echo "Some text" > filename.txt
# output to file (with uppend)
ls -lh >> filename.txt

# output errors (STDERR)
ls /doesntexist 2> error.txt # 2 means second stream (first being STDOUT)

# output everything
ls /path &> output_all.txt # ampersand means both 1st and 2nd stream
ls /path > stdout.txt 2> stderr.txt # output both to different files

# redirect input (stdin) to a file
cat > savetofile.txt

# force read from file instead of stdin and save to new file
tr 'a-z' 'A-Z' < inputile.txt > outputfile.txt # tr-anslates lovercase to uppercase