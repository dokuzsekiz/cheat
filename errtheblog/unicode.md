--- 
unicode: "How to printf a Chinese char to Linux command line ( terminal ) ?\n\
  1. Check terminal encoding ( mostly UTF-8 )\n\
  2. Check Source codes file encoding ( in vim, :set encoding , mostly UTF-8 )\n\
  3. In c++ source file, literal chinese is encoded with source code encoding\n\
  and compiled to bytes into your binary. \n\
  So this works : printf(\"%s\\n\", (const char*) _chinese_bytes_buffer_ );\n\n\
  In Qt3, QString has a method called utf8(), this returns a QCString that can\n\
  be directly casted to raw bytes with (const char*) opeartor.\n\n\
  These raw bytes will be utf8 encoding, and will be interpreted and displayed\n\
  correctly on a Linux console that has UTF-8 encoding.\n\n\
  Of course you need the Chinese font to display Chinese codepoints.\n\n\
  ========\n\
  To make your script cope with different character sets, you can set the $KCODE global (or specify the -K option to the interpreter):\n\n\
  $KCODE='UTF8'\n\n\
  Was originally introduced to signal the Ruby interpreter to go into a certain encoding mode. It's currently (mis)used by several libraries to set the global encoding of text (ie. jcode and activesupport)\n\n\
  Values supported in Ruby1.8 appear to be:\n\
  EUC ('-e', 'e')\n\
  SJIS ('-s', 's')\n\
  UTF8 ('-u', 'u')\n\
  NONE ('-n', 'n')\n\n\
  When manipulating strings, include the 'jcode' library:\n\n\
  require 'jcode'\n\n\
  This will extend the string class to behave in a multi-byte fashion when appropriate, as well as introducing:\n\n\
  \"fish\".mbchar? # Returns the index of the first multibyte character in the string, or nil\n\
  \"cat\".jlength  # The length, in characters rather than bytes, of the string\n\n\
  You can get even more Unicode support by using ActiveSupport.\n\n\
  require 'rubygems' rescue LoadError\n\
  require 'active_support'\n\n\
  $KCODE='UTF8'\n\
  \"Caf\xC3\xA9\".chars.upcase"
