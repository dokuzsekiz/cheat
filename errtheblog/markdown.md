--- 
markdown: |-
  *italic*   **bold**
  _italic_   __bold__
  
  Links and images include the text or alternate text in preceding brackets:
  An [Inline URL](http://url.com/ "With a title")
  A [reference to example link][id]. This would be followed later by:
  [id]: http://example.com/  "Title"
  
  Inline (titles are optional):
  
  ![an inline image](/path/img.jpg "Title")
  ![a referenced image][id] would be followed later by:
  [id]: /url/to/img.jpg "Title"
  
  Header 1
  ========
  Header 2
  --------
  or
  # Header 1 #
  ## Header 2 ##
  (closing #'s are optional)
  
  1.  First ordered list item
  2.  Second item
  
  *   An unordered list item.
  
      With multiple paragraphs.
  
  *   Another unordered list item
      1. With a nested item below it
  
  > Email-style angle brackets
  > are used for blockquotes.
  
  > > And, they can be nested.
  
  > #### Headers in blockquotes
  > 
  > * You can quote a list.
  > * Etc.
  
  `<code>` spans are delimited by backticks.  You can include literal
  backticks like `` `this` ``.
  
      This is a preformatted code block. It must be indented
      either by at least four spaces or a tab
  
  
  This is a normal <p>paragraph</p>.
  
  
  Three or more dashes or asterisks make a horizontal rule:
  ---
  * * *
  - - - -
  
  Footnote Links
  
  To create footnote links reference it like so ` [word][1] ` and then
  create a link to it somewhere in the document.
  
      ` [1]: <url> "Optional Title"
  
  
  table
  
  Name    |   Age
  --------|------
  Fred    |   29
  Jim     |   47
  Harry   |   32
  
  You can also add an anchor for an element such as Headers, then you can
  link to this anchor anywhere. For example:
  
  ## [This header is anchored](id:anchor1)
  
  To jump to the above header just clikc this [link](#anchor1) and a web
  browser will autoscroll to it.
  
  Finally, end a line with two or more spaces to do a manual line break
