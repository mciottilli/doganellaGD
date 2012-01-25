<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" media="all" type="text/css"
          href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
    <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}"/>
    <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
    <g:jqDatepickerLocale lang="it"/>
    <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>


<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${praticaInstance}">
        <div class="errors">
            <g:renderErrors bean="${praticaInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${praticaInstance?.id}"/>
        <g:hiddenField name="version" value="${praticaInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td class="name">
                        <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label"
                                                                 default="Numero Protocollo"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                        <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="data"><g:message code="pratica.data.label" default="Data"/></label>
                    </td>
                     <td class="value ${hasErrors(bean: praticaInstance, field: 'data', 'errors')}">
                     	<g:jqDatepicker name="data" changeMonth="true" changeYear="true" value="${praticaInstance?.data}"/>
                     </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="descrizione"><g:message code="pratica.descrizione.label" default="Descrizione"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'descrizione', 'errors')}">
                        <g:textField name="descrizione" value="${praticaInstance?.descrizione}"/>
                    </td>
                </tr>
                <tr class="prop">
                     <td class="name">
                         <label for="descrizione"><g:message code="pratica.numeroPosizione.label" default="Numero Posizione" /></label>
                     </td>
                     <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroPosizione', 'errors')}">
                         <g:textField name="numeroPosizione" value="${praticaInstance?.numeroPosizione}"/>
                     </td>
                 </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="note"><g:message code="pratica.note.label" default="Note"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'note', 'errors')}">
                        <g:textField name="note" value="${praticaInstance?.note}"/>
                    </td>
                </tr>

              

                <tr class="prop">
                    <td class="name">
                        <label for="fruitore"><g:message code="pratica.fruitore.label" default="Fruitore"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                        <g:select name="fruitore.id" from="${it.solvingteam.doganellaGD.core.Fruitore.list()}"
                                  optionKey="id" value="${praticaInstance?.fruitore?.id}" noSelection="['null': '']"/>
                    </td>
                </tr>
                
                 <tr class="prop">
                     <td valign="top" class="name">
                         <label for="contenzioso"><g:message code="pratica.contenzioso.label" default="Contenzioso" /></label>
                     </td>
                     <td valign="top" class="value ${hasErrors(bean: praticaInstance, field: 'contenzioso', 'errors')}">
                         <g:checkBox name="contenzioso" value="${praticaInstance?.contenzioso}" />
                     </td>
                 </tr>
                
				<tr class="prop">
                      <td valign="top" class="name"><g:message code="pratica.allegati.label" default="Allegati" /></td>
                      <td valign="top" style="text-align: left;" class="value">
                      <g:link controller="pratica" action="attachDocument" params="[id:praticaInstance.id]">Documenti</g:link>
                     </td>
                 </tr>
                 
                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="update"
                                                 value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </div>
    </g:form>
    <div class="navigation">
         <g:link class="button_nav" action="show" params="[id:praticaInstance.id]" ><g:message code="default.label.indietro" /></g:link>
    </div>
</div>
</body>
</html>
