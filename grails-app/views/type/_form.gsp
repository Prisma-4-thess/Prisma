<%@ page import="prisma.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="type.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${typeInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'extras', 'error')} ">
	<label for="extras">
		<g:message code="type.extras.label" default="Extras" />
		
	</label>
	<g:select name="extras" from="${prisma.Extra.list()}" multiple="multiple" optionKey="id" size="5" value="${typeInstance?.extras*.id}" class="many-to-many"/>
</div>

