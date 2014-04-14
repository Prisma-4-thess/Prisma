<%@ page import="prisma.Similar" %>



<div class="fieldcontain ${hasErrors(bean: similarInstance, field: 'decision', 'error')} required">
    <label for="decision">
        <g:message code="similar.decision.label" default="Decision"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="decision" name="decision.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${similarInstance?.decision?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: similarInstance, field: 'sim_decision', 'error')} required">
    <label for="sim_decision">
        <g:message code="similar.sim_decision.label" default="Simdecision"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="sim_decision" name="sim_decision.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${similarInstance?.sim_decision?.id}" class="many-to-one"/>
</div>

