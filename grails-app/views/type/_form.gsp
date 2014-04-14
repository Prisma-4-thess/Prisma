<%@ page import="prisma.Type" %>



<div
        class="fieldcontain ${hasErrors(bean: typeInstance, field: 'label', 'error')} required">
    <label for="label"><g:message code="type.label.label"
                                  default="Label"/> <span class="required-indicator">*</span>
    </label>
    <g:textField name="label" required="" value="${typeInstance?.label}"/>
</div>

<div
        class="fieldcontain ${hasErrors(bean: typeInstance, field: 'extras', 'error')} ">
    <label for="extras"><g:message code="type.extras.label"
                                   default="Extras"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${typeInstance?.extras ?}" var="e">
            <li><g:link controller="extra" action="show" id="${e.id}">
                ${e}
            </g:link></li>
        </g:each>
        <li class="add"><g:link controller="extra" action="create"
                                params="['type.id': typeInstance?.id]">
            ${message(code: 'default.add.label', args: [message(code: 'extra.label', default: 'Extra')])}
        </g:link></li>
    </ul>

</div>

