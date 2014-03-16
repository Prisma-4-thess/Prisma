<table id="one-column-emphasis" class="search_table">
	<thead>
		<tr>

			<util:remoteSortableColumn property="ada" controller="search"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.ada.label', default: 'Ada')}"
				params="['source':source]" />

			<th><g:message code="decision.decisionToCorrect.label"
					default="Decision To Correct" /></th>

			<util:remoteSortableColumn property="date" controller="search"
				update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.date.label', default: 'Date')}"
				params="['source':source]" />

			<%--<g:sortableColumn property="documentUrl"
						title="${message(code: 'decision.documentUrl.label', default: 'Document Url')}" params="['source':source]"/>
					--%>
			<util:remoteSortableColumn property="protocolNumber"
				controller="search" update="one-column-emphasis" action="sort"
				title="${message(code: 'decision.protocolNumber.label', default: 'Protocol Number')}"
				params="['source':source]" />

			<th><g:message code="decision.signer.label" default="Signer" /></th>

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
					</g:if> <g:if test="${source=='map'}">
						<g:remoteLink controller="search" action="show"
							id="${decisionInstance.id}" update="decision"
							params="['source':source]">
							${decisionInstance.ada}
						</g:remoteLink>
					</g:if> <g:else>
						<g:link controller="search" action="show"
							id="${decisionInstance.id}" params="['source':source]"
							target="_blank">
							${decisionInstance.ada}
						</g:link>
					</g:else></td>
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