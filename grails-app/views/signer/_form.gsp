<%@ page import="prisma.Signer" %>



<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="signer.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${signerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="signer.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${signerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="signer.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${signerInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="signer.position.label" default="Position" />
		
	</label>
	<g:textField name="position" value="${signerInstance?.position}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="signer.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${signerInstance?.title}"/>
</div>

