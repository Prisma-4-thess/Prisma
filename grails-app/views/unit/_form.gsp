<%@ page import="prisma.Unit" %>



<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="unit.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${unitInstance?.label}"/>
</div>

