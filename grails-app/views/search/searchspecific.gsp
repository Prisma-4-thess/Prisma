<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<div class="body">

		<g:each var="result" in="${results}">
			<li class="fieldcontain"><g:link controller="decision"
					action="show" id="${result.id}">
					${result}
				</g:link></li>
		</g:each>

	</div>
</body>
</html>