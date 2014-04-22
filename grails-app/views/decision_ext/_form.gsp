<%@ page import="prisma.Decision_ext" %>



<div
        class="fieldcontain ${hasErrors(bean: decision_extInstance, field: 'extra', 'error')} ">
    <label for="extra"><g:message code="decision_ext.extra.label"
                                  default="Extra"/>

    </label>
    <g:select id="extra" name="extra.id" from="${prisma.Extra.list()}"
              optionKey="id" value="${decision_extInstance?.extra?.id}"
              class="many-to-one" noSelection="['null': '']"/>
</div>

<div
        class="fieldcontain ${hasErrors(bean: decision_extInstance, field: 'decision', 'error')} required">
    <label for="decision"><g:message
            code="decision_ext.decision.label" default="Decision"/> <span
            class="required-indicator">*</span>
    </label>
    <g:select id="decision" name="decision.id"
              from="${prisma.Decision.list()}" optionKey="id" required=""
              value="${decision_extInstance?.decision?.id}" class="many-to-one"/>
</div>

<div
        class="fieldcontain ${hasErrors(bean: decision_extInstance, field: 'value', 'error')} ">
    <label for="value"><g:message code="decision_ext.value.label"
                                  default="Value"/>

    </label>
    <g:textField name="value" value="${decision_extInstance?.value}"/>
</div>

