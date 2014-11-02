<%@ page import="flok.Slaves" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'slaves.label', default: 'Slaves')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-slaves" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>

        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li><g:form action="slaves" method="post" enctype="multipart/form-data">
            <input name="data" type="file"><br>
            <fieldset class="buttons">
                <g:submitButton name="slaves" class="save" value="imports" action="slaves"/>
            </fieldset>
        </g:form></li>
    </ul>
</div>

<div id="list-slaves" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'slaves.name.label', default: 'Name')}"/>

            <g:sortableColumn property="email" title="${message(code: 'slaves.email.label', default: 'Email')}"/>

            <g:sortableColumn property="adress" title="${message(code: 'slaves.adress.label', default: 'Adress')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${slavesInstanceList}" status="i" var="slavesInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${slavesInstance.id}">${fieldValue(bean: slavesInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: slavesInstance, field: "email")}</td>

                <td>${fieldValue(bean: slavesInstance, field: "adress")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${slavesInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
