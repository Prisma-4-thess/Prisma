<sec:ifLoggedIn>

	<li><sec:ifAllGranted roles="ROLE_ADMIN">
			<g:link mapping="adminPanel">
				${sec.username()}
			</g:link>
		</sec:ifAllGranted> <sec:ifAllGranted roles="ROLE_USER">
			<g:link url="#">
				${sec.username()}
			</g:link>
		</sec:ifAllGranted>
		<sec:ifAllGranted roles="ROLE_MODERATOR">
			<g:link mapping="modPanel">
				${sec.username()}
			</g:link>
		</sec:ifAllGranted>
		<sec:ifAllGranted roles="ROLE_UPLOADER">
			<g:link mapping="upPanel">
				${sec.username()}
			</g:link>
		</sec:ifAllGranted></li>|<li><g:link controller="logout" action="index">
			<g:message code="topbar.logout" />
		</g:link></li>
</sec:ifLoggedIn>

<sec:ifNotLoggedIn>
	<g:link controller="login" action="index">
		<g:message code="topbar.login" />
	</g:link>
</sec:ifNotLoggedIn>
