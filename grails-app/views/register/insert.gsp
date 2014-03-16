<div align="center">
<font color="red">
	<g:if test="${pass_error }">
	Λάθος επιβεβαίωση κωδικού
	</g:if><g:else>
	<g:hasErrors bean="${user}">
		<g:eachError bean="${user}" var="error">
			<g:message error="${error}" /><br>
		</g:eachError>
	</g:hasErrors>
	<g:if test="${success}">
	<font color="green">
	Επιτυχής Εγγραφή
	</font>
	</g:if>
	</g:else>
	</font>
</div>