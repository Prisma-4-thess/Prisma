<%@ page import="prisma.Extra" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'extra.label', default: 'Extra')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-extra" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link mapping="adminPanel" class="home">
            <g:message code="default.home.label"/>
        </g:link></li>

        <li><g:link class="create" action="create">
            <g:message code="default.new.label" args="[entityName]"/>
        </g:link></li>
    </ul>
</div>

<div id="list-extra" class="content scaffold-list" role="main">
    <h1>
        <g:message code="default.list.label" args="[entityName]"/>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">
            ${flash.message}
        </div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name"
                              title="${message(code: 'extra.name.label', default: 'Name')}"/>

            <g:sortableColumn property="formName"
                              title="${message(code: 'extra.formName.label', default: 'Form Name')}"/>

            <g:sortableColumn property="label"
                              title="${message(code: 'extra.label.label', default: 'Label')}"/>

            <g:sortableColumn property="required"
                              title="${message(code: 'extra.required.label', default: 'Required')}"/>

            <th><g:message code="extra.type.label" default="Type"/></th>

            <g:sortableColumn property="validationType"
                              title="${message(code: 'extra.validationType.label', default: 'Validation Type')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${extraInstanceList}" status="i" var="extraInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${extraInstance.id}">
                    ${fieldValue(bean: extraInstance, field: "name")}
                </g:link></td>

                <td>
                    ${fieldValue(bean: extraInstance, field: "formName")}
                </td>

                <td>
                    ${fieldValue(bean: extraInstance, field: "label")}
                </td>

                <td><g:formatBoolean boolean="${extraInstance.required}"/></td>

                <td>
                    ${fieldValue(bean: extraInstance, field: "type")}
                </td>

                <td>
                    ${fieldValue(bean: extraInstance, field: "validationType")}
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${extraInstanceTotal}"/>
    </div>
</div>
</body>
</html>
