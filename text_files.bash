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

#-------------------------------------------
# sorting
head -5 /etc/passwd > passwords.txt
sort passwords.txt # will send sorted file contents to stdout (file unchanged)
# output data delimited by a collon (-t:) reverse (-r) sorted by a numerical (-n) 3rd kolumn (-k3)
sort -t: -r -n -k3 passwords.txt 

cat >os.txt # writes stdin to file
1970,Unix,Richie
1987,Minix,Tanenbaum
1970,Unix,Thompson
1991,Linux,Torvalds
# sort  data delimited by comma (-t,) by column2, then by numerical column1, then by column3
sort -t, -k2 -k1n -k3 os.txt

#-------------------------------------------
# file stats - word count
wc /etc/passwd* # output file stats and total if more than one file
# number of lines (-l), words (-w), bytes (-c), file name
# count lines of output 
ls /etc | wc -l

#-------------------------------------------
# output partial content
# 'cut' out and display columns (file unchanged)
cut -d: -f1,5-7 passwords.txt # from file delimited by colon (-d:) out put fields 1 and 5 to 7

ls -l | cut -c1-11,50- # from file list display characters (-c) 1 to 11 and 50 till end

#-------------------------------------------
# find/filter for - grep
ls -lAh /path | grep keyword # find files with keyword in file name in /path
grep -c network /etc/passwd # count the number of occurances of "network" in passwd file
grep -n network /etc/passwd # output occurances of "network" with line numbers from original file (-n)
grep -v sys /etc/passwd # output NON-occurances (-v) of "sys"
grep -i serv /etc/passwd # output occurance of "serv" case-insensitively (i.e. service and Server)
grep -iw network /etc/passwd # output lines where ""
grep ':...:' /etc/passwd # output all lines with a three number port
grep [^0-z:/] /etc/passwd # output lines that have something other than any numbers, any letters, a collon or a slash
grep '/r[ou]*' /etc/passwd # output lines containing "/r" followed by zero or more occurances of  o or u, i.e. /root /run /resolve
grep 'ee*' /etc/passwd # output all ines that have at least ONE "e" character (since * is ZERO or more)
grep -E '/s?bin/' /etc/passwd # output all lines that have zero or one "s" in the phrase, i.e. "sbin" and "bin", using Extended RegEx (-E)