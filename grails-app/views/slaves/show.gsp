<%@ page import="flok.Slaves" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'slaves.label', default: 'Slaves')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<a href="#show-slaves" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li><g:if test="${session.user}"><g:link class="list" action="logout"><g:message code="Logout" args="[entityName]" /></g:link></g:if></li>

    </ul>
</div>

<div id="show-slaves" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list slaves">

        <g:if test="${slavesInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="slaves.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${slavesInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${slavesInstance?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="slaves.email.label"
                                                                         default="Email"/></span>

                <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${slavesInstance}"
                                                                                         field="email"/></span>

            </li>
        </g:if>

        <g:if test="${slavesInstance?.adress}">
            <li class="fieldcontain">
                <span id="adress-label" class="property-label"><g:message code="slaves.adress.label"
                                                                          default="Adress"/></span>

                <span class="property-value" aria-labelledby="adress-label"><g:fieldValue bean="${slavesInstance}"
                                                                                          field="adress"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: slavesInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${slavesInstance}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
