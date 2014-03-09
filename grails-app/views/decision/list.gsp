
<%@ page import="prisma.Decision"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'decision.label', default: 'Decision')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-decision" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><g:link mapping="adminPanel" class="home">
					<g:message code="default.home.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-decision" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="ada"
						title="${message(code: 'decision.ada.label', default: 'Ada')}" />

					<th><g:message code="decision.decisionToCorrect.label"
							default="Decision To Correct" /></th>

					<th><g:message code="decision.geo.label" default="Geo" /></th>

					<g:sortableColumn property="date"
						title="${message(code: 'decision.date.label', default: 'Date')}" />

					<g:sortableColumn property="documentUrl"
						title="${message(code: 'decision.documentUrl.label', default: 'Document Url')}" />

					<g:sortableColumn property="protocolNumber"
						title="${message(code: 'decision.protocolNumber.label', default: 'Protocol Number')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${decisionInstanceList}" status="i"
					var="decisionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${decisionInstance.id}">
								${fieldValue(bean: decisionInstance, field: "ada")}
							</g:link></td>

						<td>
							${fieldValue(bean: decisionInstance, field: "decisionToCorrect")}
						</td>

						<td>
							${fieldValue(bean: decisionInstance, field: "geo")}
						</td>

						<td><g:formatDate date="${decisionInstance.date}" /></td>

						<td>
							${fieldValue(bean: decisionInstance, field: "documentUrl")}
						</td>

						<td>
							${fieldValue(bean: decisionInstance, field: "protocolNumber")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${decisionInstanceTotal}" />
		</div>
	</div>
</body>
</html>
