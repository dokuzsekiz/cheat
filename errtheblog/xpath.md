--- 
xpath: |
  XPath examples
  ==============
  //hr[@class='edge' and position()=1]
      every first hr of 'edge' class
  
  //table[count(tr)=1 and count(tr/td)=2]
      all tables with 1 row and 2 cols
  
  //div/form/parent::*
      all divs that have form
  
  ./div/b
      a relative path
  
  //table[parent::div[@class="pad"] and not(@id)]//a
      any anchor in a table without id, contained in a div of "pad" class
  
  /html/body/div/*[preceding-sibling::h4]
      give me whatever after h4
  
  //tr/td[font[@class="head" and text()="TRACK"]]
      all td that has font of a "head" class and text "TRACK"
  
  ./table/tr[last()]
      the last row of a table
  
  //rdf:Seq/rdf:li/em:id
      using namespaces
  
  //a/@href
      hrefs of all anchors
  
  //*[count(*)=3]
      all nodes with 3 children
  
  //var|//acronym
      all vars and acronyms
  
  XPath functions
  ===============
  Conversion:
      boolean([object])
      string([object])
      number([object])
  
  Math:
      ceiling(number)
      floor(number)
      round(decimal)
      sum(node-set)
  
  Logic:
      true()
      false()
      not(expr)
  
  Node:
      lang(string)
      name([node-set])
      namespace-uri([node-set])
      text()
  
  Context:
      count(node-set)
      function-available(name)
      last()
      position()
  
  String:
      contains(haystack-string needle-string)
      concat(tring1 string2[stringn]*)
      normalize-space(string)
      starts-with(haystack needle)
      string-length([string])
      substring(string start[length])
      substring-after(haystack needle)
      substring-before(haystack needle)
      translate(string abc XYZ)
  
  XPath Axes
  ==========
  Axes are relations to nodes. Some axes also have shortcuts (in parentheses).
  
  Element axes:
      * ancestor
      * ancestor-or-self
      * attribute (@)
      * child (/)
      * descendant (//)
      * descendant-or-self
      * following
      * following-sibling
      * parent(..)
      * preceding
      * preceding-sibling
      * self (.)
  
  Attribute axis:
      * attribute (@)
  
  Namespace axis:
      * namespace
  
  XPath Syntax Details
  ====================
  Absolute path: /step/step/step/...
  
  Relative path: step/step/step/...
  
  Step: axis::node-test[predicate]
    * axis is optional (default is child)
    * predicate is optional (default is true())
  
  Node-test:
    * a type function (text(), comment(), processing-instruction())
    * node() (always true)
    * the name of an attribute, namespace, or element (depending on axis)
  
  Predicate: nested XPath expression relative to current node (no match == false)
  
  Operators: or, and, =, !=, <=, <, >=, >, +, -, *, div, mod, -(unary), |(union)
  
  Shortcut nitty-gritty:
    * @name means "attribute::name"
    * // means "/descendant-or-self::node()/"
    * . means "self::node()"
    * .. means "parent::node()"
    * [4] (as predicate) means "[position() = 4]"

