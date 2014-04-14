<%@ page import="prisma.Unit" %>



<div
        class="fieldcontain ${hasErrors(bean: unitInstance, field: 'label', 'error')} ">
    <label for="label"><g:message code="unit.label.label"
                                  default="Label"/>

    </label>
    <g:textField name="label" value="${unitInstance?.label}"/>
</div>

<div
        class="fieldcontain ${hasErrors(bean: unitInstance, field: 'organization', 'error')} required">
    <label for="organization"><g:message
            code="unit.organization.label" default="Organization"/> <span
            class="required-indicator">*</span>
    </label>
    <g:select id="organization" name="organization.id"
              from="${prisma.Organization.list()}" optionKey="id" required=""
              value="${unitInstance?.organization?.id}" class="many-to-one"/>
</div>

