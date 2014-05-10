# OSGi

## Introduction

* Specification ( without implementation )
* module system
* service platform
* Simple and small < 30 classes
* Eclipse, Netbeans, IntelliJ, Glassfish, JBoss, Weblogic, WebSphere, Confluence, JIRA, SpringSource dm Server

* Eclipse plugin development
  * WP/org.eclipse.pde.core

## Implementations

* Eclipse: Equinox
* Apache: Felix
* Knopflerfish


## Bundle

* plain jar file with special Manifest
* Import - export : visibility between bundles
  * implemented by own classloaders
  * Do not use ClassLoaders!!

### Manifest
* e.g. Bundle-SymbolicName, Bundle-Version, Export-Package, Import-Package
* Require-Bundle - needs bundle id(Bundle-SymbolicName), not loose coupling!
* Bundle-ManifestVersion 2 belongs to OSGi version 4

### Lifecycle

0. Installed
1. Resolved : all dependencies are resolved
2. Starting
3. Active : running and working
4. Stopping
5. Uninstalled

### Activator

* customize starting, stopping
* public default constructor
* synchronized / sequential bundle starting by the framework, must finish in a reasonable amount of time
( start level : starting order )

### Eclipse - plugin development perspective

1. New plugin
2. Select OSGi framework : standard
3. No templates, create Activator
4. Create run configuration : 
Select wp, and Target Platform (org.eclipse.osgi)

#### OSGi condsole

* commands : help
* ss (short status), diag

## Service

* Service registry

### Example :

* Provider and Client are loose coupled, common service registry by an Interface
* BundleContext$registerService, unregister()
* org.osgi.util.tracker.ServiceTracker$getService()
* 3 Bundles 
  * Service Interface is exported by a separate bundle without an activator
  * Provider
  * CLient

## Fragment Bundle

* extend an other bundle's classpath
* can not have BundleActivator

## Declarative Services

* No needd to implement OSGi classes, Lazy initialization
* Manifest : Bundle-ActivationPolicy : lazy, Service-Component : to the xml

