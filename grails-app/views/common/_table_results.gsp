<table id="table-results">
	<thead>
		<tr>

			<util:remoteSortableColumn property="ada" update="table-results"
				action="sort"
				title="${message(code: 'decision.ada.label', default: 'Ada')}" />

			<th><g:message code="decision.decisionToCorrect.label"
					default="Decision To Correct" /></th>

			<util:remoteSortableColumn property="date" update="table-results"
				action="sort"
				title="${message(code: 'decision.date.label', default: 'Date')}" />

			<%--<g:sortableColumn property="documentUrl"
						title="${message(code: 'decision.documentUrl.label', default: 'Document Url')}" />
					--%>
			<util:remoteSortableColumn property="protocolNumber"
				update="table-results" action="sort"
				title="${message(code: 'decision.protocolNumber.label', default: 'Protocol Number')}" />

			<th><g:message code="decision.signer.label" default="Signer" /></th>

		</tr>
	</thead>
	<tbody>
		<g:each in="${results}" status="i" var="decisionInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${decisionInstance.id}">
						${decisionInstance.ada}
					</g:link></td>

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