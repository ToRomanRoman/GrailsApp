
<%@ page import="flok.Boss" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'boss.label', default: 'Boss')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-boss" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
                <li><g:if test="${session.user}"><g:link class="list" action="logout"><g:message code="Logout" args="[entityName]" /></g:link></g:if></li>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a href="/Flok/slaves/index" class="list">Slaves List</a></li>
			</ul>
		</div>
		<div id="list-boss" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="login" title="${message(code: 'boss.login.label', default: 'Login')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'boss.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bossInstanceList}" status="i" var="bossInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bossInstance.id}">${fieldValue(bean: bossInstance, field: "login")}</g:link></td>
					
						<td>${fieldValue(bean: bossInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bossInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
