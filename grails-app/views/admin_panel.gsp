<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="adminPanel.welcome.title" /></title>
</head>

<body>
<a href="#page-body" class="skip"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="status" role="complementary">
    <h1><g:message code="adminPanel.application.status" /></h1>
    <ul>
        <li>App version: <g:meta name="app.version"/></li>
        <li>Grails version: <g:meta name="app.grails.version"/></li>
        <li>Groovy version: ${GroovySystem.getVersion()}</li>
        <li>JVM version: ${System.getProperty('java.version')}</li>
        <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
    </ul>

    <h1><g:message code="adminPanel.installed.plugins" /></h1>
    <ul>
        <g:each var="plugin"
                in="${applicationContext.getBean('pluginManager').allPlugins}">
            <li>
                ${plugin.name} - ${plugin.version}
            </li>
        </g:each>
    </ul>
</div>

<div id="page-body" role="main">
    <h1><g:message code="adminPanel.welcome.title" /></h1>

    <p><g:message code="adminPanel.welcome.paragraph" /></p>

    <div id="controller-list" role="navigation">
        <h2><g:message code="adminPanel.available.controllers" />:</h2>
        <ul>
            <g:each var="c"
                    in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                <li class="controller"><g:link
                        controller="${c.logicalPropertyName}">
                    ${c.fullName}
                </g:link></li>
            </g:each>
        </ul>
    </div>
</div>

</body>
</html>
