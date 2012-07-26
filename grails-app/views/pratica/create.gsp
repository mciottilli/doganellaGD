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
      
   <g:javascript library="jQuery/jquery.validate" />
   
    <title><g:message code="label.pratica.crea2" /></title>
   <script type="text/javascript">
 
  	  $(document).ready(function(){
  		  var validator = $("#create2").validate({
  	  		
  				rules: {
  					dataAcquisizione: "required"
  				},
  				messages: {
  					dataAcquisizione: "Campo Obbligatorio"
  					
  				}
  		  });
  	  });
    </script>
</head>

<body>


<div class="body">
    <h1><g:message code="label.pratica.crea2" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${praticaInstance}">
        <div class="errors">
            <g:renderErrors bean="${praticaInstance}" as="list"/>
        </div>
    </g:hasErrors>
     <g:hasErrors bean="${cmd}">
            <div class="errors">
                <g:renderErrors bean="${cmd}" as="list" />
            </div>
            </g:hasErrors>
    <g:form action="save" name="create2">
        <div class="dialog">
            <table>
                <tbody>
					
			<tr class="prop">
                    <td class="name">
                        <label for="stato"><g:message code="pratica.stato.label" default="Stato"/></label>
                    </td>
                    <td class="value">
                        ${praticaInstance?.stato?.descrizione}
                        <g:hiddenField name="stato.id" value="${praticaInstance?.stato?.id}"/>
                    </td>
                </tr>
   				<tr class="prop">
                    <td class="name">
                        <label for="fruitore"><g:message code="pratica.fruitore.label" default="Fruitore"/></label>
                    </td>
                    <td class="value">
                        ${praticaInstance?.fruitore?.codice} ${praticaInstance?.fruitore?.nome} ${praticaInstance?.fruitore?.cognome}
                        <g:hiddenField name="fruitore" id="fruitore" value="${praticaInstance?.fruitore?.id}"/>
                        
                    </td>
                </tr>
                <g:if test="${praticaInstance.stato?.descrizione == it.solvingteam.doganellaGD.core.StatoPratica.PREGRESSA}">
                <tr class="prop">
                    <td class="name">
                        <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label" default="Numero Protocollo"/></label>
                    </td>
                    <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                    <g:if test="${praticaInstance?.stato?.descrizione == it.solvingteam.doganellaGD.core.StatoPratica.PREGRESSA}">
                        <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                    </g:if>
                   
                    </td>
                </tr>
				</g:if>
                <tr class="prop">
                            <td class="name">
                                <label for="dataAcquisizione"><g:message code="pratica.dataAcquisizione.label" default="Data Acquisizione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'dataAcquisizione', 'errors')}">

                                <g:jqDatepicker name="dataAcquisizione" changeMonth="true" changeYear="true"/>
                            </td>
                        </tr>
                         <tr class="prop">
                            <td class="name">
                                <label for="dataAccettazione"><g:message code="pratica.dataAccettazione.label" default="Data Accettazione"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'dataAccettazione', 'errors')}">

                                <g:jqDatepicker name="dataAccettazione" changeMonth="true" changeYear="true"/>
                            </td>
                        </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="descrizione"><g:message code="pratica.descrizione.label"
                                                            default="Descrizione"/></label>
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
                     <td valign="top" class="name">
                         <label for="contenzioso"><g:message code="pratica.contenzioso.label" default="Contenzioso" /></label>
                     </td>
                     <td valign="top" class="value ${hasErrors(bean: praticaInstance, field: 'contenzioso', 'errors')}">
                         <g:checkBox name="contenzioso" value="${praticaInstance?.contenzioso}" />
                     </td>
                 </tr>
 					
                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.confirm.label', default: 'Conferma')}"/></span>
        </div>
    </g:form>
     <div class="navigation">
        <g:link class="button_nav" action="createChoose" ><g:message code="default.label.indietro" /></g:link>
    </div>
</div>
</body>
</html>
