<%@ page import="prisma.Organization"%>



<div
	class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'label', 'error')} required">
	<label for="label"> <g:message code="organization.label.label"
			default="Label" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required=""
		value="${organizationInstance?.label}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'active', 'error')} ">
	<label for="active"> <g:message
			code="organization.active.label" default="Active" />

	</label>
	<g:checkBox name="active" value="${organizationInstance?.active}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'latinName', 'error')} ">
	<label for="latinName"> <g:message
			code="organization.latinName.label" default="Latin Name" />

	</label>
	<g:textField name="latinName"
		value="${organizationInstance?.latinName}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'units', 'error')} ">
	<label for="units"> <g:message code="organization.units.label"
			default="Units" />

	</label>

	<ul class="one-to-many">
		<g:each in="${organizationInstance?.units?}" var="u">
			<li><g:link controller="unit" action="show" id="${u.id}">
					${u}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="unit" action="create"
				params="['organization.id': organizationInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'unit.label', default: 'Unit')])}
			</g:link></li>
	</ul>

</div>

