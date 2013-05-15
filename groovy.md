Some useful groovy examples for ruby developers
===============================================

* methodMissing

`
class GORM {

   def dynamicMethods = [...] // an array of dynamic methods that use regex
   def methodMissing(String name, args) {
       def method = dynamicMethods.find { it.match(name) }
       if(method) {
          GORM.metaClass."$name" = { Object[] varArgs ->
             method.invoke(delegate, name, varArgs)
          }
          return method.invoke(delegate,name, args)
       }
       else throw new MissingMethodException(name, delegate, args)
   }
}
`

Operators
---------

* Elvis operator: `?:`

   not null check

  `println null?:"asdfasdf"`

* Spread operator: `*.`

  Printing out methods using the Spread operator:  
  
  `println "foo".metaClass.methods*.name.sort().unique()`

    is the same as
	
  `"foo".metaClass.methods.collect { method -> method.name }.sort().unique()`

Map
---

* inject example:

`
  map = [key: "value"]
  println( map.inject(new StringBuilder("PREFIX"), {sb, value -> sb.append("_").append(value.toString())}).toString())
  map.join("_")
`

* collect example:

`
  def key(Object...a) {
    a.collect{value -> value.toString()} join("_")
  }

  println key( "asdfasdf", "Asdfasf", "append", "this" )
`