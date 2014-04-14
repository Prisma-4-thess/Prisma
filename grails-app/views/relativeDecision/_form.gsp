<%@ page import="prisma.RelativeDecision" %>



<div class="fieldcontain ${hasErrors(bean: relativeDecisionInstance, field: 'finalDec', 'error')} required">
    <label for="finalDec">
        <g:message code="relativeDecision.finalDec.label" default="Final Dec"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="finalDec" name="finalDec.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${relativeDecisionInstance?.finalDec?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relativeDecisionInstance, field: 'relatedDec', 'error')} required">
    <label for="relatedDec">
        <g:message code="relativeDecision.relatedDec.label" default="Related Dec"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="relatedDec" name="relatedDec.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${relativeDecisionInstance?.relatedDec?.id}" class="many-to-one"/>
</div>

