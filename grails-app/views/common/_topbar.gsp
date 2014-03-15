<sec:ifLoggedIn>

	<li><g:if test="sec.role()=='ROLE_ADMIN'">
			<g:link mapping="adminPanel">
				${sec.username()}
			</g:link>
		</g:if> <g:else>
			<g:link url="#">
				${sec.username()}
			</g:link>
		</g:else></li>|<li><g:link controller="logout" action="index">
			<g:message code="topbar.logout" />
		</g:link></li>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
	<g:link controller="login" action="index">
		<g:message code="topbar.login" />
	</g:link>
</sec:ifNotLoggedIn>
