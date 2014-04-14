<%@ page import="prisma.Tag" %>



<div
        class="fieldcontain ${hasErrors(bean: tagInstance, field: 'label', 'error')} required">
    <label for="label"><g:message code="tag.label.label"
                                  default="Label"/> <span class="required-indicator">*</span>
    </label>
    <g:textField name="label" required="" value="${tagInstance?.label}"/>
</div>

