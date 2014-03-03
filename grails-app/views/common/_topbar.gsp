
<div id="menu">
	<nobr>
		<sec:ifLoggedIn>

			<b> ${sec.username()}</b> |
		<g:link controller="logout" action="index">
				<g:message code="topbar.logout" />
			</g:link>

		</sec:ifLoggedIn>

		<sec:ifNotLoggedIn>
			<g:link controller="login" action="auth">
				<g:message code="topbar.login" />
			</g:link>
		</sec:ifNotLoggedIn>

	</nobr>
</div>
