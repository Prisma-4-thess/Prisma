<table id="one-column-emphasis" class="search_table">
	<thead>
		<tr>

			<util:remoteSortableColumn property="ada" update="one-column-emphasis"
				action="sort"
				title="${message(code: 'decision.ada.label', default: 'Ada')}" />

			<th><g:message code="decision.decisionToCorrect.label"
					default="Decision To Correct" /></th>

			<util:remoteSortableColumn property="date" update="one-column-emphasis"
				action="sort"
				title="${message(code: 'decision.date.label', default: 'Date')}" />

			<%--<g:sortableColumn property="documentUrl"
						title="${message(code: 'decision.documentUrl.label', default: 'Document Url')}" />
					--%>
			<util:remoteSortableColumn property="protocolNumber"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.protocolNumber.label', default: 'Protocol Number')}" />

			<th><g:message code="decision.signer.label" default="Signer" /></th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${results}" status="i" var="decisionInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:remoteLink action="show" id="${decisionInstance.id}" update="decision" onComplete="hideResultsShowDecision();" params="['source':source]">
						${decisionInstance.ada}
					</g:remoteLink></td>

				<td>
					${decisionInstance.decisionToCorrect}
				</td>

				<td><g:formatDate date="${decisionInstance.date}" /></td>

				<%--<td>
							${decisionInstance.documentUrl}
						</td>
						--%>
				<td>
					${decisionInstance.protocolNumber}
				</td>

				<td>
					${decisionInstance.signer}
				</td>

			</tr>
		</g:each>
	</tbody>
</table>