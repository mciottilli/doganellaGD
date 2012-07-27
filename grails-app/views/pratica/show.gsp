<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}"/>
    <title><g:message code="label.pratica.dettaglio" /></title>
</head>

<body>

<div class="body">
    <h1><g:message code="label.pratica.dettaglio" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>
			
			<tr class="prop">
                <td class="name"><g:message code="pratica.stato.label" default="Stato"/></td>

                <td class="value">${praticaInstance?.stato?.descrizione?.encodeAsHTML()}</td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="pratica.numeroProtocollo.label" default="Numero Protocollo"/></td>

                <td class="value">${fieldValue(bean: praticaInstance, field: "numeroProtocollo")}</td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="pratica.dataAcquisizione.label" default="Data Acquisizione"/></td>

                <td class="value"><g:formatDate format="dd/MM/yyyy" date="${praticaInstance?.dataAcquisizione}"/></td>

            </tr>
            
             <tr class="prop">
                <td class="name"><g:message code="pratica.dataAccettazione.label" default="Data Accettazione"/></td>

                <td class="value"><g:formatDate format="dd/MM/yyyy" date="${praticaInstance?.dataAccettazione}"/></td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="pratica.descrizione.label" default="Descrizione"/></td>

                <td class="value">${fieldValue(bean: praticaInstance, field: "descrizione")}</td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="pratica.note.label" default="Note"/></td>

                <td class="value">${fieldValue(bean: praticaInstance, field: "note")}</td>

            </tr>

            <tr class="prop">
                <td class="name"><g:message code="pratica.fruitore.label" default="Fruitore"/></td>

                <td class="value">${praticaInstance?.fruitore?.encodeAsHTML()}</td>

            </tr>
				<tr class="prop">
                            <td valign="top" class="name"><g:message code="pratica.numeroPosisizione.label" default="Posizione" /></td>
                            
                            <td valign="top" class="value">${praticaInstance?.numeroPosizione}</td>
                            
                        </tr>
            		<tr class="prop">
                            <td valign="top" class="name"><g:message code="pratica.contenzioso.label" default="Contenzioso" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${praticaInstance?.contenzioso}" /></td>
                            
                        </tr>
             		<tr class="prop">
                            <td valign="top" class="name"><g:message code="pratica.allegati.label" default="Allegati" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                            <g:link controller="pratica" action="attachDocument" params="[id:praticaInstance.id,max:params.max,offset:params.offset]"><img src="${resource(dir:'images',file:'documenti.gif')}" alt="${message(code: 'default.label.table.documenti')}" border="0" title="${message(code: 'default.label.table.documenti')}" /></g:link>
                               
                            </td>
                            
                        </tr>
            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${praticaInstance?.id}"/>
            <g:hiddenField name="offset" value="${params.offset}"/>
            <g:hiddenField name="max" value="${params.max}"/>
            <g:hiddenField name="contenzioso" value="${params.contenzioso }"/>
            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </g:form>
    </div>
  <div class="navigation">
    <g:if test="${params.contenzioso == 'si'}">
     <g:link class="button_nav" action="resultContenziosoNavigation" params="[max:params.max,offset:params.offset]"><g:message code="default.label.indietro" /></g:link>
    </g:if>
   <g:else>
    <g:link class="button_nav" action="resultNavigation" params="[max:params.max,offset:params.offset]"><g:message code="default.label.indietro" /></g:link>
   </g:else>
  </div>
</div>
</body>
</html>
