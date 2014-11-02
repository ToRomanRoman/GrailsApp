<%@ page import="flok.Slaves" %>



<div class="fieldcontain ${hasErrors(bean: slavesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="slaves.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${slavesInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: slavesInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="slaves.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${slavesInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: slavesInstance, field: 'adress', 'error')} required">
	<label for="adress">
		<g:message code="slaves.adress.label" default="Adress" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="adress" required="" value="${slavesInstance?.adress}"/>

</div>

