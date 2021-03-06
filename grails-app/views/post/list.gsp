<%@ page import="prisma.Post" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-post" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="text" title="${message(code: 'post.text.label', default: 'Text')}"/>

            <th><g:message code="post.decision.label" default="Decision"/></th>

            <g:sortableColumn property="firstName" title="${message(code: 'post.firstName.label', default: 'First Name')}"/>

            <g:sortableColumn property="lastName" title="${message(code: 'post.lastName.label', default: 'Last Name')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${postInstanceList}" status="i" var="postInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "text")}</g:link></td>

                <td>${fieldValue(bean: postInstance, field: "decision")}</td>

                <td>${fieldValue(bean: postInstance, field: "firstName")}</td>

                <td>${fieldValue(bean: postInstance, field: "lastName")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${postInstanceTotal}"/>
    </div>
</div>
</body>
</html>
