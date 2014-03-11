

<sec:ifLoggedIn>

	<li><g:link url="/Prisma/admin_panel">
			${sec.username()}
		</g:link></li>|<li><g:link controller="logout" action="index">
			<g:message code="topbar.logout" />
		</g:link></li>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
	<g:link controller="login" action="index">
		<g:message code="topbar.login" />
	</g:link>
</sec:ifNotLoggedIn>
