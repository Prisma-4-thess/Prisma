<%@ page import="prisma.Organization" %>



<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="organization.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${organizationInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="organization.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${organizationInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'latinName', 'error')} ">
	<label for="latinName">
		<g:message code="organization.latinName.label" default="Latin Name" />
		
	</label>
	<g:textField name="latinName" value="${organizationInstance?.latinName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'units', 'error')} ">
	<label for="units">
		<g:message code="organization.units.label" default="Units" />
		
	</label>
	<g:select name="units" from="${prisma.Unit.list()}" multiple="multiple" optionKey="id" size="5" value="${organizationInstance?.units*.id}" class="many-to-many"/>
</div>

