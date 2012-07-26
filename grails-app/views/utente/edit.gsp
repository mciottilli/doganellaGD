<%@ page import="it.solvingteam.doganellaGD.security.Utente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'utente.label', default: 'Utente')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
         <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    	<g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
      <g:javascript library="jQuery/jquery.validate" />
       <script type="text/javascript">
 
  	  $(document).ready(function(){
  		  var validator = $("#edit").validate({
  	  		
  				rules: {
  					nome: "required",
  					cognome: "required",
  					username: "required"
  				},
  				messages: {
  					nome: "Campo Obbligatorio",
  					cognome: "Campo Obbligatorio",
  					username: "Campo Obbligatorio"
  				
  					
  				}
  		  });
  	  });
    </script>
    </head>
    <body>
       
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${utenteInstance}">
            <div class="errors">
                <g:renderErrors bean="${utenteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="edit">
                <g:hiddenField name="id" value="${utenteInstance?.id}" />
                <g:hiddenField name="version" value="${utenteInstance?.version}" />
                <g:hiddenField name="max" value="${params.max}" />
                <g:hiddenField name="offset" value="${params.offset}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                         <tr class="prop">
                                <td  class="name">
                                  <label for="nome"><g:message code="utente.nome.label" default="Nome" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: utenteInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${utenteInstance?.nome}" />
                                </td>
                            </tr>
                             <tr class="prop">
                                <td  class="name">
                                  <label for="cognome"><g:message code="utente.cognome.label" default="Cognome" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: utenteInstance, field: 'cognome', 'errors')}">
                                    <g:textField name="cognome" value="${utenteInstance?.cognome}" />
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="username"><g:message code="utente.username.label" default="Username" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: utenteInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${utenteInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="enabled"><g:message code="utente.enabled.label" default="Abilitato" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: utenteInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${utenteInstance?.enabled}" />
                                </td>
                            </tr>
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                     <span class="button"><g:actionSubmit class="changePwd" action="changePassword" value="Cambia Password" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
            <div class="navigation">
            	   <g:link controller="utente" action="show" params="[id:utenteInstance.id,max:params.max,offset:params.offset]" class="button_nav"><g:message code="default.label.indietro" /></g:link>
            </div>
        </div>
    </body>
</html>
