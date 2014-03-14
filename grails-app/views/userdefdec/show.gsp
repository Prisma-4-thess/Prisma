
<%@ page import="prisma.Userdefdec" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userdefdec.label', default: 'Userdefdec')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userdefdec" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userdefdec" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userdefdec">
			
				<g:if test="${userdefdecInstance?.decision}">
				<li class="fieldcontain">
					<span id="decision-label" class="property-label"><g:message code="userdefdec.decision.label" default="Decision" /></span>
					
						<span class="property-value" aria-labelledby="decision-label"><g:link controller="decision" action="show" id="${userdefdecInstance?.decision?.id}">${userdefdecInstance?.decision?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userdefdecInstance?.geo}">
				<li class="fieldcontain">
					<span id="geo-label" class="property-label"><g:message code="userdefdec.geo.label" default="Geo" /></span>
					
						<span class="property-value" aria-labelledby="geo-label"><g:link controller="userdefgeo" action="show" id="${userdefdecInstance?.geo?.id}">${userdefdecInstance?.geo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userdefdecInstance?.id}" />
					<g:link class="edit" action="edit" id="${userdefdecInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
