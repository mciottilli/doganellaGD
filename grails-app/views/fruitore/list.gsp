<%@ page import="it.solvingteam.doganellaGD.core.Fruitore" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'fruitore.label', default: 'Fruitore')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
     <link rel="stylesheet" media="all" type="text/css" href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
    <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
     <script>
        $(function() {
            $("#tabs").tabs({ajaxOptions:{cache:false},cache:false,selected:1})
        });
    </script>
    <g:jqDatepickerLocale lang="it"/>
</head>

<body>


<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div id="tabs">
        <ul>
            <li><a href="#tabs-cerca">Cerca</a></li>
            <li><a href="#tabs-fruitori">Gestione Fruitori</a></li>
            <li><a href="#tabs-contenziosi">Gestione Contenziosi</a></li>
        </ul>
         <div id="tabs-cerca">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${praticaInstance}">
                <div class="errors">
                    <g:renderErrors bean="${praticaInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form method="post" controller="pratica">

                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td class="name">
                                <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label"
                                                                         default="Numero Protocollo"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="data"><g:message code="pratica.data.label" default="Data"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'data', 'errors')}">

                                <g:jqDatepicker name="data" changeMonth="true" changeYear="true"/>
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
                                <label for="fruitore"><g:message code="pratica.fruitore.label"
                                                                 default="Nome Cognome"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                <g:textField name="nomecognome"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="result"
                                                         value="${message(code: 'default.button.search.label', default: 'Cerca')}"/></span>
                    <span class="button"><g:actionSubmit class="save" action="create"
                                                         value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
                </div>
            </g:form>
        </div>

     <div id="tabs-fruitori">
      <div class="list">
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="nome" title="${message(code: 'fruitore.nome.label', default: 'Nome')}"/>

                <g:sortableColumn property="cognome"
                                  title="${message(code: 'fruitore.cognome.label', default: 'Cognome')}"/>

                <g:sortableColumn property="dataNascita"
                                  title="${message(code: 'fruitore.dataNascita.label', default: 'Data Nascita')}"/>

                <g:sortableColumn property="codice"
                                  title="${message(code: 'fruitore.codice.label', default: 'Codice')}"/>
				 <th>Dettaglio</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${fruitoreInstanceList}" status="i" var="fruitoreInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td>${fieldValue(bean: fruitoreInstance, field: "nome")}</td>

                    <td>${fieldValue(bean: fruitoreInstance, field: "cognome")}</td>

                    <td><g:formatDate date="${fruitoreInstance.dataNascita}"/></td>

                    <td>${fieldValue(bean: fruitoreInstance, field: "codice")}</td>
                    <td><g:link action="show" id="${fruitoreInstance.id}"><img src="${resource(dir:'images/skin',file:'database_show.png')}" alt="${message(code: 'default.label.table.detail')}" border="0" title="${message(code: 'default.label.table.detail')}" /></g:link></td>

                </tr>
            </g:each>
            </tbody>
        </table>
  

    	<div class="paginateButtons">
        	<g:paginate total="${fruitoreInstanceTotal}"/>
    	</div>
    	<g:form>
	    	<div class="buttons">
	          <span class="button"><g:actionSubmit class="save" action="create" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
	        </div>
	   </g:form>
	</div>
  </div>

     
        <div id="tabs-contenziosi">
             <g:if test="${flash.message}">
      			 <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${praticaInstance}">
                <div class="errors">
                    <g:renderErrors bean="${praticaInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form method="post" controller="pratica">

                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td class="name">
                                <label for="numeroProtocollo"><g:message code="pratica.numeroProtocollo.label"
                                                                         default="Numero Protocollo"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'numeroProtocollo', 'errors')}">
                                <g:textField name="numeroProtocollo" value="${praticaInstance?.numeroProtocollo}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="data"><g:message code="pratica.data.label" default="Data"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'data', 'errors')}">

                                <g:jqDatepicker name="data" changeMonth="true" changeYear="true"/>
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
                                <label for="fruitore"><g:message code="pratica.fruitore.label"
                                                                 default="Nome Cognome"/></label>
                            </td>
                            <td class="value ${hasErrors(bean: praticaInstance, field: 'fruitore', 'errors')}">
                                <g:textField name="nomecognome"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="resultContenzioso" value="${message(code: 'default.button.search.label', default: 'Cerca')}"/></span>
                </div>
            </g:form>
        </div>
        </div>
</div>
</body>
</html>
