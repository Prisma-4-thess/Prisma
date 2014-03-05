<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Show Decision</title>
</head>
<body>
	<div class="body">
		<table>
			<g:if test="${dec2}">
				<tr>
					<font color="red">Η παρούσα απόφαση έχει διορθωθεί από την <g:link
							controller="search" action="show" id="${dec2.id}">
							${dec2.ada}
						</g:link></font>
				</tr>
			</g:if>
			<tr>
				<td>ΑΔΑ
				<td>
				<td>
					${decision.ada}
				
				<td>
			</tr>
			<g:if test="${decision.protocolNumber}">
				<tr>
					<td>Αριθμός Πρώτοκολου
					<td>
					<td>
						${decision.protocolNumber}
					
					<td>
				</tr>
			</g:if>
			<tr>
				<td>Θέμα
				<td>
				<td>
					${decision.subject}
				
				<td>
			</tr>
			<tr>
				<td>Ημερομηνία Έκδοσης
				<td>
				<td>
					${decision.date}
				
				<td>
			</tr>
			<tr>
				<td>Τύπος Απόφασης
				<td>
				<td>
					${decision.type}
				
				<td>
			</tr>
			<tr>
				<td>Θεματική ενότητα
				<td>
				<td><g:each in="${decision.tags}">
						${it.label}<br>
					</g:each>
				<td>
			</tr>
			<tr>
				<td>Φορέας
				<td>
				<td>
					${org}
				
				<td>
			</tr>
			<tr>
				<td>Μονάδα
				<td>
				<td>
					${decision.unit}
				
				<td>
			</tr>
			<tr>
				<td>Τελικός Υπογράφων
				<td>
				<td>
					${decision.signer}
				
				<td>
			</tr>
			<g:each in="${ext}">
				<tr>
					<td>
						${it.extra}
					
					<td>
					<td>
						${it.value}
					
					<td>
				</tr>
			</g:each>
			<g:if test="${decision.decisionToCorrect}">
				<tr>
					<td>Διόρθωση της απόφασης με ΑΔΑ
					<td>
					<td>
						${decision.decisionToCorrect}
					
					<td>
				</tr>
			</g:if>
			<td><a href="${decision.documentUrl}">Pdf Απόφασης</a></td>
		</table>
	</div>
</body>
</html>