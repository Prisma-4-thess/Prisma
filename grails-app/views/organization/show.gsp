<%@ page import="prisma.Organization" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName"
           value="${message(code: 'organization.label', default: 'Organization')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-organization" class="skip" tabindex="-1"><g:message
        code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message
                code="default.home.label"/></a></li>
        <li><g:link class="list" action="list">
            <g:message code="default.list.label" args="[entityName]"/>
        </g:link></li>
        <li><g:link class="create" action="create">
            <g:message code="default.new.label" args="[entityName]"/>
        </g:link></li>
    </ul>
</div>

<div id="show-organization" class="content scaffold-show" role="main">
    <h1>
        <g:message code="default.show.label" args="[entityName]"/>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">
            ${flash.message}
        </div>
    </g:if>
    <ol class="property-list organization">

        <g:if test="${organizationInstance?.label}">
            <li class="fieldcontain"><span id="label-label"
                                           class="property-label"><g:message
                        code="organization.label.label" default="Label"/></span> <span
                    class="property-value" aria-labelledby="label-label"><g:fieldValue
                        bean="${organizationInstance}" field="label"/></span></li>
        </g:if>

        <g:if test="${organizationInstance?.active}">
            <li class="fieldcontain"><span id="active-label"
                                           class="property-label"><g:message
                        code="organization.active.label" default="Active"/></span> <span
                    class="property-value" aria-labelledby="active-label"><g:formatBoolean
                        boolean="${organizationInstance?.active}"/></span></li>
        </g:if>

        <g:if test="${organizationInstance?.latinName}">
            <li class="fieldcontain"><span id="latinName-label"
                                           class="property-label"><g:message
                        code="organization.latinName.label" default="Latin Name"/></span> <span
                    class="property-value" aria-labelledby="latinName-label"><g:fieldValue
                        bean="${organizationInstance}" field="latinName"/></span></li>
        </g:if>

        <g:if test="${organizationInstance?.units}">
            <li class="fieldcontain"><span id="units-label"
                                           class="property-label"><g:message
                        code="organization.units.label" default="Units"/></span> <g:each
                    in="${organizationInstance.units}" var="u">
                <span class="property-value" aria-labelledby="units-label"><g:link
                        controller="unit" action="show" id="${u.id}">
                    ${u}
                </g:link></span>
            </g:each></li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${organizationInstance?.id}"/>
            <g:link class="edit" action="edit" id="${organizationInstance?.id}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
