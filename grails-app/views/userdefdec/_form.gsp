<%@ page import="prisma.Userdefdec" %>



<div class="fieldcontain ${hasErrors(bean: userdefdecInstance, field: 'decision', 'error')} required">
    <label for="decision">
        <g:message code="decision.label" default="Decision"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="decision" name="decision.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${userdefdecInstance?.decision?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userdefdecInstance, field: 'geo', 'error')} required">
    <label for="geo">
        <g:message code="geo.label" default="Geo"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="geo" name="geo.id" from="${prisma.Userdefgeo.list()}" optionKey="id" required="" value="${userdefdecInstance?.geo?.id}" class="many-to-one"/>
</div>

