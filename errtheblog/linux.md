--- 
linux: |-
  File in Use?
    lsof | grep <file>  (case-sensitive)
  
  Check the dependecy of a binary file:
    objdump -p a.exe | grep 'DLL Name'
  
  To run a process in the background, regardless of whether the terminal window is closed:
    nohup <some command> &
  
    eg. nohup ruby /u/app/qbglc/current/script/runner -e development 'load "/u/app/qbglc/current/script/app/some_script.rb"' &
  
  Disk Usage:
  $ du -sh *
  $ df -h
  
  Version:
  $ uname -a
  or
  $ cat /etc/*-release
  
  Find (suppress err):
  $ find <dir> -name <pattern> 2>/dev/null
