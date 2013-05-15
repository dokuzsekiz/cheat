--- 
ln: |
  To create a symbolic link:
  
    $ ln -s original/file new/symbolic/link
  
  
  For example, assuming you are in a Rails app:
  
    $ ln -s ../vendor/assets/swf/swf.file public
    OR
    $ ln -s ../vendor/assets/swf/swf.file public/swf.file
  
  would create a new symbolic link of public/swf.file to vendor/assets/swf/swf.file. Had I not specified the .., then the link would have not worked.
  
  
  To test that you have the paths correct, you can do 
  
    $ file new/symbolic/link
  
  If you 'broken symbolic link to ...' in the output, make sure that you specified the original file path relative to the directory that the file will live in.

