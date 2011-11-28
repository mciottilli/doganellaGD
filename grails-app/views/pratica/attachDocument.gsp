
<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Documenti')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
           <fieldset>
         
                <table>
                <thead>
                	<tr>
                		<th>Nome File</th>
                		<th>Data Creazione</th>
                		<th>Visualizza</th>
                		<th>Elimina</th>
                	</tr>
                </thead>
                 <g:each var="index" in="${praticaInstance.allegati}">
                <tr>
                 	<td>${index.docName}</td>
                 	<td><g:formatDate format="dd/MM/yyy" date="${index.dataCreazione}"/></td>
                 	<td><g:link action="showDocumento" params="[id:index.id]">Mostra</g:link></td>
                 	<td><g:link action="deleteDocumento" params="[id:index.id,idPratica:praticaInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Elimina</g:link></td>
                </tr>
                 </g:each>
                </table>
             
             </fieldset>   
             
             <fieldset>
                 <g:uploadForm  >
        
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td  class="name"><g:message code="default.allega.documento" default="Allega" /></td>
                            
                            <td  class="value"><input name="allegati" type="file" /></td>
                            
                        </tr>
                    
                       
                    </tbody>
                </table>
                 <div class="buttons">
                    <g:hiddenField name="id" value="${praticaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="save" action="saveDocument" value="${message(code: 'default.button.save.label', default: 'Salva')}" /></span>
            	</div>
            </g:uploadForm>
            </fieldset>
             
            </div>
           
       
    </body>
</html>
