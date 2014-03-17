<table id="one-column-emphasis" class="search_table">
	<thead>
		<tr>

			<util:remoteSortableColumn property="ada"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.ada.label', default: 'ΑΔΑ')}"
				params="['source':source]" />

			<%--<th><g:message code="decision.decisionToCorrect.label"
					default="Decision To Correct" /></th>--%>
			<th><g:message code="decision.subject.label" default="Θέμα" /></th>

			<util:remoteSortableColumn property="protocolNumber"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.protocolNumber.label', default: 'Αριθμός Προτ.')}"
				params="['source':source]" />

			<util:remoteSortableColumn property="date"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.date.label', default: 'Ημερομηνία')}"
				params="['source':source]" />

			<%--<g:sortableColumn property="documentUrl"
						title="${message(code: 'decision.documentUrl.label', default: 'Document Url')}" params="['source':source]"/>
					--%>
			<th><g:message code="decision.unit.label" default="Μονάδα" /></th>

			<%--<th><g:message code="decision.signer.label" default="Signer" /></th>--%>
		</tr>
	</thead>
	<tbody>
		<g:each in="${results}" status="i" var="decisionInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
				<td><g:if test="${source=='home'}">
						<g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							onComplete="hideResultsShowDecision();"
							params="['source':source]">
							${decisionInstance.ada}
						</g:remoteLink>
					</g:if> <g:elseif test="${source=='map'}">
						<g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]">
							${decisionInstance.ada}
						</g:remoteLink>
					</g:elseif> <g:else>
						<g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							target="_blank">
							${decisionInstance.ada}
						</g:link>
					</g:else></td>
				<%--<td>
					${decisionInstance.decisionToCorrect}
				</td>--%>
				<td>
					<%--<g:each in="${decisionInstance.tags}" var="tag">
						${tag}

					</g:each></td>
				--%> ${decisionInstance.subject.take(85)}<g:if
						test="${decisionInstance.subject.length()>85}">...</g:if>
				<td>
					${decisionInstance.protocolNumber}
				</td>
				<td><g:formatDate date="${decisionInstance.date}" /></td>

				<%--<td>
							${decisionInstance.documentUrl}
						</td>
						--%>


				<%--<td>
					${decisionInstance.signer}
				</td>--%>
				<td>
					${decisionInstance.unit}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>