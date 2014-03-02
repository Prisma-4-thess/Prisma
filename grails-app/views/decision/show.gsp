
<%@ page import="prisma.Decision" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'decision.label', default: 'Decision')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-decision" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-decision" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list decision">
			
				<g:if test="${decisionInstance?.ada}">
				<li class="fieldcontain">
					<span id="ada-label" class="property-label"><g:message code="decision.ada.label" default="Ada" /></span>
					
						<span class="property-value" aria-labelledby="ada-label"><g:fieldValue bean="${decisionInstance}" field="ada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.decisionToCorrect}">
				<li class="fieldcontain">
					<span id="decisionToCorrect-label" class="property-label"><g:message code="decision.decisionToCorrect.label" default="Decision To Correct" /></span>
					
						<span class="property-value" aria-labelledby="decisionToCorrect-label"><g:link controller="decision" action="show" id="${decisionInstance?.decisionToCorrect?.id}">${decisionInstance?.decisionToCorrect?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="decision.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${decisionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.documentUrl}">
				<li class="fieldcontain">
					<span id="documentUrl-label" class="property-label"><g:message code="decision.documentUrl.label" default="Document Url" /></span>
					
						<span class="property-value" aria-labelledby="documentUrl-label"><g:fieldValue bean="${decisionInstance}" field="documentUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.protocolNumber}">
				<li class="fieldcontain">
					<span id="protocolNumber-label" class="property-label"><g:message code="decision.protocolNumber.label" default="Protocol Number" /></span>
					
						<span class="property-value" aria-labelledby="protocolNumber-label"><g:fieldValue bean="${decisionInstance}" field="protocolNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.signer}">
				<li class="fieldcontain">
					<span id="signer-label" class="property-label"><g:message code="decision.signer.label" default="Signer" /></span>
					
						<span class="property-value" aria-labelledby="signer-label"><g:link controller="signer" action="show" id="${decisionInstance?.signer?.id}">${decisionInstance?.signer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="decision.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${decisionInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="decision.tags.label" default="Tags" /></span>
					
						<g:each in="${decisionInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="decision.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="type" action="show" id="${decisionInstance?.type?.id}">${decisionInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="decision.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:link controller="unit" action="show" id="${decisionInstance?.unit?.id}">${decisionInstance?.unit?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="decision.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${decisionInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${decisionInstance?.id}" />
					<g:link class="edit" action="edit" id="${decisionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
