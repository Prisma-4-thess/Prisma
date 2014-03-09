<%@ page import="prisma.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="post.text.label" default="Text" />
		
	</label>
	<g:textField name="text" value="${postInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="post.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${postInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'decision', 'error')} required">
	<label for="decision">
		<g:message code="post.decision.label" default="Decision" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="decision" name="decision.id" from="${prisma.Decision.list()}" optionKey="id" required="" value="${postInstance?.decision?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="post.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${postInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="post.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${postInstance?.lastName}"/>
</div>

