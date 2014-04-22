<%@ page import="prisma.Userdefgeo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'userdefgeo.label', default: 'Userdefgeo')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-userdefgeo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-userdefgeo" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="address" title="${message(code: 'userdefgeo.address.label', default: 'Address')}"/>

            <g:sortableColumn property="latitude" title="${message(code: 'userdefgeo.latitude.label', default: 'Latitude')}"/>

            <g:sortableColumn property="longitude" title="${message(code: 'userdefgeo.longitude.label', default: 'Longitude')}"/>

            <g:sortableColumn property="namegrk" title="${message(code: 'userdefgeo.namegrk.label', default: 'Namegrk')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${userdefgeoInstanceList}" status="i" var="userdefgeoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${userdefgeoInstance.id}">${fieldValue(bean: userdefgeoInstance, field: "address")}</g:link></td>

                <td>${fieldValue(bean: userdefgeoInstance, field: "latitude")}</td>

                <td>${fieldValue(bean: userdefgeoInstance, field: "longitude")}</td>

                <td>${fieldValue(bean: userdefgeoInstance, field: "namegrk")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${userdefgeoInstanceTotal}"/>
    </div>
</div>
</body>
</html>
