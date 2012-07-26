
<%@ page import="it.solvingteam.doganellaGD.security.Utente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'utente.label', default: 'Utente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
       
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        
                     <tr class="prop">
                            <td  class="name"><g:message code="utente.nome.label" default="Nome" /></td>
                            
                            <td  class="value">${fieldValue(bean: utenteInstance, field: "nome")}</td>
                            
                        </tr>
                         <tr class="prop">
                            <td  class="name"><g:message code="utente.cognome.label" default="Cognome" /></td>
                            
                            <td  class="value">${fieldValue(bean: utenteInstance, field: "cognome")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td  class="name"><g:message code="utente.username.label" default="Username" /></td>
                            
                            <td  class="value">${fieldValue(bean: utenteInstance, field: "username")}</td>
                            
                        </tr>
                    
                       
                    
                        <tr class="prop">
                            <td  class="name"><g:message code="utente.enabled.label" default="Abilitato" /></td>
                            
                            <td  class="value"><g:formatBoolean boolean="${utenteInstance?.enabled}" /></td>
                            
                        </tr>
                    
                      
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${utenteInstance?.id}" />
                    <g:hiddenField name="max" value="${params.max}" />
                    <g:hiddenField name="offset" value="${params.offset}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
                
            </div>
             <div class="navigation">
            	   <g:link controller="utente" action="list" params="[max:params.max,offset:params.offset]" class="button_nav"><g:message code="default.label.indietro" /></g:link>
            </div>
        </div>
    </body>
</html>
