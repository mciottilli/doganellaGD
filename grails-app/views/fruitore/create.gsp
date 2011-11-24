

<%@ page import="it.solvingteam.doganellaGD.core.Fruitore" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fruitore.label', default: 'Fruitore')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fruitoreInstance}">
            <div class="errors">
                <g:renderErrors bean="${fruitoreInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td  class="name">
                                    <label for="nome"><g:message code="fruitore.nome.label" default="Nome" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: fruitoreInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${fruitoreInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                    <label for="cognome"><g:message code="fruitore.cognome.label" default="Cognome" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: fruitoreInstance, field: 'cognome', 'errors')}">
                                    <g:textField name="cognome" value="${fruitoreInstance?.cognome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                    <label for="dataNascita"><g:message code="fruitore.dataNascita.label" default="Data Nascita" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: fruitoreInstance, field: 'dataNascita', 'errors')}">
                                    <g:datePicker name="dataNascita" precision="day" value="${fruitoreInstance?.dataNascita}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                    <label for="codice"><g:message code="fruitore.codice.label" default="Codice" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: fruitoreInstance, field: 'codice', 'errors')}">
                                    <g:textField name="codice" value="${fruitoreInstance?.codice}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
