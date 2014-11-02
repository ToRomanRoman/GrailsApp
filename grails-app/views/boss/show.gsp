
<%@ page import="flok.Boss" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boss.label', default: 'Boss')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-boss" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>

                <li><g:if test="${session.user}"><g:link class="list" action="logout"><g:message code="Logout" args="[entityName]" /></g:link></g:if></li>
                <li><a href="/Flok/slaves/index" class="list">Slaves List</a></li>
            </ul>
		</div>
		<div id="show-boss" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list boss">
			
				<g:if test="${bossInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="boss.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${bossInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bossInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="boss.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${bossInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bossInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bossInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
