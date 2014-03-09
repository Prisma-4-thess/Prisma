
<%@ page import="prisma.Signer"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'signer.label', default: 'Signer')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-signer" class="skip" tabindex="-1"><g:message
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
	<div id="list-signer" class="content scaffold-list" role="main">
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

					<g:sortableColumn property="firstName"
						title="${message(code: 'signer.firstName.label', default: 'First Name')}" />

					<g:sortableColumn property="lastName"
						title="${message(code: 'signer.lastName.label', default: 'Last Name')}" />

					<g:sortableColumn property="position"
						title="${message(code: 'signer.position.label', default: 'Position')}" />

					<g:sortableColumn property="title"
						title="${message(code: 'signer.title.label', default: 'Title')}" />

					<g:sortableColumn property="active"
						title="${message(code: 'signer.active.label', default: 'Active')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${signerInstanceList}" status="i" var="signerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${signerInstance.id}">
								${fieldValue(bean: signerInstance, field: "firstName")}
							</g:link></td>

						<td>
							${fieldValue(bean: signerInstance, field: "lastName")}
						</td>

						<td>
							${fieldValue(bean: signerInstance, field: "position")}
						</td>

						<td>
							${fieldValue(bean: signerInstance, field: "title")}
						</td>

						<td><g:formatBoolean boolean="${signerInstance.active}" /></td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${signerInstanceTotal}" />
		</div>
	</div>
</body>
</html>
