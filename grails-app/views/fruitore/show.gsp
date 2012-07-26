<%@ page import="it.solvingteam.doganellaGD.core.Fruitore" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'fruitore.label', default: 'Fruitore')}"/>
    <title><g:message code="label.fruitore.dettaglio" /></title>
</head>

<body>

<div class="body">
    <h1><g:message code="label.fruitore.dettaglio" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>

          

            <tr class="prop">
                <td class="name"><g:message code="fruitore.nome.label" default="Nome"/></td>

                <td class="value">${fieldValue(bean: fruitoreInstance, field: "nome")}</td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="fruitore.cognome.label" default="Cognome"/></td>

                <td class="value">${fieldValue(bean: fruitoreInstance, field: "cognome")}</td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="fruitore.dataNascita.label" default="Data Nascita"/></td>

                <td class="value"><g:formatDate date="${fruitoreInstance?.dataNascita}"/></td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="fruitore.codice.label" default="Codice"/></td>

                <td class="value">${fieldValue(bean: fruitoreInstance, field: "codice")}</td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${fruitoreInstance?.id}"/>
        	<g:hiddenField name="offset" value="${params.offset}"/>
            <g:hiddenField name="max" value="${params.max}"/>
            <span class="button"><g:actionSubmit class="edit" action="edit"
                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </g:form>
    </div>
     <div class="navigation">
        <g:link class="button_nav" action="resultNavigation" params="[max:params.max,offset:params.offset]" ><g:message code="default.label.indietro" /></g:link>
    </div>
</div>
</body>
</html>
