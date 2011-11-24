

<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" media="all" type="text/css"  href="${resource(dir:'css/redmond', file:'jquery-ui-1.8.13.custom.css')}" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}" />
          <g:javascript src="jQuery/jquery-1.5.1.min.js" />
	    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js" />
       <g:jqDatepickerLocale lang="it" />
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
            <g:hasErrors bean="${praticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${praticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                                    <g:jqDatepicker name="data"  changeMonth="true" changeYear="true"  />
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
                                    <label for="fruitore"><g:message code="pratica.fruitore.label" default="Fruitore" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                    <g:textField name="fruitore" id="fruitore" />
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
