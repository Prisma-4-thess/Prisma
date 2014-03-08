<g:if test="${results}">
	<div id="list-decision" class="content scaffold-list" role="main">

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:render template="/common/table_results" />
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