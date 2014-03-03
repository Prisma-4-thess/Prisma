<%@ page import="prisma.Extra"%>



<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'name', 'error')} required">
	<label for="name"> <g:message code="extra.name.label"
			default="Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${extraInstance?.name}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'decision_exts', 'error')} ">
	<label for="decision_exts"> <g:message
			code="extra.decision_exts.label" default="Decisionexts" />

	</label>

	<ul class="one-to-many">
		<g:each in="${extraInstance?.decision_exts?}" var="d">
			<li><g:link controller="decision_ext" action="show" id="${d.id}">
					${d}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="decision_ext" action="create"
				params="['extra.id': extraInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'decision_ext.label', default: 'Decision_ext')])}
			</g:link></li>
	</ul>

</div>

<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'formName', 'error')} ">
	<label for="formName"> <g:message code="extra.formName.label"
			default="Form Name" />

	</label>
	<g:textField name="formName" value="${extraInstance?.formName}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'label', 'error')} ">
	<label for="label"> <g:message code="extra.label.label"
			default="Label" />

	</label>
	<g:textField name="label" value="${extraInstance?.label}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'required', 'error')} ">
	<label for="required"> <g:message code="extra.required.label"
			default="Required" />

	</label>
	<g:checkBox name="required" value="${extraInstance?.required}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'type', 'error')} required">
	<label for="type"> <g:message code="extra.type.label"
			default="Type" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${prisma.Type.list()}"
		optionKey="id" required="" value="${extraInstance?.type?.id}"
		class="many-to-one" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: extraInstance, field: 'validationType', 'error')} ">
	<label for="validationType"> <g:message
			code="extra.validationType.label" default="Validation Type" />

	</label>
	<g:textField name="validationType"
		value="${extraInstance?.validationType}" />
</div>

