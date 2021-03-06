<%@ page import="prisma.Decision" %>



<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'ada', 'error')} required">
    <label for="ada">
        <g:message code="decision.ada.label" default="Ada"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="ada" required="" value="${decisionInstance?.ada}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'decisionToCorrect', 'error')} ">
    <label for="decisionToCorrect">
        <g:message code="decision.decisionToCorrect.label" default="Decision To Correct"/>

    </label>
    <g:select id="decisionToCorrect" name="decisionToCorrect.id" from="${prisma.Decision.list()}" optionKey="id" value="${decisionInstance?.decisionToCorrect?.id}" class="many-to-one"
              noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'geo', 'error')} ">
    <label for="geo">
        <g:message code="decision.geo.label" default="Geo"/>

    </label>
    <g:select id="geo" name="geo.id" from="${prisma.Geo.list()}" optionKey="id" value="${decisionInstance?.geo?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="decision.date.label" default="Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="date" precision="day" value="${decisionInstance?.date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'documentUrl', 'error')} ">
    <label for="documentUrl">
        <g:message code="decision.documentUrl.label" default="Document Url"/>

    </label>
    <g:textField name="documentUrl" value="${decisionInstance?.documentUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'protocolNumber', 'error')} ">
    <label for="protocolNumber">
        <g:message code="decision.protocolNumber.label" default="Protocol Number"/>

    </label>
    <g:textField name="protocolNumber" value="${decisionInstance?.protocolNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'signer', 'error')} required">
    <label for="signer">
        <g:message code="decision.signer.label" default="Signer"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="signer" name="signer.id" from="${prisma.Signer.list()}" optionKey="id" required="" value="${decisionInstance?.signer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'subject', 'error')} ">
    <label for="subject">
        <g:message code="decision.subject.label" default="Subject"/>

    </label>
    <g:textField name="subject" value="${decisionInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'tags', 'error')} ">
    <label for="tags">
        <g:message code="decision.tags.label" default="Tags"/>

    </label>
    <g:select name="tags" from="${prisma.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.tags*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'type', 'error')} required">
    <label for="type">
        <g:message code="decision.type.label" default="Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="type" name="type.id" from="${prisma.Type.list()}" optionKey="id" required="" value="${decisionInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'unit', 'error')} required">
    <label for="unit">
        <g:message code="decision.unit.label" default="Unit"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="unit" name="unit.id" from="${prisma.Unit.list()}" optionKey="id" required="" value="${decisionInstance?.unit?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'url', 'error')} ">
    <label for="url">
        <g:message code="decision.url.label" default="Url"/>

    </label>
    <g:textField name="url" value="${decisionInstance?.url}"/>
</div>

