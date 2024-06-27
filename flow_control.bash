# The semicolon ; character can be used to run multiple commands, one after the other.
# Each command runs independently and consecutively.
# Regardless of the result of the first command, the second command runs once the first has completed,
# then the third and so on.

command1; command2; command3
echo Hello; echo Linux; echo Student

# The double ampersand && acts as a logical "and".
# If the first command is successful, then the second command will also run.
# If the first command fails, then the second command will not run.

command1 && command2
date && echo "is today" 


# The double pipe || is a logical "or".
# If the first command runs successfully, the second command is skipped.
# If the first command fails, then the second command is run. 

ls /etc/junk || echo "directory does not exist"
false || echo This will execute instead
true || echo Nothing to see here

