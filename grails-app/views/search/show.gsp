
<table id="one-column-emphasis" class="search_table">
	<tr>
		<th><g:if test="${source=="map"}">
				<%--<g:link mapping="rootUrl">←</g:link>
					--%>
			</g:if> <g:elseif test="${source=="home"}">
				<g:remoteLink onComplete="hideDecisionShowResults();">←</g:remoteLink>
			</g:elseif> <g:else>
				<g:link mapping="admin_panel">←</g:link>
			</g:else></th>
	</tr>
	<g:if test="${dec2}">

		<g:each in="${dec2}">
			<tr>
				<th><font color="red">Η παρούσα απόφαση έχει διορθωθεί
						από την: <g:if test="${source=='home'}">
							<g:remoteLink controller="search" action="show" id="${it.id}"
								update="decision" onComplete="hideResultsShowDecision();"
								params="['source':source]">
								${it.ada}
							</g:remoteLink>
						</g:if> <g:else>
							<g:remoteLink controller="search" action="show" id="${it.id}"
								update="decision" params="['source':source]">
								${it.ada}
							</g:remoteLink>
						</g:else>
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
			<g:formatDate date="${decision.date}" />
		
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
		<td>Θέση</td>
		<td>
		<td><g:if test="${decision.geo}">
				<g:link controller="map" action="show_geo"
					params="['source':source]" id="${decision.geo.id}" target="_blank">
					${decision.geo}
				</g:link>
			</g:if> <g:else>
				<g:link controller="defineGeo" action="index"
					params="['source':source,'decisionId':decision.id,'decisionName':decision.ada]"
					target="_blank">
					Πρόσθεσε Τοποθεσία
				</g:link>
			</g:else>
		<td></td>
	</tr>

	<tr>
		<td><a href="${decision.documentUrl}" target="_blank">Pdf
				Απόφασης</a></td>
	</tr>
	<g:if test="${relDec}">
		<tr>
			<td><g:remoteLink action="showRelated"
					params="['decisionId':decision.id]" update="related">Σχετικές αποφάσεις</g:remoteLink>
			</td>
		</tr>
	</g:if>
	<tr>
		<th><g:if test="${source=="map"}">
				<%--<g:link mapping="rootUrl">←</g:link>
					--%>
			</g:if> <g:else>
				<g:remoteLink onComplete="hideDecisionShowResults();">←</g:remoteLink>
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
