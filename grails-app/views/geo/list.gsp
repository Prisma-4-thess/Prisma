
<%@ page import="prisma.Geo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'geo.label', default: 'Geo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-geo" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-geo" class="content scaffold-list" role="main">
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

					<g:sortableColumn property="latitude"
						title="${message(code: 'geo.latitude.label', default: 'Latitude')}" />

					<g:sortableColumn property="label"
						title="${message(code: 'geo.label.label', default: 'Label')}" />

					<g:sortableColumn property="longitude"
						title="${message(code: 'geo.longitude.label', default: 'Longitude')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${geoInstanceList}" status="i" var="geoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${geoInstance.id}">
								${fieldValue(bean: geoInstance, field: "label")}
							</g:link></td>

						<td>
							${fieldValue(bean: geoInstance, field: "latitude")}
						</td>

						<td>
							${fieldValue(bean: geoInstance, field: "longitude")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${geoInstanceTotal}" />
		</div>
	</div>
</body>
</html>
