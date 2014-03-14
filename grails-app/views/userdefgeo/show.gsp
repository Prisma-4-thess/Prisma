
<%@ page import="prisma.Userdefgeo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userdefgeo.label', default: 'Userdefgeo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userdefgeo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userdefgeo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userdefgeo">
			
				<g:if test="${userdefgeoInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="userdefgeo.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${userdefgeoInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userdefgeoInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="userdefgeo.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${userdefgeoInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userdefgeoInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="userdefgeo.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${userdefgeoInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userdefgeoInstance?.namegrk}">
				<li class="fieldcontain">
					<span id="namegrk-label" class="property-label"><g:message code="userdefgeo.namegrk.label" default="Namegrk" /></span>
					
						<span class="property-value" aria-labelledby="namegrk-label"><g:fieldValue bean="${userdefgeoInstance}" field="namegrk"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userdefgeoInstance?.id}" />
					<g:link class="edit" action="edit" id="${userdefgeoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
