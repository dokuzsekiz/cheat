Grails maven integration
========================

* http://grails.org/Maven+Integration


You can also take advantage of some of the Grails commands that have been wrapped as Maven goals:

grails:console
grails:create-controller
grails:create-domain-class
grails:create-integration-test
grails:create-pom
grails:create-script
grails:create-service
grails:create-tag-lib
grails:create-unit-test
grails:exec
grails:generate-all
grails:generate-controller
grails:generate-views
grails:install-plugin
grails:install-templates
grails:list-plugins
grails:package
grails:run-app
grails:run-app-https
grails:uninstall-plugin

Run grails commands via the exec functions
------------------------------------------

Examples:

`
mvn grails:exec -Dcommand="integrate-with" -e -Dargs="--eclipse"

mvn clean grails:war
mvn grails:exec -Dcommand=clean
mvn grails:exec -Dcommand=compile
mvn grails:exec -Dcommand="refresh-static-data"
mvn grails:exec -Dcommand="compile-gwt-modules"
mvn grails:exec -Dcommand=run-gwt-client -Dargs=8090
mvn grails:run-app -Dserver.port=8090 -Dgrails.env=development

`

