--- 
vim: "Cursor movement\n\n\
  h - move left\n\
  j - move down\n\
  k - move up\n\
  l - move right\n\
  ctrl-b - page up\n\
  ctrl-f - page down\n\
  % - jump to matching brace\n\
  w - jump by start of words (punctuation considered words)\n\
  W - jump by words (spaces separate words)\n\
  e - jump to end of words (punctuation considered words)\n\
  E - jump to end of words (no punctuation)\n\
  b - jump backward by words (punctuation considered words)\n\
  B - jump backward by words (no punctuation)\n\
  ge - jump backward to end of words (punctuation considered words)\n\
  gE - jump backward to end of words (no punctuation)\n\
  0 - (zero) start of line\n\
  ^ - first non-blank character of line\n\
  $ - end of line\n\
  gg - Go to first line\n\
  [N]G - Go To line N. No N: last line\n\
  Note: Prefix a cursor movement command with a number to repeat it. For example, 4j moves down 4 lines.\n\n\
  Insert Mode - Inserting/Appending text\n\n\
  i - start insert mode at cursor\n\
  I - insert at the beginning of the line\n\
  a - append after the cursor\n\
  A - append at the end of the line\n\
  o - open (append) blank line below current line (no need to press return)\n\
  O - open blank line above current line\n\
  ea - append at end of word\n\
  Esc - exit insert mode\n\n\
  Editing\n\n\
  r - replace a single character (does not use insert mode)\n\
  J - join line below to the current one\n\
  cc - change (replace) an entire line\n\
  cw - change (replace) to the end of word\n\
  c$ - change (replace) to the end of line\n\
  s - delete character at cursor and subsitute text\n\
  S - delete line at cursor and substitute text (same as cc)\n\
  xp - transpose two letters (delete and paste, technically)\n\
  u - undo\n\
  ctrl-r - redo\n\
  . - repeat last command\n\
  ~ - switch case\n\
  g~iw - switch case of current word\n\
  gUiw - make current word uppercase\n\
  guiw - make current word lowercase\n\
  >> - indent line one column to right\n\
  << - indet line one column to left\n\
  == - auto-indent current line\n\
  ddp - swap current line with next\n\
  ddkP - swap current line with previous\n\n\
  Cut and Paste\n\n\
  dd - delete (cut) a line\n\
  dw - delete the current word\n\
  x - delete current character\n\
  X - delete previous character\n\
  D - delete from cursor to end of line\n\
  yy - yank (copy) a line\n\
  2yy - yank 2 lines\n\
  yw - yank word\n\
  y$ - yank to end of line\n\
  p - put (paste) the clipboard after cursor/current line\n\
  P - put (paste) before cursor/current line\n\
  :set paste - avoid unexpected effects in pasting\n\n\
  Visual Mode - Marking text\n\n\
  v - start visual mode, mark lines, then do command (such as y-yank)\n\
  V - start Linewise visual mode\n\
  o - move to other end of marked area\n\
  U - upper case of marked area\n\
  ctrl+v - start visual block mode\n\
  O - move to Other corner of block\n\
  aw - mark a word\n\
  ab - a () block (with braces)\n\
  aB - a {} block (with brackets)\n\
  ib - inner () block\n\
  iB - inner {} block\n\
  Esc - exit visual mode\n\n\
  Visual Mode - Commands\n\n\
  > - shift right\n\
  < - shift left\n\
  c - change (replace) marked text\n\
  y - yank (copy) marked text\n\
  d - delete (cut) marked text\n\
  ~ - switch case\n\n\
  Visual Mode - Cut and paste\n\n\
  1. Place the cursor at the start of your text.\n\
  2. ma (marks the location as point 'a')\n\
  3. Place the cursor at the end of your text.\n\
  4. d'a (cuts back to location 'a')\n\n\
  Exiting\n\n\
  :w - write (save) the file, but don't exit\n\
  :wq - write (save) and quit\n\
  :x - same as :wq\n\
  :q - quit (fails if anything has changed)\n\
  :q! - quit and throw away changes\n\n\
  Search/Replace\n\n\
  /pattern - search for pattern\n\
  ?pattern - search backward for pattern\n\
  n - repeat search in same direction\n\
  N - repeat search in opposite direction\n\
  :%s/old/new/g - replace all old with new throughout file\n\
  :%s/old/new/gc - replace all old with new throughout file with confirmations\n\n\
  Working with multiple files\n\n\
  :e filename - Edit a file in a new buffer\n\
  :n **/*.pl - Open all perl files under the current directory, recursively\n\
  :tabe filename - Edit a file in a new tab (Vim7, gVim)\n\
  :bnext (or :bn) - go to next buffer\n\
  :bprev (or :bp) - go to previous buffer\n\
  :bd - delete a buffer (close a file)\n\
  :sp filename - Open a file in a new buffer and split window\n\
  ctrl-w s - Split windows\n\
  ctrl-w w - switch between windows\n\
  ctrl-w q - Quit a window\n\
  ctrl-w v - Split windows vertically\n\n\
  Tabs (Vim7)\n\n\
  gt - Next tab\n\
  gT - Previous tab\n\
  :tabr - First tab\n\
  :tabl - Last tab\n\
  :tabm [N] - Move current tab after tab N. No N: last. N=0: first.\n\
  $vim -p file1 file2 fileN  - Open multiple files in different tabs (vim7) \n\n\
  Command Line Options\n\n\
  $vim -c \"vim command\" file - execute an editor command on startup\n\n\
  Commands\n\n\
  :setlocal fileformat=dos|unix\n\
  :setlocal fileencoding=utf-8\n\n\
  More help\n\n\
  :help - main help portal (with links to more help pages)\n\
  :viusage - show a huge cheat sheet listing every command"
