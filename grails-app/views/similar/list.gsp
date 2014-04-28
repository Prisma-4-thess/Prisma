<%@ page import="prisma.Similar" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'similar.label', default: 'Similar')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-similar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-similar" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="decision.label" default="Decision"/></th>

            <th><g:message code="similar.label" default="Simdecision"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${similarInstanceList}" status="i" var="similarInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${similarInstance.id}">${fieldValue(bean: similarInstance, field: "decision")}</g:link></td>

                <td>${fieldValue(bean: similarInstance, field: "sim_decision")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${similarInstanceTotal}"/>
    </div>
</div>
</body>
</html>
