
<%@ page import="prisma.Unit"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'unit.label', default: 'Unit')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-unit" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-unit" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list unit">

			<g:if test="${unitInstance?.label}">
				<li class="fieldcontain"><span id="label-label"
					class="property-label"><g:message code="unit.label.label"
							default="Label" /></span> <span class="property-value"
					aria-labelledby="label-label"><g:fieldValue
							bean="${unitInstance}" field="label" /></span></li>
			</g:if>

			<g:if test="${unitInstance?.organization}">
				<li class="fieldcontain"><span id="organization-label"
					class="property-label"><g:message
							code="unit.organization.label" default="Organization" /></span> <span
					class="property-value" aria-labelledby="organization-label"><g:link
							controller="organization" action="show"
							id="${unitInstance?.organization?.id}">
							${unitInstance?.organization}
						</g:link></span></li>
			</g:if>

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${unitInstance?.id}" />
				<g:link class="edit" action="edit" id="${unitInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
