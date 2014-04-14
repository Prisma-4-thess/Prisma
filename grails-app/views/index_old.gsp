<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'pure.css')}">
    <title>Welcome to Prisma</title>
</head>

<body>
<g:link mapping="adminPanel" class="">
    <g:message code="global.adminPanel"/>
</g:link>

<div id="controller-list" role="navigation">
    <h2>Available Controllers:</h2>
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

</body>
</html>
