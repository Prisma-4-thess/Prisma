<%@ page import="prisma.Predefined" %>



<div class="fieldcontain ${hasErrors(bean: predefinedInstance, field: 'decision', 'error')} required">
    <label for="decision">
        <g:message code="decision.label" default="Decision"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="decision" name="decision.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${predefinedInstance?.decision?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predefinedInstance, field: 'geo', 'error')} required">
    <label for="geo">
        <g:message code="geo.label" default="Geo"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="geo" name="geo.id" from="${prisma.Geo.list()}" optionKey="id" required="" value="${predefinedInstance?.geo?.id}" class="many-to-one"/>
</div>

