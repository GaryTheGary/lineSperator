
alias eecs485="cd /Users/wenjiefang/Desktop/485p4";
alias startVM="vagrant up; vagrant ssh;"
alias eecs482="cd /Users/wenjiefang/Desktop/eecs482_p3_git";
alias actvenv="virtualenv -p python3 venv; source venv/bin/activate;"

alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH


fill="=== "

reset_style='\[\033[00m\]'

status_style=$reset_style'\[\033[0;32m\]' # gray color; use 0;37m for lighter color

prompt_style=$reset_style

command_style=$reset_style'\[\033[1;29m\]' # bold black

# Prompt variable:

PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "

# Reset color for command output

# (this one is invoked every time before a command is executed):

trap 'echo -ne "\033[00m"' DEBUG

function prompt_command {

# create a $fill of all screen width minus the time string and a space:

let fillsize=${COLUMNS}-9

fill=""

while [ "$fillsize" -gt "0" ]

do

fill="-${fill}" # fill with underscores to work on

let fillsize=${fillsize}-1

done

# If this is an xterm set the title to user@host:dir

case "$TERM" in

xterm*|rxvt*)

bname=`basename "${PWD/$HOME/~}"`

echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"

;;

*)

;;

esac

}

PROMPT_COMMAND=prompt_command
