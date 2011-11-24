<html>
    <head>
        <title>DG</title>
        <link rel="stylesheet" media="all" type="text/css"  href="${resource(dir:'css/redmond', file:'jquery-ui-1.8.13.custom.css')}" />
        <meta name="layout" content="main" />
        <g:javascript src="jQuery/jquery-1.5.1.min.js" />
	    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js" />
       <g:jqDatepickerLocale lang="it" />
    </head>
    <body>
         <div class="body">
            <h1>Cerca</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${praticaInstance}">
            <div class="errors">
                <g:renderErrors bean="${praticaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" controller="pratica">
               
                
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label" default="Numero Protocollo" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                    <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="data"><g:message code="pratica.data.label" default="Data" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'data', 'errors')}">
                                    
                                     <g:jqDatepicker name="data"  changeMonth="true" changeYear="true"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="descrizione"><g:message code="pratica.descrizione.label" default="Descrizione" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'descrizione', 'errors')}">
                                    <g:textField name="descrizione" value="${praticaInstance?.descrizione}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  class="name">
                                  <label for="fruitore"><g:message code="pratica.fruitore.label" default="Nome Cognome" /></label>
                                </td>
                                <td  class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                    <g:textField name="nomecognome"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="result" value="${message(code: 'default.button.search.label', default: 'Cerca')}" /></span>
                </div>
            </g:form>
        </div>
        
        
        
    </body>
</html>
