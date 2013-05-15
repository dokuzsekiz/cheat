(Plugin gwt-0.7.1 installed)

Plugin provides the following new scripts
-----------------------------------------

* grails clean-gwt-modules
* grails compile-gwt-modules
* grails compile-i18n
* grails create-gwt-action
* grails create-gwt-event
* grails create-gwt-i18n
* grails create-gwt-module
* grails create-gwt-page
* grails generate-gwt-rpc
* grails publish-github
* grails run-gwt-client


Run commands with maven-grails
------------------------------

* mvn grails:exec -Dcommand="compile-gwt-modules"
* run gwt code server : mvn grails:exec -Dcommand=run-gwt-client -Dargs=8090