
<%@ page import="prisma.Extra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'extra.label', default: 'Extra')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-extra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-extra" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list extra">
			
				<g:if test="${extraInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="extra.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${extraInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraInstance?.decision_exts}">
				<li class="fieldcontain">
					<span id="decision_exts-label" class="property-label"><g:message code="extra.decision_exts.label" default="Decisionexts" /></span>
					
						<g:each in="${extraInstance.decision_exts}" var="d">
						<span class="property-value" aria-labelledby="decision_exts-label"><g:link controller="decision_ext" action="show" id="${d.id}">${d}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${extraInstance?.formName}">
				<li class="fieldcontain">
					<span id="formName-label" class="property-label"><g:message code="extra.formName.label" default="Form Name" /></span>
					
						<span class="property-value" aria-labelledby="formName-label"><g:fieldValue bean="${extraInstance}" field="formName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="extra.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${extraInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraInstance?.required}">
				<li class="fieldcontain">
					<span id="required-label" class="property-label"><g:message code="extra.required.label" default="Required" /></span>
					
						<span class="property-value" aria-labelledby="required-label"><g:formatBoolean boolean="${extraInstance?.required}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="extra.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="type" action="show" id="${extraInstance?.type?.id}">${extraInstance?.type}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraInstance?.validationType}">
				<li class="fieldcontain">
					<span id="validationType-label" class="property-label"><g:message code="extra.validationType.label" default="Validation Type" /></span>
					
						<span class="property-value" aria-labelledby="validationType-label"><g:fieldValue bean="${extraInstance}" field="validationType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${extraInstance?.id}" />
					<g:link class="edit" action="edit" id="${extraInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
