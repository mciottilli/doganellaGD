<%@ page import="it.solvingteam.doganellaGD.core.Fruitore" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'fruitore.label', default: 'Fruitore')}"/>
    <title><g:message code="label.fruitore.lista" /></title>
     <link rel="stylesheet" media="all" type="text/css" href="${resource(dir: 'css/redmond', file: 'jquery-ui-1.8.13.custom.css')}"/>
    <g:javascript src="jQuery/jquery-1.5.1.min.js"/>
    <g:javascript src="jQuery/jquery-ui-1.8.12.custom.min.js"/>
    
    <g:jqDatepickerLocale lang="it"/>
</head>

<body>


<div class="body">
    <h1><g:message code="label.fruitore.lista" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
   
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
                    <td><g:link action="show" params="[max:params.max,offset:params.offset]" id="${fruitoreInstance.id}"><img src="${resource(dir:'images/skin',file:'database_show.png')}" alt="${message(code: 'default.label.table.detail')}" border="0" title="${message(code: 'default.label.table.detail')}" /></g:link></td>

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

</body>
</html>
