vi filename # create or open a file

i # enter edit mode (no Enter required)
I # enter edit mode and jump to the start of the line
a # append - move one char right and enter edit mode
A # append - move to the end of a line and enter edit mode
o # open a new empty line below the current line
O # open a new empty line above the current line
# press Esc to exit edit mode

#-------------------------------------------
# SAVE AND EXIT

:wq # write out and quit
:x # save and close
:wq! # write out to a read-only file and quit
ZZ # save and close

:q! # quit, no changes
:e! # discard changes and reload the file

:w! # write out to a read-only file

#-------------------------------------------
# COMMAND MODE

j # down
k # up
h # right
l # left
w # next word
# any of the above can be used in form number + command, e.g. 8h is 'move eight places to the right'
e # end of current word
b # back to previous beginning of word
$ # end of current line
0 # start of current line
3G # jump to third line, i.e. nG goes to nth line
Shift + G # jump to last line
dw # delete current word (optional numerical prefix)
x # delete a character (optional numerical prefix)
X # delete a character to the left (optional numerical prefix)
u # undo (optional numerical prefix)
dd # delete the current line  (optional numerical prefix to include next lines)
D # delete from current position to the end of the line
p # put the clipbord as the next line
P # put the clipboard to the left of the current word
J # remove the next carrige return/ join next line to the current one (optional numerical prefix)
yw # yank (copy) current word (optional numerical prefix)
/keyword # jump to the start of the next occurance of keyword
n # next occurance of the keyword (in the same direction as the search)
?keyword # jump to the start of the previous occurance of keyword
:%s/keyword/replacement/g # globaly search for keyword and replace it
~ #toggle case and move to next char

cw # entry mode replacing only the current word