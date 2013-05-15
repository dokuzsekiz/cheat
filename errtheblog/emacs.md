--- 
emacs: "oh sh*t - what to do if you've screwed something up\n\
  ================================================================================\n\
  C-_ / C-x u / C-/      undo (undo)\n\
  C-g                    abort command sequence (keyboard-quit)\n\
  C-x C-c                quit (save-buffers-kill-terminal)\n\
  M-x menu-bar-mode RET  toggle the menu bar on or off (menu-bar-mode)\n\
  M-x revert-buffer RET  reload current buffer from disk\n\
  C-x C-s                save the current file\n\n\
  files, buffers & windows\n\
  ======================================================================\n\
  C-x C-f            open or create a file (open)\n\
  C-x C-s            save the current file/buffer\n\
  C-x C-w            save as\n\
  C-x k              kill (close) a file/buffer\n\
  C-x b              switch to another buffer/window (choose from prompt)\n\
  C-x C-b            list all open buffers (list-buffers)\n\
  C-x 2              split window horizontally\n\
  C-x 3              split window vertically\n\
  C-x 1              kill (close) other window\n\
  C-x 0              kill (close) this window\n\n\
  moving around\n\
  ======================================================================\n\
  C-f / C-b          forward / back one character\n\
  M-f / M-b          forward / back one word\n\
  C-n / C-p          next / previous line\n\
  C-a / C-e          beginning of / end of line\n\
  M-a / M-e          backward / forward sentence\n\
  M-{ / M-}          backward / forward paragraph\n\
  M-< / M->          beginning of / end of buffer\n\
  C-M-f / C-M-b      forward / back one \"sexp\"\n\
  C-v / M-v          page down / page up\n\
  C-M-v / S-C-M-v    page down / page up in other window\n\n\
  select, cut, copy, paste\n\
  ======================================================================\n\
  C-x h              select all (select-whole-buffer)\n\n\
  search and replace\n\
  ======================================================================\n\
  C-s                search (isearch-foward)\n  C-s                next match; use twice to repeat last search\n  C-r                previous match\n  RET                stop here\n  C-g                stop and go back to starting location\n\n\
  M-%                find & replace (query-replace)\n\
  C-M-%              regexp find & replace\n  y                  replace current match\n  n                  skip current match\n  !                  replace all\n  RET                stop here\n  C-g                stop and go back to starting location\n\n\n\
  coding\n\
  ======================================================================\n\
  M-g g                      goto line\n\
  M-;                        comment/uncomment selection\n\
  C-M-\\                      re-indent (reformat) selection\n\
  M-x toggle-truncate-lines  switches between line-wrap and no-line-wrap\n\n\
  spelling\n\
  ======================================================================\n\
  M-x flyspell         \"live\" spellchecking (flyspell)\n\
  M-$                  spell check (ispell-word)\n\n\
  bookmarks - C-x r\n\
  ======================================================================\n\
  C-x r m              set a bookmark at the current location (e.g. in a file)\n\
  C-x r b              jump to a bookmark\n\
  C-x r l              list your bookmarks\n   a                 show annotation for the current bookmark\n   A                 show all annotations for your bookmarks\n   d                 mark various entries for deletion (\xE2\x80\x98x\xE2\x80\x99 \xE2\x80\x93 to delete them)\n   e                 edit the annotation for the current bookmark\n   m                 mark various entries for display and other operations, (\xE2\x80\x98v\xE2\x80\x99 \xE2\x80\x93 to visit)\n   o                 visit the current bookmark in another window, keeping the bookmark list open\n   C-o               switch to the current bookmark in another window\n   r                 rename the current bookmark\n\
  M-x bookmark-delete  delete a bookmark by name\n\n\
  shell\n\
  ======================================================================\n\
  M-!                run a shell command\n\
  M+x shell          open a shell buffer\n\
  C+u M+x shell      open a new shell buffer\n\
  M+x term           open a terminal emulator\n\
  C+u M+x term       open a new terminal emulator\n\n\
  misc\n\
  ======================================================================\n\
  C-x C-+            increase font size; C-+ to repeat\n\
  C-x C--            decrease font size; C-- to repeat\n\n\
  getting help\n\
  ======================================================================\n\
  C-h b              list all key bindings\n\
  C-h w <function>   list all key bindings for <function>\n\
  C-h c <sequence>   list function bound to <sequence>\n\
  C-h k <sequence>   show help for function bound  to <sequence>\n\
  C-h i              show help/tutorial (Use C-x k to close it)\n\
  C-x C-h            list key bindings starting with C-x\n\
  C-c C-h            list key bindings starting with C-c\n\n\
  notes\n\
  ======================================================================\n\
  C-x means \"Control-x\"\n\
  M-x (usually) means \"Alt-x\"\n\
  S-x means \"Special-X\", typically \"Windows-X\" (or clover-X on Apple?)\n\n\
  Key bindings can be changed by your .emacs file and the major- or\n\
  minor-mode you are in. They could be different than what you see here.\n\n\
  more cheat sheets and help\n\
  ======================================================================\n\
  cheat emacs_basics\n\
  cheat emacs_tips\n\
  cheat emacs-ruby      - ruby support in emacs (sheet has been deleted?)\n\
  cheat emacs_psvn      - svn supprort in emacs\n\
  cheat emacs_slime     - \"superior\" lisp support in emacs\n\n\
  http://www.gnu.org/software/libtool/manual/emacs/\n\
  http://refcards.com/docs/wingb/xemacs/xemacs-refcard-a4.pdf\n\
  http://www.stevenchan.us/files/Notesheet-Emacs.pdf\n\
  https://ccrma.stanford.edu/guides/package/emacs/emacs.html\n\
  http://www.rgrjr.com/emacs/emacs_cheat.html"
