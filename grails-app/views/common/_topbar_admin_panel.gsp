

<sec:ifLoggedIn>

	<g:if test="sec.username()=='admin'">
			<g:link mapping="adminPanel">
				${sec.username()}
			</g:link>
		</g:if> <g:else>
			<g:link url="#">
				${sec.username()}
			</g:link>
		</g:else>|<g:link controller="logout" action="index">
			<g:message code="topbar.logout" />
		</g:link>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
	<g:link controller="login" action="index">
		<g:message code="topbar.login" />
	</g:link>
</sec:ifNotLoggedIn>
