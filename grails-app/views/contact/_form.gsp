<%@ page import="prisma.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="contact.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${contactInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="contact.email.label" default="Email"/>

    </label>
    <g:field type="email" name="email" value="${contactInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'message', 'error')} ">
    <label for="message">
        <g:message code="contact.message.label" default="Message"/>

    </label>
    <g:textField name="message" value="${contactInstance?.message}"/>
</div>

