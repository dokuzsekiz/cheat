--- 
vi: "Primary Commands\n\
  d  delete\n\
  y  copy\n\
  c  change\n\
  r  replace\n\
  p  paste\n\
  u  undo\n\
  a  append\n\
  o  new line\n\
  x  delete char\n\
  control-R  redo\n\n\
  Edit\n\
  dd dw d4j  delete line, delete word, delete 5 lines\n\
  yy yw  copy line, copy word\n\
  cw change word\n\
  p  paste a line\n\
  :s/a/b/  replace a with b\n\n\
  Navigation\n\
  h j k l  left, down, up right, one character/line at a time\n\
  w b e  next word, back word, end of word\n\
  W B E  same, but ignores punctuation\n\
  gg  beginning of file\n\
  G  end of File\n\
  0  first column in a line\n\
  ^  beginning of line\n\
  $  end of line\n\
  /  enter a string, searches for string\n\
  control-b  page up\n\
  control-f  page down\n\
  100G - goto line 100\n\n\
  Modes\n\
  Escape  command mode\n\
  i  insert mode\n\
  v  visual mode\n\
  V  visual (line) mode\n\n\
  File\n\
  :u undo\n\
  :q quit\n\
  :q! force quit\n\
  :wq write, quit\n\
  :/<string>  Search for next occurrence of <string>\n\
  :?<string> Search for previous occurrence of <string>\n\
  :%s/<str_a>/<str_b>/g Replace all str_a with str_b in current buffer\n\n\
  Remote files:\n\
  vi scp://username@password:host/path/to/file/ open\n\
  :e  scp://username@password:host/path/to/file/ open inside vi\n\
  :let g:netrw_scp_cmd='scp -i private_key.pub' to use private keys\n\n\
  Recover\n\
  :rec <swapfile>"
