# variable assignment must have no spaces, otherwise it will be interpreted as a command with opitons
variable='some value' # correct
variable = 'some other value' # incorrect, spaces around = sign


# values are accessed via $ symbol
variable1='Something'
variable2='Else'
variable=$variable1' '$variable2
echo $variable # will output "Something Else"

variable=`pwd` # will execute pwd command when the variable's value is accessed
read VARIABLE # will wait to read from stdin

# single quotes will act like a static string literal, ignoring everything
echo 'Value of PATH env variable is $PATH'
# double quotes will act like a formatted string literal (commands require brackets)
echo "Value of PATH env variable is $PATH"
echo Today is $(date)
# backticks will act like a template literal for commands
echo Today is `date`

# escaping is done via backslash
echo 'service costs \$100 and PATH is $PATH'

echo "Hello $1" #placeholder for arguments passed to the script ($0 is the name of the script itself)
echo $? # returns the exit code of the previous command

# GLOBS
# ? - any single character
echo /etc/???? # all 4 letter things in /etc
echo /etc/*.??? # all things in /etc with three char extension
# [] - any one of the characters in the brackets
echo /etc/[abc]* # all things in /etc starting with either a, b or c
echo /etc/*[0-9]* # all things in /etc with at least one number in the name
# ! - negation
echo /etc/[!RA]* # all things in /etc that don't start with R or A
echo /etc/*[!0-9]* # all things in /etc that don't contain numbers in the name

# generally don't use globs with ls command, but if you have to then use -d flag to output dirs not their content

# output all env variables and their values
env
# find specific env variables
env | grep VARIABLENAME # env variables are uppercase by convention

# change local varable into an environment variable
export variablename
export variablename='value'
# remove former local variable from environment
unset variablename

# adding to PATH variable
PATH=/some/new/dir:$PATH
