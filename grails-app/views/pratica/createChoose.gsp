<%@ page import="it.solvingteam.doganellaGD.core.Pratica" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" media="all" type="text/css" href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
    <g:set var="entityName" value="${message(code: 'pratica.label', default: 'Pratica')}"/>
    <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
   <g:jqDatepickerLocale lang="it"/>
    <g:javascript src="jQuery/jquery.ui.autocomplete.js"/>
    <g:javascript library="jQuery/jquery.validate" />
    <title><g:message code="label.pratica.crea1" /></title>
    <script type="text/javascript">
    $(document).ready(function() {
        $('#fruitoreid').autocomplete({
            source: "${createLink(action: 'autocompleteSearch')}",
            select: function(event, ui) {
                $("#fruitore").val(ui.item.id);
            }
        });

    });
 
  	  $(document).ready(function(){
  		  var validator = $("#create1").validate({
  	  		
  				rules: {
  			  		 fruitoreid: "required"
  				},
  				messages: {
  					fruitoreid: "Campo Obbligatorio"
  					
  				}
  		  });
  	  });
    </script>
</head>

<body>


<div class="body">
    <h1><g:message code="label.pratica.crea1" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
   
    <g:form action="create" name="create1">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td class="name">
                        <label for="stato.id"><g:message code="pratica.stato.label" default="Stato"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'stato', 'errors')}">
                        <g:radioGroup values="${it.solvingteam.doganellaGD.core.StatoPratica.list()*.id}" name="stato.id" labels="['Pregressa','Ingresso','Uscita']" value="1">
                        <p>${it.radio} ${it.label} </p>
                        </g:radioGroup>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="fruitore"><g:message code="pratica.fruitore.label" default="Fruitore"/><small>(nome o cognome)</small></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                        <g:hiddenField name="fruitore" id="fruitore"/>
                        <g:textField name="fruitoreid" id="fruitoreid"/>
                    </td>
                </tr>
               
                </tbody>
            </table>
        </div>
        <div class="buttons">
        <g:hiddenField name="contenzioso" value="${params.contenzioso }"/>
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.confirm.label', default: 'Conferma')}"/></span>
        </div>
    </g:form>
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
