<ul>
    <li>
        <label><g:message code="search.numberOfDecisions" />:</label> <span>${typeDecisions}</span>
    </li>
    <li>
        <label><g:message code="extra.label" />:</label>
        <g:each in="${type.extras}">${it.label},</g:each>

    </li>
</ul>