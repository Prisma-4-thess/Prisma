<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="homepage_main" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'table.css')}" />
<resource:richTextEditor type="medium" />


<g:javascript library="jquery" />
</head>
<body>
	<div class="body">
		<table id="one-column-emphasis" class="search_table">
			<tr>
				<th><g:if test="${source=="map"}">
						<g:link mapping="rootUrl">←</g:link>
					</g:if> <g:else>
						<g:remoteLink before="hideDecisionShowResults();">←</g:remoteLink>
					</g:else></th>
			</tr>
			<g:if test="${dec2}">

				<g:each in="${dec2}">
					<tr>
						<th><font color="red">Η παρούσα απόφαση έχει διορθωθεί
								από την: <g:remoteLink controller="search" action="show"
									id="${it.id}" update="decision"
									before="hideResultsShowDecision();">
									${it.ada}
								</g:remoteLink>
						</font></th>
					</tr>
				</g:each>


			</g:if>
			<tr>
				<th>ΑΔΑ
				<th>
				<th>
					${decision.ada}
				
				<th>
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
						${it.extra.label}
					
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
			<tr>
				<td><a href="${decision.documentUrl}" target="_blank">Pdf Απόφασης</a></td>
			</tr>
			<tr>
				<td><g:if test="${relDec}">
						<g:remoteLink action="showRelated"
							params="['decisionId':decision.id]" update="related">Σχετικές αποφάσεις</g:remoteLink>
					</g:if></td>
			</tr>
			<tr>
				<th><g:if test="${source=="map"}">
						<g:link mapping="rootUrl">←</g:link>
					</g:if> <g:else>
						<g:remoteLink before="hideDecisionShowResults();">←</g:remoteLink>
					</g:else></th>
			</tr>
		</table>

		<div id="related"></div>

		<div id="comments" style="display: none;">
			<g:remoteLink controller="search" action="blog" id="${decision.ada}"
				update="blog">enable blog</g:remoteLink>
			<div id="blog" class="blog">
				<p>Η λειτουργία του σχολιασμού είναι ανενεργή</p>
			</div>
		</div>
	</div>
</body>
</html>