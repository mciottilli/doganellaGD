<%@ page import="it.solvingteam.doganellaGD.security.Utente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'utente.label', default: 'Utente')}" />
        <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
      <g:javascript library="jQuery/jquery.validate" />
        <title>Cambia Password</title>
        <script type="text/javascript">
 
  	  $(document).ready(function(){
  		  var validator = $("#pwd").validate({
  	  		
  				rules: {
  					nuovaPassword: "required",
  					confermaPassword: "required"
  					
  				},
  				messages: {
  					nuovaPassword: "Campo Obbligatorio",
  					confermaPassword: "Campo Obbligatorio"
  					
  				
  					
  				}
  		  });
  	  });
    </script>
    </head>
    <body>
     
        <div class="body">
            <h1>Cambia Password</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${uc}">
            <div class="errors">
                <g:renderErrors bean="${uc}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="pwd">
                <g:hiddenField name="id" value="${utenteInstance?.id}" />
                <g:hiddenField name="version" value="${utenteInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                           
                            <tr>
                                <td>
                                  <label for="newPassword"><g:message code="utente.newPassword.label" default="Nuova Password" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: uc, field: 'newPassword', 'errors')}">
                                    <g:passwordField name="nuovaPassword" />
                                </td>
                            </tr>
                            
                             <tr>
                                <td>
                                  <label for="confirmPassword"><g:message code="utente.confirmPassword.label" default="Conferma Password" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: uc, field: 'confirmPassword', 'errors')}">
                                    <g:passwordField name="confermaPassword" />
                                </td>
                            </tr>
                             
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="updatePassword" value="${message(code: 'default.button.update.label', default: 'Modifica')}" /></span>
                </div>
            </g:form>
             <div class="navigation">
            	   <g:link controller="utente" action="edit" params="[id:utenteInstance.id,max:params.max,offset:params.offset]" class="button_nav"><g:message code="default.label.indietro" /></g:link>
            </div>
        </div>
    </body>
</html>
