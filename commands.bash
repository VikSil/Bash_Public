# history of all previous commands
history
# history of last 9 commands
history 9
# to execute 29th command from the history
!29
# to execute 10th command from the bottom of history list
!-10
# to execute the last command again
!!
# to execute the most recent version of a command (with opts and args from history)
!ls
# find how may commands are retained in history (env variable)
echo $HISTSIZE
#-------------------------------------------
# find the type of a command or its location
type -a somecommand
which -a somecommand
where somecommand
whereis somecommand
command -V somecommand # verbose info

#-------------------------------------------
# view all aliases to a command
alias 

# set a new alias for the session
alias lh="ls -lah"

# run as a command, not as an alias by escaping
\ls

#-------------------------------------------
# find manual for an ambigous command/file
man -f somecommand
whatis somecommand # works the same as above
man -k somekeyword # looks at filename and description (k=keyword)
apropos somekeyword # works the same as above

# list of inbuilt docs
ls /usr/share/doc

# get help with a command
man somecommand # will display the first found
man 5 somecommand # 5 denotes the section found by previous commands
somecommand --help
info keyword # finds the section in the docs, press U for back, L for forward, Shift+H for all shortcuts

# search in a manpage
/what_to_search_for # press n for forward, Shitf+N for backwards
#-------------------------------------------

#-------------------------------------------

#-------------------------------------------

#-------------------------------------------