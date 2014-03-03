<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<div class="body">
		<g:if test="${result }">
			<table style="width: 600px" align="left">
				<tr>
					<td>ΑΔΑ</td>
					<td>Αρ.Πρωτ.</td>
					<td>Περιγραφή</td>
					<td>Τύπος Απόφασης</td>
					<td>Μονάδα</td>
					<td>Τελικός Υπογράφων</td>
					<td>Hμερ.Έκδοσης</td>
				</tr>
				<tr>
					<td><g:link controller="decision" action="show"
							id="${result.id}">
							${result.ada}
						</g:link></td>
					<td>
						${result.protocolNumber}
					</td>
					<td>
						${result.subject}
					</td>
					<td>
						${result.type}
					</td>
					<td>
						${result.unit}
					</td>
					<td>
						${result.signer}
					</td>
					<td><g:formatDate format="yyyy-MM-dd" date="${result.date}" /></td>
					<td><a href="${result.url}">Pdf Απόφασης</a></td>
				</tr>
			</table>
		</g:if>
		<g:else>
			<p>no decision matching</p>
		</g:else>
	</div>
</body>
</html>