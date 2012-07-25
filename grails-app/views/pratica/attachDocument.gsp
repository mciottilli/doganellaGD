<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Documenti')}"/>
    
     <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
   <g:javascript library="jQuery/jquery.validate" />
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <script type="text/javascript">
 
  	  $(document).ready(function(){
  		  var validator = $("#attach").validate({
  	  		
  				rules: {
  					allegati: "required"
  				},
  				messages: {
  					allegati: "Campo Obbligatorio"
  					
  				}
  		  });
  	  });
    </script>
</head>

<body>

<div class="body">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:if test="${praticaInstance.allegati}">
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
            <g:each var="index" status="i" in="${praticaInstance.allegati}">
               <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${index.docName}</td>
                    <td><g:formatDate format="dd/MM/yyy" date="${index.dataCreazione}"/></td>
                    <td><g:link action="showDocumento" params="[id:index.id]"><img src="${resource(dir:'images/skin',file:'database_show.png')}" alt="${message(code: 'default.label.table.detail')}" border="0" title="${message(code: 'default.label.table.detail')}" /></g:link></td>
                    <td><g:link action="deleteDocumento" params="[id:index.id,idPratica:praticaInstance.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><img src="${resource(dir:'images/skin',file:'database_delete.png')}" alt="${message(code: 'default.label.table.delete')}" border="0" title="${message(code: 'default.label.table.delete')}" /></g:link></td>
                </tr>
            </g:each>
        </table>

    </fieldset>
</g:if>
    <fieldset>
        <g:uploadForm name="attach">

            <table>
                <tbody>

                <tr class="prop">
                    <td class="name"><g:message code="default.allega.documento" default="Allega"/></td>

                    <td class="value"><input name="allegati" type="file"/></td>

                </tr>

                </tbody>
            </table>

            <div class="buttons">
                <g:hiddenField name="id" value="${praticaInstance?.id}"/>
                <span class="button"><g:actionSubmit class="save" action="saveDocument"
                                                     value="${message(code: 'default.button.save.label', default: 'Salva')}"/></span>
            </div>
        </g:uploadForm>
    </fieldset>
 <div class="navigation">
       <g:link class="button_nav" action="show" params="[id:praticaInstance.id]" ><g:message code="default.label.indietro" /></g:link>
 </div>
</div>

</body>
</html>
