<div align="center">
    <font color="red"><g:if test="${pass_error}">
        <g:message code="springSecurity.errors.register.passwordfail"/>
    </g:if> <g:else>
        <g:hasErrors bean="${user}">
            <g:eachError bean="${user}" var="error">
                <g:message error="${error}"/>
                <br>
            </g:eachError>
        </g:hasErrors>
    </g:else>
    </font>
    <g:if test="${success}">
        <font color="green"><g:message code="springSecurity.login.success"/></font>
    </g:if>
</div>