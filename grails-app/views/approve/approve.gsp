<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<g:javascript library="jquery" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<div>
			<table>
				<tr>
					<td>Περιγραφή Απόφασης</td>
					<td>Τοποθεσία</td>
				</tr>
				<g:each in="${pre }">
					<tr>
						<td>
							${it.decision.ada }
						</td>
						<td>
							${it.decision.subject }
						</td>
						<td>
							${it.geo.namegrk }
						</td>
						<td>
							<div id="${it.decision.id}">
								<g:remoteLink action="app_decision" id="${it.id}"
									update="${it.decision.id}">Approve</g:remoteLink>
								<g:remoteLink action="dis_decision" id="${it.id}"
									update="${it.decision.id}">Disapprove</g:remoteLink>
							</div>
						</td>
					</tr>
				</g:each>
			</table>
		</div>
	</div>
</body>
</html>