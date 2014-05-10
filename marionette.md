# Marionette.js

## Backbone.Marionette

Backbone is a lightweight library. Marionette aims to simplify the construction of large scale JavaScript applications.

### Benefits

* Follows backbone philosophy
* Lightweight
* Reduces boilerplate
* Set of UI sets
* AMD
* simple and clear code

### Setbacks

* Not a full featured UI framework ( common components are missing )
* Rendering is opinioned - drawback
* No two-way databinding by default

## View components

### Marionette.View

* Extends Backbone.View
* close method clean up the resources ( event listeners remove el from DOM )
* serialize method

#### Convenient shortcuts

* eventHash
* multiple callbacks

### Marionette.ItemView

* el, render, template, url
* calls the render method automagically
* underscore templating

### Marionette.CollectionView 

* renders a Backbone.Collection, each item is an ItemView
* every model has its own view handling events
* refreshes on Collection change

### More components

* Marionette.CompositeView
* Marionette.Layout > Marionette.ItemView
* Marionette.Application
* Maronette.Application :
  * addInitializer method
  * start method
* vent property : Marionette request/response sync communication
* Router
* a NOT mvc controller

* Addy Osmani - github
