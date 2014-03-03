
<%@ page import="prisma.Type"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'type.label', default: 'Type')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-type" class="skip" tabindex="-1"><g:message
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
	<div id="show-type" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list type">

			<g:if test="${typeInstance?.label}">
				<li class="fieldcontain"><span id="label-label"
					class="property-label"><g:message code="type.label.label"
							default="Label" /></span> <span class="property-value"
					aria-labelledby="label-label"><g:fieldValue
							bean="${typeInstance}" field="label" /></span></li>
			</g:if>

			<g:if test="${typeInstance?.extras}">
				<li class="fieldcontain"><span id="extras-label"
					class="property-label"><g:message code="type.extras.label"
							default="Extras" /></span> <g:each in="${typeInstance.extras}" var="e">
						<span class="property-value" aria-labelledby="extras-label"><g:link
								controller="extra" action="show" id="${e.id}">
								${e}
							</g:link></span>
					</g:each></li>
			</g:if>

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${typeInstance?.id}" />
				<g:link class="edit" action="edit" id="${typeInstance?.id}">
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
