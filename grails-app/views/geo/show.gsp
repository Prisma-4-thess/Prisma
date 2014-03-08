
<%@ page import="prisma.Geo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'geo.label', default: 'Geo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-geo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-geo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list geo">
			
				<g:if test="${geoInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="geo.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${geoInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="geo.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${geoInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="geo.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${geoInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.tk}">
				<li class="fieldcontain">
					<span id="tk-label" class="property-label"><g:message code="geo.tk.label" default="Tk" /></span>
					
						<span class="property-value" aria-labelledby="tk-label"><g:fieldValue bean="${geoInstance}" field="tk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.newCat}">
				<li class="fieldcontain">
					<span id="newCat-label" class="property-label"><g:message code="geo.newCat.label" default="New Cat" /></span>
					
						<span class="property-value" aria-labelledby="newCat-label"><g:fieldValue bean="${geoInstance}" field="newCat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.namegrk}">
				<li class="fieldcontain">
					<span id="namegrk-label" class="property-label"><g:message code="geo.namegrk.label" default="Namegrk" /></span>
					
						<span class="property-value" aria-labelledby="namegrk-label"><g:fieldValue bean="${geoInstance}" field="namegrk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="geo.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${geoInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.dimos}">
				<li class="fieldcontain">
					<span id="dimos-label" class="property-label"><g:message code="geo.dimos.label" default="Dimos" /></span>
					
						<span class="property-value" aria-labelledby="dimos-label"><g:fieldValue bean="${geoInstance}" field="dimos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${geoInstance?.newSubCat}">
				<li class="fieldcontain">
					<span id="newSubCat-label" class="property-label"><g:message code="geo.newSubCat.label" default="New Sub Cat" /></span>
					
						<span class="property-value" aria-labelledby="newSubCat-label"><g:fieldValue bean="${geoInstance}" field="newSubCat"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${geoInstance?.id}" />
					<g:link class="edit" action="edit" id="${geoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
