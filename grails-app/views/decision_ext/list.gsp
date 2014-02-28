
<%@ page import="prisma.Decision_ext" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'decision_ext.label', default: 'Decision_ext')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-decision_ext" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-decision_ext" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="decision_ext.extra.label" default="Extra" /></th>
					
						<th><g:message code="decision_ext.decision.label" default="Decision" /></th>
					
						<g:sortableColumn property="value" title="${message(code: 'decision_ext.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${decision_extInstanceList}" status="i" var="decision_extInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${decision_extInstance.id}">${fieldValue(bean: decision_extInstance, field: "extra")}</g:link></td>
					
						<td>${fieldValue(bean: decision_extInstance, field: "decision")}</td>
					
						<td>${fieldValue(bean: decision_extInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${decision_extInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
