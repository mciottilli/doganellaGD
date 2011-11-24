

<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${praticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${praticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${praticaInstance?.id}" />
                <g:hiddenField name="version" value="${praticaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label" default="Numero Protocollo" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                    <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="data"><g:message code="pratica.data.label" default="Data" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'data', 'errors')}">
                                    <g:datePicker name="data" precision="day" value="${praticaInstance?.data}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="descrizione"><g:message code="pratica.descrizione.label" default="Descrizione" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'descrizione', 'errors')}">
                                    <g:textField name="descrizione" value="${praticaInstance?.descrizione}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="note"><g:message code="pratica.note.label" default="Note" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'note', 'errors')}">
                                    <g:textField name="note" value="${praticaInstance?.note}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="allegati"><g:message code="pratica.allegati.label" default="Allegati" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'allegati', 'errors')}">
                                    <g:select name="allegati" from="${it.solvingteam.doganellaGD.documentazione.DocumentObject.list()}" multiple="yes" optionKey="id" size="5" value="${praticaInstance?.allegati*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="fruitore"><g:message code="pratica.fruitore.label" default="Fruitore" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                    <g:select name="fruitore.id" from="${it.solvingteam.doganellaGD.core.Fruitore.list()}" optionKey="id" value="${praticaInstance?.fruitore?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
