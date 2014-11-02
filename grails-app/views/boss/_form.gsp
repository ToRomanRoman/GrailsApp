<%@ page import="flok.Boss" %>



<div class="fieldcontain ${hasErrors(bean: bossInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="boss.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${bossInstance?.login}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bossInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="boss.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${bossInstance?.password}"/>

</div>

