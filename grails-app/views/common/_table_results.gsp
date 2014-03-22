<table id="one-column-emphasis" class="search_table">
	<thead>
		<tr>

			<util:remoteSortableColumn property="ada"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.ada.label', default: 'ΑΔΑ')}"
				params="['source':source]" />

			<th><g:message code="decision.subject.label" default="Θέμα" /></th>

			<util:remoteSortableColumn property="protocolNumber"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.protocolNumber.label', default: 'Αριθμός Πρωτ.')}"
				params="['source':source]" />

			<util:remoteSortableColumn property="date"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.date.label', default: 'Ημερομηνία')}"
				params="['source':source]" />

			<th><g:message code="decision.unit.label" default="Μονάδα" /></th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${results}" status="i" var="decisionInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				<g:if test="${source=='home'}">

					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							onComplete="hideResultsShowDecision();"
							params="['source':source]" style="display:block">
							${decisionInstance.ada}
						</g:remoteLink></td>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							onComplete="hideResultsShowDecision();"
							params="['source':source]" style="display:block">
							${decisionInstance.subject.take(85)}<g:if
								test="${decisionInstance.subject.length()>85}">...</g:if>
						</g:remoteLink>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							onComplete="hideResultsShowDecision();"
							params="['source':source]" style="display:block">
							${decisionInstance.protocolNumber}
						</g:remoteLink></td>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							onComplete="hideResultsShowDecision();"
							params="['source':source]" style="display:block">
							<g:formatDate date="${decisionInstance.date}" />
						</g:remoteLink></td>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							onComplete="hideResultsShowDecision();"
							params="['source':source]" style="display:block">
							${decisionInstance.unit}
						</g:remoteLink></td>

				</g:if>
				<g:elseif test="${source=='map'}">

					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]" style="display:block">
							${decisionInstance.ada}
						</g:remoteLink></td>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]" style="display:block">
							${decisionInstance.subject.take(85)}<g:if
								test="${decisionInstance.subject.length()>85}">...</g:if>
						</g:remoteLink>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]" style="display:block">
							${decisionInstance.protocolNumber}
						</g:remoteLink></td>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]" style="display:block">
							<g:formatDate date="${decisionInstance.date}" />
						</g:remoteLink></td>
					<td><g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]" style="display:block">
							${decisionInstance.unit}
						</g:remoteLink></td>

				</g:elseif>
				<g:else>

					<td><g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							style="display:block" target="_blank">
							${decisionInstance.ada}
						</g:link></td>
					<td><g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							style="display:block" target="_blank">
							${decisionInstance.subject.take(85)}<g:if
								test="${decisionInstance.subject.length()>85}">...</g:if>
						</g:link>
					<td><g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							style="display:block" target="_blank">
							${decisionInstance.protocolNumber}
						</g:link></td>
					<td><g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							style="display:block" target="_blank">
							<g:formatDate date="${decisionInstance.date}" />
						</g:link></td>
					<td><g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							style="display:block" target="_blank">
							${decisionInstance.unit}
						</g:link></td>

				</g:else>


			</tr>
		</g:each>
	</tbody>
</table>