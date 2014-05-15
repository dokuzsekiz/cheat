#!/bin/bash
# author : ypetya@gmail.com

# REPO=https://github.com/ypetya/cheat.git
# REPO=ssh://git@bitbucket.org/kisp/cheat.git
REPO=https://kisp@bitbucket.org/kisp/cheat.git

if [ ! $CHEAT ] ; then 
  $CHEAT=~/.cheat
fi

# git is a requirement of this script
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ ! $GIT_IS_AVAILABLE -eq 0 ]; then echo "You have to instal git!"; exit; fi

print_help() { print_cheat README; }

#
# handle repo
# ===========
#
# this function fetches the repository. on a read operation there is only one fetch per day allowed
#
fetch_repo() {
  if [ ! -d $CHEAT ]; then
    git clone $REPO $CHEAT

  fi

  # daily one fetch unless forced to do this!

  if [ $# -eq 0 ] && [ -e "$(find ~/.cheat_pull_lock -atime -1 2>&1)" ]; then
    echo "From cache:" 
    return
  else
    touch ~/.cheat_pull_lock
  fi

  DIR=$(pwd)
  cd $CHEAT

  git pull --rebase --quiet origin master 2>&1 > /dev/null

  cd $DIR
}

push_repo() {
  DIR=$(pwd)
  cd $CHEAT

  git add . -A
  git commit -a -m "$1"
  git push origin master

  cd $DIR
}

#
# handle item
# ===========
#
# displaying a sheet:
# this function looks into the root directory for a file with ".md" extension
# if there is not a file named <parameter>.md then looks into the sub directory
# errtheblog. And prints it out
#
print_cheat() {
  fetch_repo

  if [ -e $CHEAT/$1.md ]; then
    cat $CHEAT/$1.md
  elif [ -e $CHEAT/errtheblog/$1.md ]; then
    cat $CHEAT/errtheblog/$1.md
  elif [ -e ~/Desktop/$1.md ]; then
    cat ~/Desktop/$1.md
  fi
}

# editing a cheat opens your favorite editor

edit_cheat() {
  fetch_repo "force"
  ${EDITOR:-vi} $CHEAT/$1.md
  push_repo $1
}


#
# handle files
# ============
#
# parses the command line arguments.
#
parse_command() {
  if [ $# -eq 0 ]; then
    echo 'No params'
    print_help
  else
	  while getopts ":hilfe:d:" optname
	    do
	      case "$optname" in
		"h")
		  print_help
		  ;;
		"l")
		  print_list
		  ;;
		"f")
		  fetch_repo "force"
		  ;;
		"e")
		  edit_cheat $OPTARG
		  ;;
		"i")
		  import_cheats
		  ;;
		"d")
		  print_cheat $OPTARG
		  ;;
	      esac
	  done
  fi
}

#
# importing sheets from the original site cheat.errtheblog.com/s/sheets
# !!! this feature is experimental
#
import_cheats() {

  fetch_repo "force"

  mkdir $CHEAT/errtheblog -p
  curl -s $PROXY_ARGS http://cheat.errtheblog.com/y/sheets | grep "  " | tr -d " " | while read line
  do
	curl -s $PROXY_ARGS http://cheat.errtheblog.com/y/$line > $CHEAT/errtheblog/$line.md
  done
  
  push_repo 'errtheblog cheats imported'
}

#
# prints a simple list of cheat sheets. (including sub directories)
#
print_list() {
  fetch_repo

  DIR=$(pwd)
  cd $CHEAT

  #find ./ -type f -iname '*.md' -printf '%f\n' | sed 's/\..*//' | sort
  ls ~/Desktop/*.md *.md errtheblog/*.md | sed 's/\.md//' | sed 's/errtheblog\///' | sed 's/.*Desktop\///' | sort

  cd $DIR
}

parse_command $*

