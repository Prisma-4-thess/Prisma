<g:if test="${results}">
	<div id="list-decision" class="content scaffold-list" role="main">

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="ada"
						title="${message(code: 'decision.ada.label', default: 'Ada')}" />

					<th><g:message code="decision.decisionToCorrect.label"
							default="Decision To Correct" /></th>

					<g:sortableColumn property="date"
						title="${message(code: 'decision.date.label', default: 'Date')}" />

					<g:sortableColumn property="documentUrl"
						title="${message(code: 'decision.documentUrl.label', default: 'Document Url')}" />

					<g:sortableColumn property="protocolNumber"
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

						<td>
							${decisionInstance.documentUrl}
						</td>
						
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
		<div class="pagination">
			<util:remotePaginate controller="search" action="list"
				total="${decisionInstanceTotal}" update="list-decision" />
		</div>
	</div>
</g:if>
<g:else>
	<p>No decision matching matches this search</p>
</g:else>
</div>