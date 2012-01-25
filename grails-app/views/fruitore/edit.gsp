<%@ page import="it.solvingteam.doganellaGD.core.Fruitore" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" media="all" type="text/css"
          href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
    <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
    <g:jqDatepickerLocale lang="it"/>
    <g:set var="entityName" value="${message(code: 'fruitore.label', default: 'Fruitore')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>


<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${fruitoreInstance}">
        <div class="errors">
            <g:renderErrors bean="${fruitoreInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${fruitoreInstance?.id}"/>
        <g:hiddenField name="version" value="${fruitoreInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td class="name">
                        <label for="nome"><g:message code="fruitore.nome.label" default="Nome"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: fruitoreInstance, field: 'nome', 'errors')}">
                        <g:textField name="nome" value="${fruitoreInstance?.nome}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="cognome"><g:message code="fruitore.cognome.label" default="Cognome"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: fruitoreInstance, field: 'cognome', 'errors')}">
                        <g:textField name="cognome" value="${fruitoreInstance?.cognome}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="dataNascita"><g:message code="fruitore.dataNascita.label"
                                                            default="Data Nascita"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: fruitoreInstance, field: 'dataNascita', 'errors')}">
                      <g:jqDatepicker name="dataNascita"  value="${fruitoreInstance?.dataNascita}" changeMonth="true" changeYear="true"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="codice"><g:message code="fruitore.codice.label" default="Codice"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: fruitoreInstance, field: 'codice', 'errors')}">
                        <g:textField name="codice" value="${fruitoreInstance?.codice}"/>
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
        <g:link class="button_nav" action="show" params="[id:fruitoreInstance.id]" ><g:message code="default.label.indietro" /></g:link>
    </div>
</div>
</body>
</html>
