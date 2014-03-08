
<%@ page import="prisma.RelativeDecision" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relativeDecision.label', default: 'RelativeDecision')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-relativeDecision" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-relativeDecision" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="relativeDecision.finalDec.label" default="Final Dec" /></th>
					
						<th><g:message code="relativeDecision.relatedDec.label" default="Related Dec" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${relativeDecisionInstanceList}" status="i" var="relativeDecisionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${relativeDecisionInstance.id}">${fieldValue(bean: relativeDecisionInstance, field: "finalDec")}</g:link></td>
					
						<td>${fieldValue(bean: relativeDecisionInstance, field: "relatedDec")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${relativeDecisionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
